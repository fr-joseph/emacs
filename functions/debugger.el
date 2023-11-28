;; -*- lexical-binding: t; -*-

;; to replace the default `edebug-pop-to-backtrace' binding
(defun fj/edebug-pop-to-backtrace-and-return ()
  (interactive)
  (edebug-pop-to-backtrace)
  (backtrace-toggle-locals)
  (backtrace-multi-line)
  (previous-window-any-frame))
