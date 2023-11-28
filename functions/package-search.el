;; -*- lexical-binding: t; -*-

(defun fj/apropos-package--filter (string)
  (let (packages)
    (dolist (package-assoc package-archive-contents)
      (let ((package (cadr package-assoc)))
        (when (or (string-match-p (regexp-quote string) (package-desc-summary package))
                  (string-match-p (regexp-quote string) (prin1-to-string (package-desc-name package))))
          (push package packages))))
    packages))

(defun fj/apropos-package (string)
  (interactive "sSearch for package: ")
  ;; Initialize the package system if necessary.
  (unless package--initialized
    (package-initialize t))
  (let ((packages (fj/apropos-package--filter string)))
    (if (null packages)
        (message "No packages")
      (package-show-package-list (mapcar 'package-desc-name packages)))))
