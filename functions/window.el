;; -*- lexical-binding: t; -*-

(defun fj/get-mru-window ()
  "get most recently used window, excl. dedicated; this frame, not selected"
  (interactive)
  (get-mru-window nil nil t)
  )

(defmacro fj/with-mru-window (&rest body)
  "execute the forms in BODY with most recently used window selected"
  (declare (indent 1) (debug t))
  `(with-selected-window (fj/get-mru-window)
     ,@body)
  )

(defun fj/quit-other-window ()
  "quit most recently used other window"
  (interactive)
  (fj/with-mru-window
      (quit-window)
    )
  )

;; taken from `view-mode'
(defun fj/window-size ()
  ;; Return the height of the current window, excluding the mode line.
  ;; Using `window-line-height' accounts for variable-height fonts.
  (let ((h (window-line-height -1)))
    (if h
        (1+ (nth 1 h))
      ;; This should not happen, but if `window-line-height' returns
      ;; nil, fall back on `window-height'.
      (1- (window-height)))))
