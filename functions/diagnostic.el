;; -*- lexical-binding: t; -*-

(defun fj/helpful-at-point ()
  "helpful at point in most recently used window, don't take focus"
  (interactive)
  (helpful-at-point)
  (select-window (fj/get-mru-window))
  )

(defun fj/dump-seq (temp-buffer-name seq)
  "dump a sequence into a temp buffer, one item per line"
  (interactive)
  (with-output-to-temp-buffer temp-buffer-name
    (mapcar
     (lambda (s)
       (princ (concat s "\n"))
       )
     seq)
    )
  (message "done")
  (display-buffer temp-buffer-name)
  )

(defun fj/show-load-path ()
  "show load-path, list of directories to search for files to load"
  (interactive)
  (fj/dump-seq "*current-load-path*" load-path)
  )

;; TODO: fj/pretty-print-new-buffer obsolete?
;; could probably just use `pp-eval-expression'
;; or `pp-display-expression'
(defun fj/pretty-print-new-buffer (obj)
  "pretty print elisp object in new frame"
  (interactive)
  (let ((pp-buf "*pretty-print-output*"))
    (select-frame (make-frame))
    (delete-other-windows)
    (let ((standard-output (get-buffer-create pp-buf)))
      (switch-to-buffer pp-buf)
      (erase-buffer)
      (princ obj)
      (pp-buffer)
      (emacs-lisp-mode)
      (visual-line-mode)
      (read-only-mode)
      )
    ))

(defun fj/get-derived-modes (mode-str)
  "return list of ancestor modes that string MODE-STR is derived from"
  (interactive "smode: ")
  (let ((mode (intern mode-str))
        (modes   ())
        (parent  nil))
    (while (setq parent (get mode 'derived-mode-parent))
      (push parent modes)
      (setq mode parent))
    (setq modes (nreverse modes))
    (message "%S" modes)
    ))
