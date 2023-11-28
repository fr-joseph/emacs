;; -*- lexical-binding: t; -*-

(defun fj/look-up-next-misspelled-word ()
  "web browse look up the next spell error"
  (interactive)
  (flyspell-goto-next-error)
  (let ((word (car (ispell-get-word t))))
    (browse-url
     (concat "https://search.brave.com/search?q=define+"
             (string-replace " " "+" word)
             )
     t)
    )
  )
