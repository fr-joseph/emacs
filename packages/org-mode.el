;; -*- lexical-binding: t; -*-

(defun fj/org-mode-hook ()
  (org-indent-mode)
  (diminish 'org-indent-mode)
  )

(use-package org
  :defer t
  :hook (org-mode . fj/org-mode-hook)
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        ;; prevent RET from sending TAB and
        ;; autocomplete menu popping up, in src blocks:
        org-src-tab-acts-natively nil
        org-edit-src-content-indentation 2
        org-hide-block-startup nil
        org-src-preserve-indentation nil
        org-startup-folded 'content
        org-cycle-separator-lines 2
        org-directory fj/org-directory
        )

  ;; /usr/local/share/emacs/29.1/lisp/org/org.el.gz:753
  (setq org-modules
        '(org-tempo ; completions for structure templates type `<el' and `TAB' to expand
          org-crypt
          ))

  ;; can execute these languages in src blocks
  ;; can use nil instead of t to temporarily disable
  ;; cf. https://orgmode.org/worg/org-contrib/babel/languages/index.html
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (calc . t)
     (awk . t)
     (scheme . t)
     (shell . t)
     ))

  ;; add mappings of src language to major mode, excluding "-mode" suffix
  (push '("conf-unix" . conf-unix) org-src-lang-modes)
  ;;(push '("eshell" . eshell) org-src-lang-modes)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src elisp"))
  (add-to-list 'org-structure-template-alist '("calc" . "src calc"))
  (add-to-list 'org-structure-template-alist '("tex" . "src tex"))
  (add-to-list 'org-structure-template-alist '("ttex" . "src tex :tangle yes"))

  ;;
  ;; 1.  Choose a heading to contain a TOC and go to it.
  ;; 2.  Press `C-c C-x p' (`org-set-property'), add a `TOC' property, and
  ;;     set its value to `:include all'.
  ;; 3.  Run command `org-make-toc-insert' to insert the `:CONTENTS:' drawer,
  ;;     which will contain the TOC entries.
  ;; 4.  Run the command `org-make-toc' to update all TOCs in the document,
  ;;    or `org-make-toc-at-point' to update the TOC for the entry at point.
  ;;
  (use-package org-make-toc
    :hook (org-mode . org-make-toc-mode))


  ;; `TODO': use deft, or org-roam, or both, for zettelkasten???


  (use-package org-appear
    :hook (org-mode . org-appear-mode))

  (use-package org-bullets
    :after org
    :hook (org-mode . org-bullets-mode)
    :custom
    (org-bullets-bullet-list
     ;; "◉"
     '("●" "✚" "◆" "○" "✜" "◇")
     )
    )

  (dolist (face '((org-level-1 . 1.20)
                  (org-level-2 . 1.20)
                  (org-level-3 . 1.15)
                  (org-level-4 . 1.15)
                  (org-level-5 . 1.10)
                  (org-level-6 . 1.10)
                  (org-level-7 . 1.05)
                  (org-level-8 . 1.05)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face))
    )

  (org-crypt-use-before-save-magic)
  ;; cf. https://orgmode.org/manual/Org-Crypt.html
  (setq org-crypt-key fj/org-crypt-key ; set per system in system.el
        auto-save-default nil ; auto-save doesn't work with org-crypt
        org-crypt-tag-matcher "crypt" ; tag to use for encrypting entries
        org-crypt-disable-auto-save t ; if auto-save enabled, disable it
        org-tags-exclude-from-inheritance '("crypt") ; no re-encrypt
        )

  ;; check org-mode-hook to make sure that hook doesn't get added multiple times

  ;; end of `use-package org'
  )
