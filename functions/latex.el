;; -*- lexical-binding: t; -*-

(defun fj/compile-latex-file (file)
  "compile latex file"
  (interactive "f")
  ;;(async-shell-command (format "$FJ_BIN/compile-tex %s" (file-name-nondirectory file)))
  (start-process "compile-tex" "*compile-tex*" "compile-tex" (file-name-nondirectory file))
  )

(defun fj/compile-latex-this-file ()
  "compile the current latex file"
  (interactive)
  (fj/compile-latex-file (buffer-file-name))
  )
