;; -*- lexical-binding: t; -*-

(use-package keycast)

(use-package all-the-icons)
;; one-time setup: M-x all-the-icons-install-fonts

(use-package all-the-icons-nerd-fonts
  :after all-the-icons
  :config (all-the-icons-nerd-fonts-prefer))

(use-package vertico
  :config
  (vertico-mode)
  (setq vertico-cycle t
        enable-recursive-minibuffers t
        completion-in-region-function
        (lambda (&rest args)
          (apply (if vertico-mode
                     #'consult-completion-in-region
                   #'completion--in-region)
                 args))
        )
  )

(use-package orderless
  :config
  (setq completion-styles '(orderless basic)
        completion-category-overrides
        '((file (styles basic partial-completion)))))

(use-package consult)

(use-package consult-dir
  :after consult
  )

;; TODO: other consult packages
;; consult-tex                 Consult powered completion for tex
;; consult-todo                Search hl-todo keywords in consult
;; consult-eglot               A consulting-read interface for eglot
;; consult-flycheck            Provides the command `consult-flycheck'
;; consult-org-roam            Consult integration for org-roam
;; consult-yasnippet           A consulting-read interface for yasnippet


(use-package marginalia
  :after vertico
  :config
  (marginalia-mode))

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup))

(use-package helpful
  :bind
  ([remap describe-function] . helpful-callable) ; functions & macros
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(use-package key-chord
  :config
  (key-chord-mode 1)

  (setq key-chord-two-keys-delay 0.1 ; default 0.1
        key-chord-one-key-delay 0.2) ; default 0.2

  ;; unless in cmd-mode, use `jk/kj' to enter cmd-mode
  ;; if in cmd-mode, should use `i' to exit cmd-mode
  (key-chord-define-global "jk" (lambda () (interactive)
                                  (if cmd-mode "jk" (cmd-mode))))
  (key-chord-define-global "kj" (lambda () (interactive)
                                  (if cmd-mode "kj" (cmd-mode))))
  )

(use-package embark
  :after vertico
  :config
  (setq prefix-help-command #'embark-prefix-help-command
        ;; show all available information in the eldoc echo area:
        ;; eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly
        )
  ;; show embark targets in the eldoc echo area
  ;;(add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  )

(use-package embark-consult
  :after embark
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package wgrep
  :after consult
  :hook (grep-mode . wgrep-setup))

(use-package flyspell-correct
  :after flyspell
  ;;:bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper))
  )

(use-package flyspell-correct-avy-menu
  :after (flyspell-correct avy))

(use-package consult-flyspell
  :after (consult flyspell flyspell-correct flyspell-correct-avy-menu)
  :config
  (setq
   ;;consult-flyspell-select-function nil
   consult-flyspell-select-function
   (lambda () (flyspell-correct-at-point) (consult-flyspell))
   consult-flyspell-set-point-after-word t
   consult-flyspell-always-check-buffer nil
   ))
