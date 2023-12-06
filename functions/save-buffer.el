;; -*- lexical-binding: t; -*-

(defun fj/save-buffer-advice ()
  "advice for save-buffer"
  (interactive)
  (let* ((my-filename (buffer-file-name))
         (my-ext (file-name-extension my-filename)))
    (cond
     ((equal my-ext "tex") (fj/compile-latex-this-file))
     ((equal my-ext "org") (fj/org-tangle-and-compile-if-latex))
     (t nil))))

(advice-add 'save-buffer :after #'fj/save-buffer-advice)
;; (advice-remove 'save-buffer #'fj/try-compile-latex-this-file)
