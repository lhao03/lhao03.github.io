--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}

import Control.Applicative (Alternative (..))
import Control.Monad (forM_, liftM, zipWithM_, (>=>))
import qualified Data.HashMap.Strict as HM
import Data.Hashable (Hashable, hashWithSalt)
import Data.List
  ( findIndex,
    intercalate,
    isInfixOf,
    isPrefixOf,
    isSuffixOf,
    sort,
    sortBy,
    tails,
  )
import Data.Maybe (fromMaybe, isNothing)
import Data.Monoid (mappend)
import Data.Time.Clock (UTCTime)
import Data.Time.Format (defaultTimeLocale, parseTimeM)
import GHC.IO.Encoding (setLocaleEncoding, utf8)
import Hakyll
import Hakyll.Web.Sass (sassCompiler)
import System.Environment (lookupEnv)
import System.FilePath (takeFileName)
import System.FilePath.Posix
  ( splitFileName,
    takeBaseName,
    takeDirectory,
    (</>),
  )
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

--------------------------------------------------------------------------------
config :: Configuration
config =
  defaultConfiguration
    { deployCommand = "git checkout hakyll && stack clean && stack build && stack exec site clean && stack exec site build && git add . && git commit -m 'publish' && git push",
      destinationDirectory = "docs"
    }

main :: IO ()
main = hakyllWith config $ do
  match "images/**" $ do
    route idRoute
    compile copyFileCompiler

  match "css/*.otf" $ do
    route idRoute
    compile copyFileCompiler

  scssDependency <- makePatternDependency "css/**.scss"
  rulesExtraDependencies [scssDependency] $
    match "css/main.scss" $
      do
        route $ setExtension "css"
        compile (fmap compressCss <$> sassCompiler)

  match (fromList ["papers.adoc", "log.adoc"]) $ do
    route appendIndex
    compile $
      pandocCompilerWithAsciidoctor
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

  match "404.html" $ do
    route idRoute
    compile $
      pandocCompilerWithAsciidoctor
        >>= loadAndApplyTemplate "templates/default.html" defaultContext

  -- build up tags
  tags <- buildTags "posts/**" (fromCapture "tags/*.html")

  allPosts <- getMatches "posts/**"
  let sortedPosts = sortIdentifiersByDate allPosts
      -- build hashmap of prev/next posts
      (prevPostHM, nextPostHM) = buildAdjacentPostsHashMap sortedPosts

  tagsRules tags $ \tag pattern -> do
    let title = "Posts tagged \"" ++ tag ++ "\""
    route appendIndex
    compile $ do
      posts <- recentFirst =<< loadAll pattern
      let ctx =
            constField "title" title
              `mappend` listField "posts" (postCtxWithTags tags) (return posts)
              `mappend` defaultContext

      makeItem ""
        >>= loadAndApplyTemplate "templates/tag.html" ctx
        >>= loadAndApplyTemplate "templates/default.html" ctx
        >>= relativizeUrls
        >>= cleanIndexUrls

  match "posts/**" $ do
    route appendIndex
    compile $ do
      let postContext =
            field "nextPost" (lookupPostUrl nextPostHM)
              `mappend` field "prevPost" (lookupPostUrl prevPostHM)
              `mappend` postCtxWithTags tags
	      `mappend` constField "isPost" "yes"

      pandocCompilerWithAsciidoctor
        >>= loadAndApplyTemplate "templates/post.html" postContext
        >>= loadAndApplyTemplate "templates/default.html" postContext
        >>= relativizeUrls

  match "courses/**" $ do
    route appendIndex
    compile $ do
      pandocCompilerWithAsciidoctor
        >>= loadAndApplyTemplate "templates/post.html" postCtx
        >>= loadAndApplyTemplate "templates/default.html" postCtx
        >>= relativizeUrls

  create ["archive.html"] $ do
    route appendIndex
    compile $ do
      posts <- recentFirst =<< loadAll "posts/**"
      let archiveCtx =
            listField "posts" postCtx (return posts)
              `mappend` constField "title" "Archives"
              `mappend` mainCtx tags "posts/**"
              `mappend` defaultContext

      makeItem ""
        >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
        >>= loadAndApplyTemplate "templates/default.html" archiveCtx
        >>= relativizeUrls
        >>= cleanIndexUrls

  match "index.markdown" $ do
    route $ setExtension "html"
    compile $ do
      let indexCtx =
            listField "posts" postCtx (recentFirst =<< loadAll "posts/*")
              `mappend` listField "courses" postCtx (recentFirst =<< loadAll "courses/**")
              `mappend` defaultContext

      getResourceString
        >>= renderPandoc
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

  match "templates/*" $ compile templateBodyCompiler

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
  dateField "date" "%B %e, %Y"
    `mappend` dropIndexHtml "url"
    `mappend` defaultContext

