;; -*- lexical-binding: t; -*-

(defun fj/key-is-disabled-msg ()
  (interactive)
  (message "DO NOT PRESS THAT KEY!"))

(defun fj/disable-modified-keys (mods keys)
  (dolist (mod mods)
    (dolist (key keys)
      (global-set-key (kbd (concat mod key)) #'fj/key-is-disabled-msg)
      )))
