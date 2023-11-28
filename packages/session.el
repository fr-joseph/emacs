;; -*- lexical-binding: t; -*-

(recentf-mode 1)
(add-to-list 'recentf-exclude
             (recentf-expand-file-name no-littering-var-directory))
(add-to-list 'recentf-exclude
             (recentf-expand-file-name no-littering-etc-directory))

;; use M-n/M-p to go forward/back in history in minibuffer
(setq history-length 100)
(savehist-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

(use-package undo-tree
  :diminish
  :config
  (global-undo-tree-mode 1))

;; (info "(emacs) Saving Emacs Sessions")
;; set to 0, so we can manually save and load sessions
(desktop-save-mode 0)

;; This alist is the default value of the FILTERS argument of
;; `frameset-save' and `frameset-restore'.
;; Initially, `frameset-filter-alist' is set to, and shares the value of,
;; `frameset-persistent-filter-alist'.  You can override any item in
;; this alist by `push'ing a new item onto it.
(dolist (frame-param '(font background-color foreground-color))
  (push `(,frame-param . :never) frameset-filter-alist)
  )
