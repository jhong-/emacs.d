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

(require-package 'nyan-mode)
(nyan-mode t)

; Clojure Development
(require-package 'cider)
(require-package 'clojure-mode)

; Enable evil-mode
(require-package 'evil)
(evil-mode 1)

; Display line numbers
(global-linum-mode 1)

(setq tab-width 2) ; Tabwidth
(setq-default js-indent-level 2) ; JavaScript

; Highlight cursor line
(global-hl-line-mode 1)

; Less jumpy scrolling
(require-package 'smooth-scroll)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
