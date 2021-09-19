;; -*- no-byte-compile: t; -*-
(package! evil-tutor)
(package! command-log-mode)
(package! elisp-format)

;; org-roam-ui
(unpin! org-roam)
(package! websocket)
(package! org-roam-ui :recipe (:host github :repo "org-roam/org-roam-ui" :files ("*.el" "out")))
