;; -*- lexical-binding: t; -*-

(defun fj/ibuffer-clean ()
  "delete all, except modified buffers with associated files"
  (interactive)
  (ibuffer)
  (ibuffer-mark-unsaved-buffers)
  (ibuffer-toggle-marks)
  (ibuffer-do-delete)
  )

(defun fj/ibuffer-kill-by-mode-regex (filter)
  "kill unmodified buffers by major-mode name filter"
  (interactive "sKill all unmodified buffers for major mode (regex): ")
  (ibuffer-mark-unsaved-buffers)
  (ibuffer-do-kill-lines) ; hide all unsaved
  (type-of filter)
  (ibuffer-mark-by-mode-regexp filter)
  (ibuffer-do-delete)
  (ibuffer-update nil) ; to redisplay hidden buffers
  )

(defun fj/ibuffer-kill-star-star-buffers ()
  "kill all `*name*' buffers"
  (interactive)
  (ibuffer-mark-by-name-regexp "^\\*.*\\*$")
  (ibuffer-do-delete)
  (ibuffer-update nil) ; to redisplay hidden buffers
  )
