;; -*- lexical-binding: t; -*-

(defun fj/find-file-existing (custom-default-dir)
  "find-file-existing with a custom directory"
  (interactive "D")
  (let ((default-directory (expand-file-name custom-default-dir)))
    (call-interactively #'find-file-existing)
    ))

(defun fj/parent-dir-name (filename)
  (file-name-base
   (directory-file-name
    (file-name-parent-directory filename)))
  )

(defun fj/sudo-find-file (file)
  "sudo find-file"
  (interactive "fOpen file as root: ")
  (when (file-writable-p file)
    (user-error "File is user writeable, aborting sudo."))
  (find-file (if (file-remote-p file)
                 (concat "/" (file-remote-p file 'method) ":"
                         (file-remote-p file 'user) "@" (file-remote-p file 'host)
                         "|sudo:root@"
                         (file-remote-p file 'host) ":" (file-remote-p file 'localname))
               (concat "/sudo:root@localhost:" file)))
  )

(defun fj/dired-sudo-edit ()
  "sudo find-file on current selected dired file"
  (interactive)
  (fj/sudo-find-file (dired-get-file-for-visit))
  )
