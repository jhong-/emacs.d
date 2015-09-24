; Setting up the package manager
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

; Not sure how this exactly works yet
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION. If NO-REFRESH is
  non-nil, the available package lists will not be called and re-downloaded in
  order to locate PACKAGE."
  (if (package-installed-p package min-version)
    t
    (if (or (assoc package package-archive-contents) no-refresh)
      (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

; Setup theme
(require-package 'zenburn-theme)
(load-theme 'zenburn t)

(require-package 'better-defaults)
(require-package 'helm)
(require-package 'magit)
(require-package 'projectile)

; Clojure Development
(require-package 'cider)
(require-package 'clojure-mode)

; Enable evil-mode
(require-package 'evil)
(evil-mode 1)
