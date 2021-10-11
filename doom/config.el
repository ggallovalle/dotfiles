;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(add-hook 'text-mode-hook #'auto-fill-mode) ;automatically wrap lines when certain number line reached
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font"
                           :size 14) display-line-numbers-type 'relative)
;; unset a bunch of not useful bindings
(map! :map help-map
      "C" nil "g" nil "I" nil "C-\\" nil "C-a" nil ; about emacs
      "C-c" nil "C-d" nil "C-e" nil "C-f" nil "C-k" nil "C-l" nil "C-n" nil "C-o" nil "C-p" nil
      "C-s" nil "C-t" nil "C-w" nil "help" nil)
;; ------------------------------------------------
;; -------------- font ligatures  -----------------
;; ------------------------------------------------
(after! go-mode   ; in this case the major mode and package named the same thing
  (set-ligatures! 'go-mode
                  :def "func"           ; function keyword
                  :true "true"
                  :false "false"
                                        ; this will replace not only definitions
                                        ; but coresponding functions aswell
                  :int "int"
                  :str "string"
                  :float "float"
                  :bool "bool"
                  :for "for"
                  :return "return"
                  :yeild "yeild")) ;; -------------- package configs -----------------
;; ------------------------------------------------

;; org-mode

(setq org-fontify-emphasized-text t org-directory "~/org/" org-tag-faces '(("WARN" . org-warning)
                                                                           ("NOTE" . org-list-dt)
                                                                           ("PROCONS" .
                                                                            org-verbatim))
                                        ; roam
      org-roam-directory "~/roam/"
                                        ; journal
      org-journal-date-prefix "#+TITLE: " org-journal-time-prefix "* " org-journal-date-format
      "%a, %Y-%m-%d" org-journal-file-format "%Y-%m-%d.org")

;; (use-package! org-roam
;;   :custom (org-roam-capture-templates '(("d" "default" plain "%?"
;;                                          :unnarrowed t
;;                                          :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                             "#+title: ${title}\n"))
;;                                         ;; Shells
;;                                         ("s" "Shells")
;;                                         ("s," "root" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "shell/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("sh" "Bash" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "shell/bash/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("sf" "Fish" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "shell/fish/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("sp" "PowerShell" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "shell/powershell/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ;; Prorgamming Languages
;;                                         ("l" "Programming Languages")
;;                                         ("l~" "root" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lc" "Starts with C")
;;                                         ("lcs" "C#" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/csharp/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lcp" "C++" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/cpp/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("ld" "Dart" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/dart/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("le" "Starts with E")
;;                                         ("lel" "Elixir" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/elixir/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("ler" "Erlang" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/erlang/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lf" "F#" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/fsharp/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lg" "Go" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/go/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lj" "Starts with J")
;;                                         ("lja" "Java" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/java/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("ljs" "JavaScript & TypeScript" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/js/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lk" "Kotlin" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/kotlin/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("ll" "Starts with L")
;;                                         ("lli" "Lisp" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/lisp/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("llu" "Lua" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/lua/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("ln" "Nim" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/nim/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lp" "Starts with P")
;;                                         ("lph" "PHP" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/php/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lpy" "Python" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/python/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lr" "Starts with R")
;;                                         ("lrs" "Rust" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/rust/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lrr" "R" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/r/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("lrb" "Ruby" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/ruby/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n"))
;;                                         ("ls" "Scala" plain "%?"
;;                                          :unnarrowed t
;;                                          :target (file+head
;;                                                   "programming-languages/scala/%<%Y%m%d%H%M%S>-${slug}.org"
;;                                                   "#+title: ${title}\n")))))

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))
;; org-roam-ui
(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config (setq org-roam-ui-sync-theme t org-roam-ui-follow t org-roam-ui-update-on-save t
                org-roam-ui-open-on-start t))
;; auth

(setq auth-sources '("~/.authinfo") user-full-name "Gerson Gallo" user-mail-address
      "ggallovalle@gmail.com")
;; projectile

(setq projectile-project-search-path '("~/ghq/github.com/ggallovalle/"))
(put 'projectile-project-test-cmd 'safe-local-variable #'stringp)
(put 'projectile-project-run-cmd 'safe-local-variable #'stringp)

;; flyspell
(setq flyspell-lazy-idle-seconds 2)

;; dired

;; (evil-collection-define-key 'normal 'dired-mode-map
;;   "h" 'dired-up-directory
;;   "l" 'dired-find-file)
