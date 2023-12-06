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

(defun fj/file-name-with-tex-ext ()
  "return this buffer's file name, but with .tex extension"
  (interactive)
  (format "%s.tex"
          (file-name-sans-extension
           (buffer-file-name))))

(defun fj/org-tangle-and-compile-if-latex ()
  "tangle org file, and if it generated a latex file, compile it"
  (interactive)
  ;; temporarily disable the `save-buffer' pre-tangle-hook
  ;; otherwise will have a stack overflow
  ;; since we are calling this from advice for save-buffer
  (let ((org-babel-pre-tangle-hook nil))
    (org-babel-tangle)
    )
  ;; compile tex file with same name as this org file, if exists
  (let* ((tex-file (fj/file-name-with-tex-ext)))
    (when (file-exists-p tex-file)
      (fj/compile-latex-file tex-file)
      )))
