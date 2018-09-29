(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defun my-previous-word-at-point ()
  "Find previous occurrence of the word at point."
  (interactive)
  (word-search-backward (thing-at-point 'symbol)))

(defun my-next-word-at-point ()
  "Find next occurrence of the word at point."
  (interactive)
  (word-search-forward (thing-at-point 'symbol)))

(require 'use-package)
;;; http://ergoemacs.org/misc/qwerty_dvorak_table.html
(use-package xah-fly-keys
  :ensure t
  :config
  (xah-fly-keys-set-layout "qwerty")
  (xah-fly-keys 1)
  (define-prefix-command 'my-goto-anything-keymap)
  (define-key my-goto-anything-keymap (kbd "d") 'my-previous-word-at-point)
  (define-key my-goto-anything-keymap (kbd "f") 'my-next-word-at-point)
  (define-key my-goto-anything-keymap (kbd "g") 'dumb-jump-go)
  (define-key xah-fly-leader-key-map (kbd ".") my-goto-anything-keymap)
  (global-set-key (kbd "<home>") 'xah-fly-command-mode-activate-no-hook))
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package company
  :ensure t
  :init
  (global-company-mode))

(use-package ivy
  :ensure t
  :init
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-mode 1))

(use-package dumb-jump
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (global-set-key (kbd "C-p") 'project-find-file))

(use-package neotree
  :ensure t
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

(use-package js2-mode
  :ensure t
  :init
  (add-hook 'js-mode-hook 'js2-minor-mode))

(use-package rjsx-mode
  :ensure t
  :mode
  ("\\.js$" . rjsx-mode))

(use-package pug-mode
  :ensure t)

(use-package github-modern-theme
  :ensure t
  :init
  ;; Color fix for os x terminal. Emacs maps incorrect colors,
  ;; for example, white is grey and etc.
  (if (eq window-system nil)
      (defvar github-default-colors-alist
        '(("github-border"                 . "color-252")
          ("github-comment"                . "color-66")
          ("github-constant"               . "color-26")
          ("github-diff-added"             . "color-195")
          ("github-diff-added-highlight"   . "color-157")
          ("github-diff-changed"           . "color-223")
          ("github-diff-changed-highlight" . "color-221")
          ("github-diff-removed"           . "color-231")
          ("github-diff-removed-highlight" . "color-217")
          ("github-function"               . "color-61")
          ("github-header-bg"              . "color-167")
          ("github-header-fg"              . "color-231")
          ("github-highlight"              . "color-230")
          ("github-header-bg"              . "color-16")
          ("github-header-fg"              . "color-145")
          ("github-html-tag"               . "color-29")
          ("github-keyword"                . "color-167")
          ("github-selection"              . "color-69")
          ("github-string"                 . "color-17")
          ("github-text"                   . "color-16")
          ("github-white"                  . "color-231")))
    nil)
  (load-theme 'github-modern t))

(use-package fireplace
  :ensure t)


(menu-bar-mode -1)
(when (display-graphic-p)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)
  (set-face-attribute 'default nil
		      :family "Meslo LG S"
		      :height 160
		      :weight 'normal
		      :width 'normal))

(setq inhibit-startup-screen t)
(column-number-mode)
(global-linum-mode)

(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(electric-pair-mode 1)

(defun my-setup-indent (n)
  (setq css-indent-offset n) ; css-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode
  (setq pug-tab-width n)
  (setq sgml-basic-offset n)
  (setq standard-indent n))

(setq-default indent-tabs-mode nil)
(my-setup-indent 2)
