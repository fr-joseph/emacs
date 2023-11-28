;; -*- lexical-binding: t; -*-

(defun fj/scroll-half-screen (direction)
  "scroll half screen. direction 1 -> down, 0 -> up"
  (interactive)
  (let* ((lines (/ (fj/window-size) 2))
         (arg (if (eq 1 direction)
                  (* -1 lines)
                lines
                ))
         )
    (scroll-down arg)
    (move-to-window-line nil) ; recenter cursor without scrolling
    ))

(defun fj/scroll-half-screen-other-window (direction)
  "scroll MRU window"
  (interactive)
  (fj/with-mru-window
      (fj/scroll-half-screen direction)
    )
  )

(defun fj/scroll-half-screen-forward ()
  (interactive)
  (fj/scroll-half-screen 1)
  )

(defun fj/scroll-half-screen-backward ()
  (interactive)
  (fj/scroll-half-screen -1)
  )

(defun fj/scroll-half-screen-other-window-forward ()
  (interactive)
  (fj/scroll-half-screen-other-window 1)
  )

(defun fj/scroll-half-screen-other-window-backward ()
  (interactive)
  (fj/scroll-half-screen-other-window -1)
  )
