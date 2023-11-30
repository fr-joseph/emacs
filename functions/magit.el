;; -*- lexical-binding: t; -*-

(defun fj/magit-status-bak ()
  "magit-status of bak dir"
  (interactive)
  (magit-status (substitute-in-file-name "$FJ_BAK_ROOT/"))
  )

(defun fj/magit-status-emacs ()
  "magit-status of emacs cfg dir"
  (interactive)
  (magit-status (substitute-in-file-name "$FJ_EMACS_REPO/"))
  )

;; (defun fj/magit-add-emacs ()
;;   "add/stage all emacs files"
;;   (interactive)
;;   (magit-git-command-topdir "git add emacs/")
;;   )
