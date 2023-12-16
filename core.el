;; -*- lexical-binding: t; -*-

;; -------------------------------------------------------------------
;; packge archives
;; -------------------------------------------------------------------

(require 'package)
(setq package-user-dir (expand-file-name (locate-user-emacs-file "var/elpa"))
      package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         )
      package-archive-priorities '(("melpa" . 4)
                                   ("elpa" . 3)
                                   ("org" . 2)
                                   ("nongnu" . 1))
      )

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(setq use-package-verbose nil
      use-package-always-ensure t)

;; -------------------------------------------------------------------
;; no littering
;; -------------------------------------------------------------------

(use-package no-littering)
(no-littering-theme-backups)

(setq custom-file (no-littering-expand-etc-file-name "custom.el"))
(load custom-file 'noerror 'nomessage)

;; -------------------------------------------------------------------
;; my settings
;; -------------------------------------------------------------------

;; buffer-local defaults
(setq-default
 cursor-type '(bar . 1)
 fill-column 70
 indent-tabs-mode nil ; use space instead of TAB for indent
 tab-width 2
 truncate-lines t ; disable virtual line wrap
 word-wrap nil
 )

;; global settings
(setq

 even-window-sizes nil ; don't resize windows to be equal-sized
 inhibit-startup-message t
 initial-scratch-message nil
 tab-always-indent t ; TAB always indents, even if point mid-line
 truncate-partial-width-windows nil ; respect truncate-lines
 visible-bell t

 ;; display-buffer-base-action '(display-buffer-reuse-mode-window
 ;;                              display-buffer-reuse-window
 ;;                              display-buffer-same-window)

 eval-expression-print-level nil ; no limit
 eval-expression-print-length nil ; no limit

 native-comp-async-report-warnings-errors 'silent
 read-process-output-max (* 1024 1024) ; match /proc/sys/fs/pipe-max-size
 gc-cons-threshold (* 50 1000 1000)

 initial-buffer-choice fj/initial-buffer-choice
 trash-directory (expand-file-name fj/trash-directory)

 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program fj/browser

 fj/desktop-dir (locate-user-emacs-file "var/desktop/")
 desktop-base-file-name "emacs-desktop-session.el"
 desktop-base-lock-name "emacs-desktop-session.lock"

 helpful-max-buffers 3

 )


(use-package emacs
  :custom
  (help-at-pt-timer-delay 0.25) ; seconds to wait before showing help at point
  (help-at-pt-display-when-idle t) ; auto show local help on point-over, e.g. for org-mode links
  )

(set-default-coding-systems 'utf-8)

(column-number-mode)


;; TODO: clean up hooks for various modes
;;       avoid having to undo previous hook
;;       for derived modes

(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; (dolist (mode '(
;;                 prog-mode-hook
;;                 text-mode-hook
;;                 helpful-mode-hook
;;                 messages-buffer-mode-hook
;;                 ))
;;   (add-hook mode (lambda () (cmd-mode 1))))

;; ;; override some modes which derive from the above
;; (dolist (mode '(git-commit-mode-hook))
;;   (add-hook mode (lambda () (cmd-mode 0))))

(auto-fill-mode 1)
(blink-cursor-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-hl-line-mode t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(tool-bar-mode -1)
(tooltip-mode -1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; make gc pauses faster by decreasing the threshold
(add-hook 'after-init-hook (lambda ()
                             (setq gc-cons-threshold (* 2 1000 1000))))

(add-hook
 'emacs-startup-hook
 (lambda () (message "%s"
                     (format "Emacs loaded in %s with %d garbage collections"
                             (format "%.2f seconds"
                                     (float-time
                                      (time-subtract
                                       after-init-time
                                       before-init-time)))
                             gcs-done))))

(add-hook 'emacs-startup-hook (lambda ()
                                (setq-default lexical-binding t)))

(use-package diminish)
