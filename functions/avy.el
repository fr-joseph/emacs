;; -*- lexical-binding: t; -*-

(defun fj/avy-goto-line-beginning ()
  "avy-goto-line & move-beginning-of-line"
  (interactive)
  (avy-goto-line)
  (move-beginning-of-line 1))

;; FIXME: fj/avy-goto-char-constrained does not seem to work
(defun fj/avy-goto-char-constrained ()
  (interactive)
  (let* (
         (char (read-char "char: " t))
         (lines-around-point 10)
         (the-bound (fj/get-constrained-region lines-around-point))
         (beg (car the-bound))
         (end (cadr the-bound)))
    (avy-jump
     (if (= 13 char)
         "\n"
       (regexp-quote (string char)))
     :beg beg
     :end end
     )
    ))
