;; -*- lexical-binding: t; -*-

(defun fj/org-element-print-context ()
  "pretty print context of org element at point, in new frame"
  (interactive)
  (fj/pretty-print-new-buffer (org-element-context))
  )

(defun fj/org-copy-link ()
  "copy full org-mode link at point"
  (interactive)
  (let ((begin (org-element-property :begin (org-element-context)))
        (end (org-element-property :end (org-element-context))))
    (kill-ring-save begin end)))

(defun fj/org-copy-link-url ()
  "copy URL of org-mode link at point"
  (interactive)
  (kill-new (org-element-property :raw-link (org-element-context))))

(defun fj/org-agenda-dashboard ()
  "go to org-agenda custom dashboard"
  (interactive)
  (org-agenda nil "d")
  )
