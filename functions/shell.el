;; -*- lexical-binding: t; -*-

(defun fj/run-cmd-in-eshell (cmd)
  "run the command `cmd' in eshell"
  (with-current-buffer (eshell)
    (eshell-kill-input)
    (end-of-buffer)
    (insert cmd)
    (eshell-send-input)
    (end-of-buffer)
    ))

(defun fj/mount-sshfs (user host remote-path local-path)
  (shell-command
   (let ((flags "-oHostKeyAlgorithms=+ssh-rsa"))
     (format "sshfs %s %s@%s:/%s %s"
             flags user host remote-path local-path
             ))
   ))

(defun fj/unmount-sshfs (local-path)
  (shell-command (format "fusermount3 -u %s" local-path))
  )
