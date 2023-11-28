;; -*- lexical-binding: t; -*-

(defun fj/print-message (msg)
  (message "*** [%s] %s"
           (format-time-string "%Y-%m-%d %I:%M:%S %p")
           msg))

(defun fj/princn (obj)
  "princ with newline"
  (princ obj)
  (princ "\n")
  )

(defun fj/clear-messages-buffer (&optional hide)
  "Clear all messages; intended window setup is main window on left
and messages window on right. This will kill the messages buffer,
and recreate the window setup to be the same vertical split."
  (interactive)
  (kill-buffer "*Messages*")
  (delete-other-windows)
  (split-window-right)
  (messages-buffer)
  (unless hide
    (display-buffer "*Messages*")
    )
  )

;; cf. `view-echo-area-messages'
(defun fj/view-echo-area-messages-bottom ()
  (interactive)
  (with-current-buffer (messages-buffer)
    (goto-char (point-max))
    (let ((win (
                display-buffer
                (current-buffer)
                ;; the only addition to default function:
                '(display-buffer-in-side-window
                  . ((side . bottom)
                     (window-height . 10)))
                )))
      (set-window-point win (point))
      win)))
