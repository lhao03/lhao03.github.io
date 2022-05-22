--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}

import Data.List
  ( intercalate,
    isInfixOf,
    isPrefixOf,
    isSuffixOf,
    sort,
  )
import Data.Monoid (mappend)
import Hakyll
import Hakyll.Web.Sass (sassCompiler)
import System.FilePath.Posix
  ( splitFileName,
    takeBaseName,
    takeDirectory,
    takeFileName,
    (</>),
  )

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

  match (fromList ["papers.adoc"]) $ do
    route appendIndex
    compile $
      pandocCompilerWithAsciidoctor
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls

  match "404.md" $ do
    route appendIndex
    compile $
      pandocCompilerWithAsciidoctor
        >>= loadAndApplyTemplate "templates/default.html" defaultContext

  -- build up tags
  tags <- buildTags "posts/**" (fromCapture "tags/*.html")

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
    compile $
      pandocCompilerWithAsciidoctor
        >>= loadAndApplyTemplate "templates/post.html" (postCtxWithTags tags)
        >>= loadAndApplyTemplate "templates/default.html" (postCtxWithTags tags)
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
              `mappend` listField "courses" (postCtxWithTags tags) (recentFirst =<< loadAll "posts/courses/**")
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
