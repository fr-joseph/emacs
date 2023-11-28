;; -*- lexical-binding: t; -*-

;; when using Emacs 29, the location of the native compilation cache can
;;   be changed using a function, preferably in early-init.el
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (convert-standard-filename
    (expand-file-name "var/eln-cache/" user-emacs-directory))))
