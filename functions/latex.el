;; -*- lexical-binding: t; -*-

(defun fj/compile-latex-file (file)
  "compile latex file"
  (interactive "f")
  ;;(async-shell-command (format "$FJ_BIN/compile-tex %s" (file-name-nondirectory file)))
  (start-process "compile-tex"
                 "*compile-tex*"
                 "compile-tex"
                 (file-name-nondirectory file))
  )

(defun fj/compile-latex-this-file ()
  "compile the current latex file"
  (interactive)
  (fj/compile-latex-file (buffer-file-name))
  )

(defun fj/try-compile-latex-this-file ()
  "check file extension to decide whether to try compile"
  (interactive)
  (when (s-matches-p "^.+\\.tex$" (buffer-file-name))
    (fj/compile-latex-this-file)
    ))

(advice-add 'save-buffer :after #'fj/try-compile-latex-this-file)
;; (advice-remove 'save-buffer #'fj/try-compile-latex-this-file)
