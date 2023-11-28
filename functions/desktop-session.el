;; -*- lexical-binding: t; -*-

(defun fj/get-session-dir (session-name)
  "create full session dir path from session name"
  ;;(concat desktop-dirname session-name "/")
  (concat fj/desktop-dir session-name "/")
  )

;; no-littering session dir: `var/desktop'
(defun fj/save-session (session-name)
  "save desktop session"
  (interactive "sSession name: ")
  (let ((session-dir (fj/get-session-dir session-name)))
    (mkdir session-dir t)
    (desktop-save session-dir)
    )
  )

(defun fj/find-sessions ()
  "find all session files"
  (mapcar #'fj/parent-dir-name
          (directory-files-recursively
           fj/desktop-dir
           (regexp-quote desktop-base-file-name)
           )))

(defun fj/load-session ()
  "load desktop session by name"
  (interactive)
  (let ((session-name
         (completing-read
          "Session: "
          (fj/find-sessions))))
    (desktop-read (fj/get-session-dir session-name))
    ))

(defun fj/delete-session ()
  "delete desktop session by name"
  (interactive)
  (let* ((session-name (completing-read "Session: " (fj/find-sessions)))
         (session-dir (fj/get-session-dir session-name))
         )
    (delete-directory session-dir t t)
    ))
