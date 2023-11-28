;; -*- lexical-binding: t; -*-

;; to query the current attributes: (face-all-attributes 'default)
(set-face-attribute 'default nil :font fj/font :height 140)

(setq
 modus-themes-mode-line '(accented borderless)
 modus-themes-region '(accented bg-only)
 modus-themes-bold-constructs t
 modus-themes-italic-constructs t
 modus-themes-paren-match '(bold intense)
 modus-themes-completions (quote ((matches . (underline intense))
                                  (selection . (intense))
                                  (popup . (intense))))
 modus-themes-scale-headings t ; to allow headings of diff sizes
 modus-themes-org-blocks 'gray-background ; or 'tinted-background
 modus-themes-headings '((1 . (bold rainbow background 1.30 overline))
                         (2 . (bold rainbow background 1.25))
                         (3 . (bold rainbow background 1.20))
                         (4 . (semibold rainbow background 1.15))
                         (5 . (semibold rainbow background 1.10))
                         ;; default, level 6+
                         (t . (semibold rainbow background 1.05))
                         )
 )

;; finally call load-theme
(load-theme 'modus-vivendi t)
