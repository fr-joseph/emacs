;; -*- lexical-binding: t; -*-

(fj/disable-modified-keys
 '("" "C-" "M-" "S-" "s-" "C-M-" "C-S-" "C-M-S-")
 '("<left>" "<right>" "<up>" "<down>" "<escape>"))

(use-package general
  :config

  (general-auto-unbind-keys)

  (general-def
    "C-;" 'execute-extended-command
    "M-;" 'eval-expression
    "C-h B" 'embark-bindings
    "TAB" 'completion-at-point
    "C-c h" 'fj/helpful-at-point
    )

  (general-def override
    "C-." 'embark-act
    "M-." 'embark-dwim
    ;; "M-j" 'windmove-down
    ;; "M-k" 'windmove-up
    ;; "M-h" 'windmove-left
    ;; "M-l" 'windmove-right
    "M-o" 'ace-window
    )

  (general-def embark-file-map
    "C-c C-e" 'fj/decode-document-for-espeak
    "C-c C-s" 'fj/sudo-find-file
  )

  (general-def isearch-mode-map
    "C-n" 'isearch-repeat-forward
    "C-p" 'isearch-repeat-backward
    "C-g" 'isearch-abort
    "RET" 'isearch-exit
    "C-e" 'isearch-edit-string
    )

  (general-def cmd-mode-map
    "i" 'cmd-mode

    "I" 'fj/indent-buffer

    "o" 'ace-window

    "m" 'set-mark-command
    "M" 'er/mark-paragraph
    "v" 'rectangle-mark-mode
    "z" 'exchange-point-and-mark

    "x" 'er/expand-region
    "X" 'er/contract-region

    "a" 'move-beginning-of-line
    "e" 'move-end-of-line

    "cb" 'consult-buffer ; `b SPC' or `f SPC' to filter buffers/files only
    "cF" 'consult-buffer-other-frame
    "co" 'consult-buffer-other-window

    "cl" 'consult-line
    "cL" 'consult-line-multi

    "cf" 'consult-find
    "cr" 'consult-recent-file
    "cg" 'consult-ripgrep

    "ci" 'consult-imenu
    "ch" 'consult-org-heading
    "cO" 'consult-outline

    "cm" 'consult-mark
    "cB" 'consult-bookmark
    "cxbd" 'bookmark-delete

    "cM" 'consult-man
    "cI" 'consult-info

    ;;"ck" 'consult-flymake
    "cxmm" 'consult-minor-mode-menu ; `i SPC' to filter by active modes
    "cy" 'consult-yank-from-kill-ring

    "f" 'avy-goto-char-in-line
    "n" 'isearch-forward
    "p" 'isearch-backward
    "s" 'avy-isearch

    "g" 'fj/avy-goto-line-beginning
    "T" 'avy-copy-region

    "(" 'er/mark-outside-pairs
    ")" 'er/mark-inside-pairs

    "l" 'forward-char
    "h" 'backward-char
    "j" 'next-line
    "k" 'previous-line

    "J" 'join-line

    "K" 'kill-line
    "D" 'kill-region
    "t" 'kill-ring-save
    "y" 'yank

    "C-n" 'fj/scroll-half-screen-forward
    "C-p" 'fj/scroll-half-screen-backward
    "M-n" 'fj/scroll-half-screen-other-window-forward
    "M-p" 'fj/scroll-half-screen-other-window-backward

    "d" 'fj/helpful-at-point

    "u" 'undo-tree-undo
    "r" 'undo-tree-redo

    "SPC bc" 'fj/ibuffer-clean
    "SPC cc" 'comment-region
    "SPC cu" 'uncomment-region
    "SPC dd" 'edebug-defun
    "SPC dn" 'flycheck-next-error
    "SPC dp" 'flycheck-previous-error
    "SPC dr" 'edebug-remove-instrumentation
    "SPC ff" 'find-file
    "SPC fr" 'recentf-open-files
    "SPC gb" 'magit-log-buffer-file
    "SPC gl" 'magit-log-current
    "SPC gs" 'fj/magit-status-bak
    "SPC ge" 'fj/magit-status-emacs
    "SPC ks" 'kmacro-start-macro
    "SPC ke" 'kmacro-end-macro
    "SPC kc" 'kmacro-call-macro
    "SPC lb" 'browse-url-at-point
    "SPC lc" 'fj/org-copy-link-url
    "SPC lt" 'org-toggle-link-display
    "SPC mmc" 'fj/mount-common
    "SPC mmp" 'fj/mount-pshare
    "SPC ms" 'fj/mount-show
    "SPC mt" 'fj/tramp-pshare
    "SPC muc" 'fj/unmount-common
    "SPC mup" 'fj/unmount-pshare
    "SPC oD" 'org-decrypt-entries
    "SPC od" 'org-decrypt-entry
    ;; "SPC sd" 'fj/delete-session
    ;; "SPC sl" 'fj/load-session
    ;; "SPC ss" 'fj/save-session
    "SPC ss" 'flyspell-mode
    "SPC sb" 'flyspell-buffer
    "SPC sc" 'consult-flyspell
    "SPC sw" 'fj/look-up-next-misspelled-word
    ;; don't need these, use ace-window:
    ;; "SPC w0" 'delete-window
    ;; "SPC w1" 'delete-other-windows
    ;; "SPC w2" 'split-window-below
    ;; "SPC w3" 'split-window-right
    ;; "SPC wo" 'other-window
    ;; "Q" 'fj/quit-other-window
    "SPC xl" 'fj/add-lexical-binding
    "SPC xm" 'fj/clear-messages-buffer
    "SPC xb" 'fj/run-backup-process
    "SPC xh" 'fj/toggle-etc-hosts-local-websites
    "SPC ye" 'fj/paste-clipboard-encode-line-breaks
    "SPC yh" 'fj/paste-clipboard-html-encode-line-breaks
    "SPC yq" 'fj/paste-clipboard-surround-lines-double-quotes
    "SPC Y" 'fj/download-yt

    )

  (general-def ibuffer-mode-map
    "C-c C-c" 'fj/ibuffer-clean
    "C-c C-m" 'fj/ibuffer-kill-by-mode-regex
    "C-c C-s" 'fj/ibuffer-kill-star-star-buffers
    )

  (general-def minibuffer-local-map
    "C-r" 'consult-history
    )

  (general-def vertico-map
    "C-x C-d" 'consult-dir
    "C-x C-j" 'consult-dir-jump-file
    "M-n" 'next-history-element
    "M-p" 'previous-history-element
    "TAB" 'vertico-insert ; insert curr candidate in minibuffer
    "M-RET" 'vertico-exit-input ; exit, using input rather than candidate
    "C-g" 'abort-minibuffers ; abort, don't run any command
    "C-n" 'vertico-next
    "C-p" 'vertico-previous
    "RET" 'exit-minibuffer ; exit & run selected candidate
    "C-j" 'exit-minibuffer ; exit & run selected candidate
    "C-M-g" 'vertico-exit ; exit & run selected candidate
    )

  ;; (general-def magit-mode-map
  ;;   "C-c ae" 'fj/magit-add-emacs
  ;;   )

  (general-def (emacs-lisp-mode-map lisp-interaction-mode-map)
    "C-c C-c" 'eval-last-sexp
    "C-c C-d" 'elisp-def
    "C-c b" 'elisp-eval-region-or-buffer
    "C-c p" 'pp-eval-last-sexp
    "C-S-n" 'forward-sexp
    "C-S-p" 'backward-sexp
    "C-j" 'lisp-indent-region
    )

  (general-def org-mode-map
    "C-j" 'org-indent-region
    "C-c SPC h" 'org-fold-hide-subtree
    "M-p" 'org-metaup
    "M-n" 'org-metadown
    )

  (general-def dired-mode-map
    "N" 'dired-create-empty-file
    "h" 'dired-single-up-directory
    "H" 'fj/toggle-dired-details
    "l" 'dired-single-buffer
    "y" 'dired-ranger-copy
    "X" 'dired-ranger-move
    "P" 'dired-ranger-paste
    "C-c C-s" 'fj/dired-sudo-edit
    )

  (general-def edebug-mode-map
    "d" 'fj/edebug-pop-to-backtrace-and-return
    )

  )
