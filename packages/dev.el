;; -*- lexical-binding: t; -*-

(use-package magit
  :commands (magit-status)
  :custom
  ;; display magit as a full screen, rather than splitting half/half:
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  )

(use-package hl-todo
  :hook ((org-mode prog-mode) . hl-todo-mode)
  :config
  (add-to-list 'hl-todo-keyword-faces '("TODO" . "#ff9000"))
  (add-to-list 'hl-todo-keyword-faces '("NEXT" . "#ff0000"))
  (add-to-list 'hl-todo-keyword-faces '("WIP" . "#ff0000"))
  )

(use-package magit-todos
  :after magit
  :config
  (setq magit-todos-exclude-globs '(".git/" "sys/etc/")
        magit-todos-keywords-list '("TODO" "NEXT" "WIP" "FIXME" "BUG" "HACK")
        magit-todos-fontify-org nil)
  (magit-todos-mode 1)
  )

(use-package elisp-def
  :hook ((emacs-lisp-mode) . elisp-def-mode)
  :diminish)

(use-package fsharp-mode)

(use-package eglot-fsharp)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package eglot
  :config
  (setq eglot-autoshutdown t
        eglot-confirm-server-initiated-edits 'confirm))

(use-package flycheck
  :defer t
  :hook ((eglot-mode . flycheck-mode)))

(use-package rainbow-mode
  :defer t
  :diminish
  :hook (org-mode emacs-lisp-mode))

(diminish 'eldoc-mode)
