;; -*- lexical-binding: t; -*-

(defun fj/conc-after-one-hour (conc)
  "reduce concentration about 12% every hour"
  (* conc 0.8815)
  )

(defun fj/conc-after-x-hours (conc x)
  "concentration after x hours"
  (if (< x 1) conc
    (cond
     ((= 1 x) (fj/conc-after-one-hour conc))
     (t (fj/conc-after-x-hours (fj/conc-after-one-hour conc) (1- x)))
     )
    ))

(defun fj/conc ()
  "interactively calculate concentration"
  (interactive)
  (let* ((conc (read-number "concentration: "))
         (x (read-number "after x hours: "))
         )
    (message "%smg after %sh: %smg"
             conc
             x
             (round (fj/conc-after-x-hours conc x))
             )))
