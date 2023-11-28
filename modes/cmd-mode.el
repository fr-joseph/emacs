;; -*- lexical-binding: t; -*-

(define-minor-mode cmd-mode
  "toggles buffer-local cmd-mode"
  :lighter " ⬤"
  :global nil
  :keymap (list (cons (kbd "<escape>")
                      (lambda () (interactive) (message "don't press ESC"))))
  (setq cursor-type (if cmd-mode 'box 'bar))
)

;; FIXME: error in messages buffer: `Invalid face reference: quote'
;; is it coming from this?
;; (diminish 'cmd-mode '(:propertize " ⬤" face '(:foreground "#FF0000")))

;;
;; NOTE: keep this for reference
;;
;; (let ((mode-line-fg "#ffffff")
;;       (inactive-bg "#1e1e1e")
;;       (active-emacs-bg "#2a2a66")
;;       (active-cmd-bg "#b43232")
;;       )
;;   (add-hook
;;    'cmd-mode-on-hook (lambda ()
;;                        (set-face-attribute 'mode-line nil
;;                                            :foreground mode-line-fg
;;                                            :background active-cmd-bg)
;;                        (set-face-attribute 'mode-line-inactive nil
;;                                            :foreground mode-line-fg
;;                                            :background inactive-bg)
;;                        ))
;;   (add-hook
;;    'cmd-mode-off-hook (lambda ()
;;                         (set-face-attribute 'mode-line nil
;;                                             :foreground mode-line-fg
;;                                             :background active-emacs-bg)
;;                         (set-face-attribute 'mode-line-inactive nil
;;                                             :foreground mode-line-fg
;;                                             :background inactive-bg)
;;                         ))
;;   )
