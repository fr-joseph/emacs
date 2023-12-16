;; -*- lexical-binding: t; -*-

(defun fj/toggle-etc-hosts-local-websites (enable-local-websites)
  "Toggle /etc/hosts local website overrides. ENABLE 1 or 0."
  (interactive "nenable local websites (1/0)? ")
  (fj/sudo-find-file "/etc/hosts")
    (save-excursion
      (beginning-of-buffer)
      (search-forward "fj/toggle-etc-hosts-local-websites" nil t)
      (end-of-line)
      (let* ((beg (point))
             (end (point-max)))
        (if (= 1 enable-local-websites)
            ;; remove all initial "# " from lines
            (replace-regexp-in-region "^# " "" beg end)
          ;; if a line does not start with "#", then add "# "
          (replace-regexp-in-region "^[a-zA-Z0-9].+$" "# \\&" beg end)
          )
        ))
    (save-buffer)
    ;;(cmd-mode 1)
    )