postItems :: Pattern -> Compiler [Item String]
postItems postsPattern = do
  identifiers <- getMatches postsPattern
  return [Item identifier "" | identifier <- identifiers]

previewCtx :: Tags -> Context String
previewCtx tags = teaserField "preview" "content" <> postCtxWithTags tags

mainCtx :: Tags -> Pattern -> Context String
mainCtx tags postsPattern =
  let recentPosts = postItems postsPattern >>= fmap (take 5) . recentFirst
   in listField "recentPosts" (previewCtx tags) recentPosts
        <> tagCloudField "tagCloud" 100 200 tags
        <> defaultContext

postCtxWithTags :: Tags -> Context String
postCtxWithTags tags =
  tagsField "tags" tags
    `mappend` dropIndexHtml "url"
    `mappend` postCtx

pandocCompilerWithAsciidoctor :: Compiler (Item String)
pandocCompilerWithAsciidoctor = do
  extension <- getUnderlyingExtension
  if extension == ".adoc"
    then getResourceString >>= withItemBody (unixFilter "asciidoctor" ["-e", "-a", "skip-front-matter", "-"])
    else pandocCompiler

appendIndex :: Routes
appendIndex = customRoute createIndexRoute
  where
    createIndexRoute ident = takeDirectory p </> takeBaseName p </> "index.html"
      where
        p = toFilePath ident

dropIndexHtml :: String -> Context a
dropIndexHtml key = mapContext transform (urlField key)
  where
    transform url = case splitFileName url of
      (p, "index.html") -> takeDirectory p
      _ -> url

cleanIndexUrls :: Item String -> Compiler (Item String)
cleanIndexUrls = return . fmap (withUrls clean)
  where
    idx = "index.html"
    clean url
      | idx `isSuffixOf` url = take (length url - length idx) url
      | otherwise = url

----
type AdjPostHM = HM.HashMap Identifier Identifier

instance Hashable Identifier where
  hashWithSalt salt = hashWithSalt salt . show

buildAdjacentPostsHashMap :: [Identifier] -> (AdjPostHM, AdjPostHM)
buildAdjacentPostsHashMap posts =
  let buildHM :: [Identifier] -> [Identifier] -> AdjPostHM
      buildHM [] _ = HM.empty
      buildHM _ [] = HM.empty
      buildHM (k : ks) (v : vs) = HM.insert k v $ buildHM ks vs
   in (buildHM (tail posts) posts, buildHM posts (tail posts))

lookupPostUrl :: AdjPostHM -> Item String -> Compiler String
lookupPostUrl hm post =
  let ident = itemIdentifier post
      ident' = HM.lookup ident hm
   in (fmap (maybe empty toUrl) . maybe empty getRoute) ident'

---
sortIdentifiersByDate :: [Identifier] -> [Identifier]
sortIdentifiersByDate = sortBy (flip byDate)
  where
    byDate id1 id2 =
      let fn1 = takeFileName $ toFilePath id1
          fn2 = takeFileName $ toFilePath id2
          parseTime' fn = parseTimeM True defaultTimeLocale "%Y-%m-%d" $ intercalate "-" $ take 3 $ splitAll "-" fn
       in compare (parseTime' fn1 :: Maybe UTCTime) (parseTime' fn2 :: Maybe UTCTime)
