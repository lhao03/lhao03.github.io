(TeX-add-style-hook
 "2023-01-19-cpsc539b-notes"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:orge60f8d7"
    "sec:orga660a4c"
    "sec:org94ca3aa"
    "sec:org149403c"
    "sec:org3cb47f3"
    "sec:orgba10307"
    "sec:orgb7f303f"
    "sec:orgc6c7588"
    "sec:org32708e1"
    "sec:orgbe0c883"
    "sec:orgb027f56"
    "sec:org19fd38b"
    "sec:org57ce461"
    "sec:org7ebd13a"
    "sec:orge39d8bc"
    "sec:org0c812c4"
    "sec:orge165765"
    "sec:org3530369"
    "sec:org3a56e3e"
    "sec:orgedda38a"
    "sec:org4a3c66d"
    "sec:orgc5665cc"
    "sec:org1cbd71e"
    "sec:orga383d90"
    "sec:org58c09fc"
    "sec:org738588c"
    "sec:org9e1be6f"
    "sec:org9629e5c"
    "sec:orgc949956"
    "sec:org19e7d0a"
    "sec:org3f9d011"))
 :latex)

