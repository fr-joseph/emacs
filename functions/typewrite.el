;; -*- lexical-binding: t; -*-

(defun fj/configure-typewrite ()
  "configure settings to typewrite a document"
  (interactive)
  (flyspell-mode 1)
  (fringe-mode 400)
  (toggle-truncate-lines 1)
  (toggle-word-wrap 1)
  (display-line-numbers-mode -1)
  (text-scale-increase 2)
  (text-mode)
  (electric-quote-local-mode)
  )

;; TODO: custom syntax, highlight upper case letters, non-letters
;; change font to non-monospace
;; Use set-input-method and select TeX.
;; (describe-input-method)
;; use --- for emdash
;; use -- for endash
;; \'a -- acute accent
;; \`{a} -- grave accent

(defun fj/find-all-chars-to-encode-in-buffer ()
  "find all characters to encode for espeak"
  (interactive)
  (let* ((buffer-text (buffer-substring-no-properties (point-min) (point-max)))
         )
    ;; read buffer text characterwise, and get a list of unique characters
    (dolist (char (string-to-list buffer-text))
      (message "%s" (char-to-string char))
      )
    ))

(defun fj/replace-in-file (find replace)
  (replace-string-in-region find (format " %s " replace) (point-min) (point-max))
  )

(defun fj/decode-document-for-espeak (input-file)
  "convert document to espeak-ready text, for proof-reading"
  (interactive "f")
  (let* (
         (io-dir (file-name-directory input-file))
         (input-file-name (file-name-base input-file))
         (output-file-name (concat input-file-name "-ESPEAK"))
         (output-file (concat io-dir output-file-name))
         (output-wav (concat io-dir output-file-name ".wav"))
         (overwrite-existing t)
         (case-fold-search nil) ; case-sensitive
         )
    ;; start from scratch, wipe out existing
    (copy-file input-file output-file overwrite-existing)
    (find-file-existing output-file)

    (fj/replace-in-file "," "comma")
    (fj/replace-in-file "." "period.")
    (fj/replace-in-file ";" "semicolon")
    (fj/replace-in-file ":" "colon")
    (fj/replace-in-file "?" "question mark")
    (fj/replace-in-file "(" "left paren")
    (fj/replace-in-file ")" "right paren")
    (fj/replace-in-file "[" "left square bracket")
    (fj/replace-in-file "]" "right square bracket")
    (fj/replace-in-file "“" "left double quote")
    (fj/replace-in-file "”" "right double quote")
    (fj/replace-in-file "‘" "left single quote")
    (fj/replace-in-file "’" "right single quote")
    (fj/replace-in-file "+" "plus sign")
    (fj/replace-in-file "-" "dash")
    (fj/replace-in-file "–" "en dash")
    (fj/replace-in-file "—" "em dash")
    (fj/replace-in-file "\n\n" " new paragraph. ")

    (replace-regexp-in-region "[A-Z]" " cap \\&" (point-min) (point-max))

    (save-buffer)
    (kill-buffer)

    ;; TODO: numbers?
    ;; TODO: error if any un-encoded characters left
    ;; TODO: make function that can run on any current file buffer, or via dired
    ;; TODO: trim all 2+ spaces into a single space

    ;; (beginning-of-buffer)
    ;; (text-mode)
    ;; (toggle-truncate-lines)
    ;; (toggle-word-wrap)

    (shell-command (format "espeak -w %s -f %s" output-wav output-file))
    (shell-command (substitute-in-file-name "$FJ_BIN/notify 'decode for espeak' 'is done'"))

    ))
