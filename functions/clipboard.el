;; -*- lexical-binding: t; -*-

(defun fj/get-clipboard ()
  "return string in clipboard"
  (current-kill 0 t)
  )

(defun fj/paste-clipboard-surround-lines-double-quotes ()
  "paste clipboard, with each line surrounded by double quotes"
  (interactive)
  (insert (concat "\"" (string-trim (string-replace "\n" "\"\n\"" (fj/get-clipboard)))) "\"")
  )

(defun fj/paste-clipboard-html-encode-line-breaks ()
  "paste clipboard, with line breaks encoded as literal \\n"
  (interactive)
  (insert (string-trim (string-replace "\n" "<br>\\n" (fj/get-clipboard))))
  )

(defun fj/paste-clipboard-encode-line-breaks ()
  "paste clipboard, with line breaks encoded as literal \\n"
  (interactive)
  (insert (string-trim (string-replace "\n" "\\n" (fj/get-clipboard))))
  )

(defun fj/position-to-kill-ring ()
  "Copy to the kill ring a string in the format `file-name:line-number'
for the current buffer's file name, and the line number at point."
  (interactive)
  (let ((pos
         (format "%s:%d" (buffer-file-name)
                 (save-restriction
                   (widen) (line-number-at-pos)))
         ))
    (progn
      (message pos)
      (kill-new pos)))
  )
