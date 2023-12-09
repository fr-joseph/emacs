;; -*- lexical-binding: t; -*-

(defun fj/expand-emacs-subpath (subpath)
  (expand-file-name
   (concat
    user-emacs-directory
    subpath
    )))

;; `load' params: FILE, NOERROR, NOMESSAGE, NOSUFFIX
(defun fj/load (file)
  (load file nil nil nil))

(defun fj/load-emacs-file (subpath)
  (fj/load (fj/expand-emacs-subpath subpath)))

(defun fj/emacs-subpath-files (subpath)
  (directory-files (fj/expand-emacs-subpath subpath) t "^.*\\.el$"))

(defun fj/load-emacs-dir (subpath)
  (dolist (file (fj/emacs-subpath-files subpath))
    (fj/load file)))

(defun fj/load-all-configuration ()
  (message "using configuration for `%s'" (system-name))
  (message " ")
  (message ">>> config BEGIN")
  (message " ")
  (fj/load-emacs-file "core")
  (message " ")
  (fj/load-emacs-dir "functions")
  (message " ")
  (fj/load-emacs-file "system")
  (message " ")
  (fj/load-emacs-dir "modes")
  (message " ")
  (fj/load-emacs-dir "packages")
  (message " ")
  (fj/load-emacs-file "keybindings")
  (message " ")
  (message ">>> config END")
  (message " ")
  )

;;(setq debug-on-error t)

(cond

 (
  (equal "salt" (system-name))
  (setq

   fj/initial-buffer-choice (substitute-in-file-name "$FJ_ORG/todo.org")
   fj/trash-directory "~/.trash"
   fj/browser "qutebrowser"
   fj/org-directory (substitute-in-file-name "$FJ_ORG")
   fj/font "Hack Nerd Font"
   fj/ytdl-dir "~/tmp/yt"

   )
  (fj/load-all-configuration)
  )

 (
  (equal "LT-MK-9B399Y2" (system-name))
  (setq

   fj/initial-buffer-choice nil
   fj/trash-directory "~/.trash"
   fj/browser nil
   fj/org-directory nil
   fj/font "DejaVuSansMono NF"
   fj/ytdl-dir nil

   )
  (fj/load-all-configuration)
  )

 (
  t
  (message "no configuration exists for `%s'" (system-name))
  )

 )
