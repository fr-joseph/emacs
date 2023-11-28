;; -*- lexical-binding: t; -*-

(defun fj/string-oneline-trim (s)
  "remove linebreaks and trim string"
  (string-trim (string-replace "\n" " " s))
  )
