; Setting up the package manager
(require 'package)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :init (exec-path-from-shell-initialize))

; Setup theme
(use-package zenburn-theme
  :config (load-theme 'zenburn t))

(use-package better-defaults)

; Projectile
(use-package projectile
  :config (projectile-global-mode t)
          (setq projectile-use-git-grep t))

; From: http://tuhdo.github.io/helm-intro.html
(use-package helm
  :bind (("C-c h" . helm-command-prefix)
         ("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring-package)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files))
  :config (require 'helm-config)
          (helm-mode 1)
          (global-unset-key (kbd "C-x c"))
          (global-set-key (kbd "C-c h o") 'helm-occur))

; Enable lookup of recently opened files
(recentf-mode t)

; Press C-h after starting keystroke sequence to lookup available commands
(use-package helm-descbinds
  :config (helm-descbinds-mode))

; Flycheck
(use-package flycheck
  :config (add-hook 'after-init-hook #'global-flycheck-mode)
          (use-package flycheck-pos-tip
            :config (flycheck-pos-tip-mode)))

; Magit for Git manipulation
(use-package magit
  :bind ("C-x g" . magit-status))

(use-package nyan-mode
  :config (nyan-mode t))

; Clojure Development
(use-package cider)
(use-package clojure-mode)

; Enable evil-mode
(use-package evil
  :config (evil-mode 1)
          ; Enable VIM-like tabbing
          (use-package evil-tabs
            :config (global-evil-tabs-mode t)))

(setq visible-bell nil)
(setq ring-bell-function 'ignore)

; Display line numbers
(global-linum-mode 1)

; Display column number
(column-number-mode 1)

(setq tab-width 2) ; Tabwidth
(setq-default js-indent-level 2) ; JavaScript

; Highlight cursor line
(global-hl-line-mode 1)

; Less jumpy scrolling
(use-package smooth-scroll
  :config (setq scroll-step 1)
          (setq scroll-conservatively 10000)
          (setq auto-window-vscroll nil))

; Remove trailing whitespace upon saving a file
(add-hook 'before-save-hook 'delete-trailing-whitespace)
