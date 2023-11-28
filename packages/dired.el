;; -*- lexical-binding: t; -*-

(defun fj/set-dired-details ()
  "set dired-hide-details-mode and dired-omit-mode to match the tracking variable"
  (dired-omit-mode fj/dired-minimal)
  (dired-hide-details-mode fj/dired-minimal))

(defun fj/toggle-dired-details ()
  "toggle tracker for dired-hide-details-mode and dired-omit-mode, and then apply"
  (interactive)
  (setq fj/dired-minimal (* -1 fj/dired-minimal)) ; toggle between 1 and -1
  (fj/set-dired-details))

(defun fj/dired-mode-hook ()
  (dired-preview-global-mode 0)
  (dired-collapse-mode)
  (all-the-icons-dired-mode 1)
  (fj/set-dired-details) ; set the modes to match their last used setting
  )

(use-package dired
  :ensure nil ; don't try to download dired, since it is built-in, but load it
  :commands (dired dired-jump) ; only load when you try to use it
  :defer 1 ; load after 1 second of idle time
  :hook (dired-mode . fj/dired-mode-hook)
  :config ; run after it is loaded

  (autoload 'dired-omit-mode "dired-x") ; load dired-omit-mode from dired-x

  (setq dired-listing-switches "-alh --group-directories-first" ; default '-al'
        delete-by-moving-to-trash t
        dired-omit-files "^\\.[^.].*\\|^\\.\\|^\\.\\."
        dired-omit-verbose t ; t/nil - show "omitted x lines"?
        dired-hide-details-hide-symlink-targets nil ; don't hide link targets
        fj/dired-minimal 1 ; 1 or -1
        )

  (use-package dired-rainbow
    :defer 2 ; load after 2 seconds of idle time
    :config
    (dired-rainbow-define-chmod directory "#6cb2eb" "d.*")
    (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
    (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
    (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
    (dired-rainbow-define markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
    (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
    (dired-rainbow-define media "#de751f" ("mp3" "mp4" "mkv" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
    (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
    (dired-rainbow-define log "#c17d11" ("log"))
    (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
    (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
    (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
    (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
    (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
    (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
    (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
    (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
    (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
    (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
    (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*"))

  (use-package dired-single
    :defer t)

  (use-package dired-ranger
    :defer t)

  (use-package dired-collapse
    :defer t)

  (use-package dired-preview
    :defer t
    :config
    (setq dired-preview-delay 0.5
          dired-preview-max-size (* 1 1000 1000) ; 1MB
          dired-preview-ignored-extensions-regexp
          (concat "\\."
                  (fj/regex-or '(mkv webm mp4 mp3 ogg m4a)
                               '(gz zst tar xz rar zip)
                               '(iso epub pdf))
                  )
          ))

  (use-package all-the-icons-dired
    :after all-the-icons
    :diminish)

  )
