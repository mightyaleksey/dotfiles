(require 'package)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'package-archives
             ;;'("melpa-stable" . "https://stable.melpa.org/packages/") t)
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'ivy)
  (package-install 'js2-mode)
  (package-install 'rjsx-mode)
  (package-install 'pug-mode)
  (package-install 'xah-fly-keys)
  (package-install 'which-key)
  (package-install 'find-file-in-project)
  (package-install 'neotree)
  (package-install 'company)
  (package-install 'fireplace))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

(use-package ivy
  :config
  (ivy-mode 1))

(use-package js2-mode
  :init
  (add-hook 'js-mode-hook 'js2-minor-mode))

(use-package rjsx-mode
  :mode
  ("\\.js$" . rjsx-mode))

(use-package pug-mode)

(use-package xah-fly-keys
  :config
  (xah-fly-keys-set-layout "qwerty")
  (xah-fly-keys 1)
  (global-set-key (kbd "<home>") 'xah-fly-command-mode-activate-no-hook))

(use-package which-key
  :config
  (which-key-mode))

(use-package find-file-in-project
  :init
  (global-set-key (kbd "C-p") 'find-file-in-project))

(use-package neotree
  :config
  (setq-default neo-show-hidden-files t)
  (setq neo-smart-open t)
  (global-set-key (kbd "C-b") 'neotree-toggle)
  (define-key neotree-mode-map (kbd "k") 'neotree-next-line)
  (define-key neotree-mode-map (kbd "i") 'neotree-previous-line)
  (define-key neotree-mode-map (kbd "j") 'backward-char)
  (define-key neotree-mode-map (kbd "l") 'forward-char)
  (define-key neotree-mode-map (kbd "C-b") 'neotree-toggle)
  (define-key neotree-mode-map (kbd "C-n") nil)
  (define-key neotree-mode-map (kbd "p") nil)
  (define-key neotree-mode-map (kbd "n") nil))

(use-package company
  :init
  (global-company-mode))
