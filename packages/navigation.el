;; -*- lexical-binding: t; -*-

(use-package avy
  :config
  (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l
                      ?w ?e ?r ?i ?o
                      ?v ?n
                      ))
  )

(use-package expand-region)

;; TODO: package for cycling backwards through point jump history
;; does winner mode do this?

(use-package ace-window
  :config
  (setq
   aw-dispatch-always t
   aw-keys '(?a ?s ?d ?f ?g ?j ?k ?l)
   aw-make-frame-char ?z
   aw-dispatch-alist
   '(
     (?b aw-switch-buffer-in-window "select buffer")
     (?c aw-copy-window "copy window")
     (?e aw-execute-command-other-window "execute command other window")
     (?h aw-split-window-vert "split window horizontally")
     (?m aw-move-window "move window")
     (?o delete-other-windows "delete other windows")
     (?u aw-switch-buffer-other-window "switch buffer other window, stay here")
     (?v aw-split-window-horz "split window vertically")
     (?w aw-swap-window "swap windows, this with other")
     (?x aw-delete-window "delete window")
     (?? aw-show-dispatch-help)
     ;; ?i ?r ?t are used by hyperbole.el
     ;;(?F aw-split-window-fair "split fair window")
     ;;(?T aw-transpose-frame "transpose frame")
     ;;(?p aw-flip-window) ; go to previous window. just use regular jump-to
     )
   )
  )
