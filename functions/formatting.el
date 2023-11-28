;; -*- lexical-binding: t; -*-

(defun fj/indent-buffer ()
  "indent whole buffer with `indent-region'"
  (interactive)
  (indent-region (point-min) (point-max)))
