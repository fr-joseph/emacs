;; -*- lexical-binding: t; -*-

;; example usage:
;;
;;  (fj/regex-or '(mkv webm mp4 mp3 ogg m4a)
;;               '(gz zst tar xz rar zip)
;;               '(iso epub pdf))
;;
;; produces output:
;;
;; "\\(mkv\\|webm\\|mp4\\|mp3\\|ogg\\|m4a\\|gz\\|zst\\|tar\\|xz\\|rar\\|zip\\|iso\\|epub\\|pdf\\)"
;;
(defun fj/regex-or (&rest items)
  "flatten input lists, and join with regex OR"
  (concat
   "\\("
   (mapconcat #'symbol-name
              (apply #'append () items)
              "\\|")
   "\\)")
  )
