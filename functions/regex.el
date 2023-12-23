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

(defun fj/find-non-ascii-in-buffer ()
  "find first non-ascii character in buffer"
  (interactive)
  (let ((old-point (point))
        )
    (beginning-of-buffer)
    (search-forward-regexp "[^ -~\r\n]")
    )
  )

(defun fj/regex-replace-buffer (find replace)
  "replace all matches in buffer"
  (interactive)
  (replace-regexp-in-region find replace (point-min) (point-max))
  )

(defun fj/html-encode-unicode-characters ()
  "encode unicode characters with HTML codes"
  (interactive)
  (fj/regex-replace-buffer "“" "&ldquo;")
  (fj/regex-replace-buffer "”" "&rdquo;")
  ;;(fj/regex-replace-buffer "" "&lsquo;")
  (fj/regex-replace-buffer "’" "&rsquo;")
  )
