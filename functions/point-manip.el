;; -*- lexical-binding: t; -*-

(defun fj/get-point-pos-x-lines-away (x)
  "get point pos X lines above/below point"
  (interactive)
  (save-excursion
    (if (> x 0)
        (end-of-line (+ x 1))
      (beginning-of-line (+ x 1))
      )
    (point)
    )
  )

(defun fj/get-constrained-region (lines-around-point)
  (interactive)
  (when (> lines-around-point 0)
    (list
     (fj/get-point-pos-x-lines-away (* -1 lines-around-point))
     (fj/get-point-pos-x-lines-away lines-around-point)
     ))
  )
