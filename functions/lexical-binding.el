;; -*- lexical-binding: t; -*-

(defun fj/add-lexical-binding ()
  "add lexical binding comment to top of buffer"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (end-of-line)
    (let ((lex-msg ";; -*- lexical-binding: t; -*-")
          (first-line (buffer-substring-no-properties 1 (point))))
      (unless (equal lex-msg first-line)
        (beginning-of-buffer)
        (insert lex-msg "\n" "\n")
        )
      ))
  (message "added lexical binding to buffer"))
