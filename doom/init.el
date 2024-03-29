;;; init.el -*- lexical-binding: t; -*-

(doom! :input
       ;;chinese
       ;;japanese
       :completion company              ; the ultimate code completion backend
       ;;helm              ; the *other* search engine for love and life
       ;;ido               ; the other *other* search engine...
       ivy                              ; a search engine for love and life
       :ui

       ;;deft              ; notational velocity for Emacs
       (emoji +unicode) doom  ; what makes DOOM look the way it does
       doom-dashboard         ; a nifty splash screen for Emacs
       doom-quit              ; DOOM quit-message prompts when you quit Emacs
       ;;fill-column       ; a `fill-column' indicator
       hl-todo     ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;hydra
       ;;indent-guides     ; highlighted indent columns
       ;;minimap           ; show a map of the code on the side
       modeline    ; snazzy, Atom-inspired modeline, plus API
       ;;nav-flash         ; blink cursor line after big motions
       ;;neotree           ; a project drawer, like NERDTree for vim
       ophints                    ; highlight the region an operation acts on
       (popup +defaults)          ; tame sudden yet inevitable temporary windows
       ;; (ligatures +fira) ;; TODO they are somewhat ugly, fix it
       ;;tabs              ; a tab bar for Emacs
       treemacs                      ; a project drawer, like neotree but cooler
       ;;unicode           ; extended unicode support for various languages
       vc-gutter              ; vcs diff in the fringe
       vi-tilde-fringe        ; fringe tildes to mark beyond EOB
       ;;window-select     ; visually switch windows
       workspaces             ; tab emulation, persistence & separate workspaces
       zen                    ; distraction-free coding or writing
       :editor (evil +everywhere)     ; come to the dark side, we have cookies
       file-templates                 ; auto-snippets for empty files
       fold                           ; (nigh) universal code folding
       ;;(format +onsave)  ; automated prettiness
       ;;god               ; run Emacs commands without modifier keys
       ;;lispy             ; vim for lisp, for people who don't like vim
       ;;multiple-cursors  ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       ;;rotate-text       ; cycle region at point between text candidates
       snippets   ; my elves. They type so I don't have to
       ;;word-wrap         ; soft wrapping with language-aware indent
       :emacs dired      ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       ;;ibuffer         ; interactive buffer management
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree
       :term eshell      ; the elisp shell that works everywhere
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs
       vterm                         ; the best terminal emulation in Emacs
       :checkers syntax              ; tasing you for every semicolon you forget
       ;; (spell +flyspell)             ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make
       :tools
       ;;ansible
       ;;debugger          ; stepping through code, to help you add bugs
       ;;direnv
       ;;docker
       ;;editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame Jupyter notebooks with emacs

       ;;gist              ; interacting with github gists
       (lookup +dictionary +offline)  ; navigate your code and its documentation
       lsp
       ;;macos             ; MacOS-specific commands
       (magit +forge)           ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       ;;pdf               ; pdf enhancements
       ;;prodigy           ; managing external services & code builders
       ;;rgb               ; creating color strings
       ;;taskrunner        ; taskrunner for all your projects
       ;;terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp
       :os
       ;;tty               ; improve the terminal Emacs experience
       :lang (yaml +lsp)                ; JSON, but readable
       (json +lsp)                      ; At least it ain't XML
       (markdown +grip)                 ; writing docs for people to ignore
       (org                             ; organize your plain life in plain text
        +dragndrop +roam2 +journal +pretty)
       (dart +flutter +lsp)           ; paint ui and not much else
       emacs-lisp                     ; drown in parentheses
       (javascript +lsp)              ; all(hope(abandon(ye(who(enter(here))))))
       (kotlin +lsp)                  ; a better, slicker Java(Script)
       (csharp +lsp)           ; unity, .NET, and mono shenanigans
       (python +lsp +poetry +pyenv)   ; beautiful is better than ugly
       (lua +lsp)                           ; one-based indices? one-based indices
       nim                            ; python + lisp at the speed of c
       (sh +lsp +powershell +fish)   ; she sells {ba,z,fi}sh shells on the C xor
       web                              ; the tubes
       ;;agda              ; types of types of types of types...
       ;;cc                ; C/C++/Obj-C madness
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;data              ; config/data formats
       ;; elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       ;;erlang            ; an elegant language for a more civilized age
       ;;ess               ; emacs speaks statistics
       ;;faust             ; dsp, but you get to keep your soul
       ;;fsharp            ; ML stands for Microsoft's Language
       ;;fstar             ; (dependent) types and (monadic) effects and Z3
       ;;gdscript          ; the language you waited for
       ;; (go +lsp)          ; the hipster dialect
       ;;(haskell +dante)  ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ;
       ;;(java +meghanada) ; the poster child for carpal tunnel syndrome
       ;;julia             ; a better, faster MATLAB
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;lean
       ;;factor
       ;;ledger            ; an accounting system in Emacs
       ;;nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       ;;rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       ;; ruby     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;;rust              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;; scala             ; java, but good
       ;;scheme            ; a fully conniving family of lisps
       ;;sml
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       :email
       ;;(mu4e +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)
       :app
       ;;calendar
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought
       :config
       ;;literate
       (default +bindings +smartparens))
