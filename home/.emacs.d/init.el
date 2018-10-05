(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
;;; http://ergoemacs.org/misc/qwerty_dvorak_table.html
(use-package xah-fly-keys
  :ensure t
  :config
  ;; dvorak-qwerty keymap
  ;; http://ergoemacs.org/misc/qwerty_dvorak_table.html
  (xah-fly-keys-set-layout "qwerty")
  (xah-fly-keys 1)

  (defun split-window-below-and-focus ()
    "Split window on two and focus one below."
    (interactive)
    (split-window-below)
    (other-window 1))

  (defun split-window-right-and-focus ()
    "Split window on two and focus one on right."
    (interactive)
    (split-window-right)
    (other-window 1))

  (defun xah-fly-command-mode-init ()
    "Set command mode keys.
Modified version 2017-01-21"
    (interactive)
    (xah-fly--define-keys
     xah-fly-key-map
     '(
       ("~" . nil)
       (":" . nil)

       ("SPC" . xah-fly-leader-key-map)
       ("DEL" . xah-fly-leader-key-map)

       ("'" . xah-reformat-lines)
       ("," . xah-shrink-whitespaces)
       ("-" . xah-cycle-hyphen-underscore-space)
       ("." . xah-backward-kill-word)
       (";" . xah-comment-dwim)
       ("/" . hippie-expand)
       ("\\" . nil)
       ("[" . xah-backward-punct )
       ("]" . xah-forward-punct)
       ("`" . other-frame)

       ("1" . xah-extend-selection)
       ("2" . xah-select-line)
       ("3" . delete-other-windows)
       ("4" . split-window-below-and-focus)
       ("5" . delete-char)
       ("6" . xah-select-block)
       ("7" . xah-select-line)
       ("8" . xah-extend-selection)
       ("9" . xah-select-text-in-quote)
       ("0" . xah-pop-local-mark-ring)

       ("a" . execute-extended-command)
       ("b" . isearch-forward)
       ("c" . previous-line)
       ("d" . xah-beginning-of-line-or-block)
       ("e" . xah-delete-backward-char-or-bracket-text)
       ("f" . undo)
       ("g" . backward-word)
       ("h" . backward-char)
       ("i" . xah-delete-current-text-block)
       ("j" . xah-copy-line-or-region)
       ("k" . xah-paste-or-paste-previous)
       ("l" . xah-insert-space-before)
       ("m" . xah-backward-left-bracket)
       ("n" . forward-char)
       ("o" . open-line)
       ("p" . xah-kill-word)
       ("q" . xah-cut-line-or-region)
       ("r" . forward-word)
       ("s" . xah-end-of-line-or-block)
       ("t" . next-line)
       ("u" . xah-fly-insert-mode-activate)
       ("v" . xah-forward-right-bracket)
       ("w" . xah-next-window-or-frame)
       ("x" . xah-toggle-letter-case)
       ("y" . set-mark-command)
       ("z" . xah-goto-matching-bracket)

       ;; russian analog
       ("й" . xah-reformat-lines)
       ("ц" . xah-shrink-whitespaces)
       ("э" . xah-cycle-hyphen-underscore-space)
       ("у" . xah-backward-kill-word)
       ("я" . xah-comment-dwim)
       ("х" . hippie-expand)
       ("ё" . nil)

       ("ф" . execute-extended-command)
       ("т" . isearch-forward)
       ("ш" . previous-line)
       ("р" . xah-beginning-of-line-or-block)
       ("в" . xah-delete-backward-char-or-bracket-text)
       ("н" . undo)
       ("г" . backward-word)
       ("о" . backward-char)
       ("п" . xah-delete-current-text-block)
       ("с" . xah-copy-line-or-region)
       ("м" . xah-paste-or-paste-previous)
       ("з" . xah-insert-space-before)
       ("ь" . xah-backward-left-bracket)
       ("д" . forward-char)
       ("ы" . open-line)
       ("к" . xah-kill-word)
       ("ч" . xah-cut-line-or-region)
       ("щ" . forward-word)
       ("ж" . xah-end-of-line-or-block)
       ("л" . next-line)
       ("а" . xah-fly-insert-mode-activate)
       ("ю" . xah-forward-right-bracket)
       ("б" . xah-next-window-or-frame)
       ("и" . xah-toggle-letter-case)
       ("е" . set-mark-command)
       ("/" . xah-goto-matching-bracket)))

    (define-key xah-fly-key-map (kbd "a")
      (if (fboundp 'smex) 'smex (if (fboundp 'helm-M-x) 'helm-M-x 'execute-extended-command)))

    (progn
      (setq xah-fly-insert-state-q nil )
      (modify-all-frames-parameters (list (cons 'cursor-type 'box))))

    (setq mode-line-front-space "C")
    (force-mode-line-update))

  (defun xah-fly-insert-mode-init ()
    "Set insertion mode keys"
    (interactive)

    (xah-fly--define-keys
     xah-fly-key-map
     '(

       ("SPC" . nil)
       ("DEL" . nil)

       ("'" . nil)
       ("," . nil)
       ("-" . nil)
       ("." . nil)
       ("/" . nil)
       (";" . nil)
       ("=" . nil)
       ("[" . nil)
       ("\\" . nil)
       ("]" . nil)
       ("`" . nil)
       ("~" . nil)

       ("1" . nil)
       ("2" . nil)
       ("3" . nil)
       ("4" . nil)
       ("5" . nil)
       ("6" . nil)
       ("7" . nil)
       ("8" . nil)
       ("9" . nil)
       ("0" . nil)

       ("a" . nil)
       ("b" . nil)
       ("c" . nil)
       ("d" . nil)
       ("e" . nil)
       ("f" . nil)
       ("g" . nil)
       ("h" . nil)
       ("i" . nil)
       ("j" . nil)
       ("k" . nil)
       ("l" . nil)
       ("m" . nil)
       ("n" . nil)
       ("o" . nil)
       ("p" . nil)
       ("q" . nil)
       ("r" . nil)
       ("s" . nil)
       ("t" . nil)
       ("u" . nil)
       ("v" . nil)
       ("w" . nil)
       ("x" . nil)
       ("y" . nil)
       ("z" . nil)

       ;; russian analog
       ("й" . nil)
       ("ц" . nil)
       ("э" . nil)
       ("у" . nil)
       ("я" . nil)
       ("х" . nil)
       ("ё" . nil)

       ("ф" . nil)
       ("т" . nil)
       ("ш" . nil)
       ("р" . nil)
       ("в" . nil)
       ("н" . nil)
       ("г" . nil)
       ("о" . nil)
       ("п" . nil)
       ("с" . nil)
       ("м" . nil)
       ("з" . nil)
       ("ь" . nil)
       ("д" . nil)
       ("ы" . nil)
       ("к" . nil)
       ("ч" . nil)
       ("щ" . nil)
       ("ж" . nil)
       ("л" . nil)
       ("а" . nil)
       ("ю" . nil)
       ("б" . nil)
       ("и" . nil)
       ("е" . nil)
       ("/" . nil)))

    (progn
      (setq xah-fly-insert-state-q t )
      (modify-all-frames-parameters (list (cons 'cursor-type 'bar))))

    (setq mode-line-front-space "I")
    (force-mode-line-update))

  (defun my-previous-word-at-point ()
    "Find previous occurrence of the word at point."
    (interactive)
    (word-search-backward (thing-at-point 'symbol)))

  (defun my-next-word-at-point ()
    "Find next occurrence of the word at point."
    (interactive)
    (word-search-forward (thing-at-point 'symbol)))

  (xah-fly--define-keys
   (define-prefix-command 'my-goto-anything-keymap)
   '(
     ("e" . my-previous-word-at-point) ; d
     ("u" . my-next-word-at-point) ; f
     ("i" . find-file-in-project-at-point) ; g

     ;; russian analog
     ("в" . my-previous-word-at-point)
     ("а" . my-next-word-at-point)
     ("п" . find-file-in-project-at-point)))

  (xah-fly--define-keys
   xah-fly-leader-key-map
   '(
     ("4" . split-window-right-and-focus)
     ("v" . my-goto-anything-keymap) ; .

     ;; russian analog
     ("ю" . my-goto-anything-keymap)))

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

(use-package find-file-in-project
  :ensure t
  :config
  (defun safe-find-file-in-project ()
    "Same as `find-file-in-project`, except avoids search in the home directory."
    (interactive)
    (if (equal (ffip-get-project-root-directory) "~/")
        (message "Since project directory is `~/`, use open-file.")
      (find-file-in-project)))

  (global-set-key (kbd "C-p") 'safe-find-file-in-project)

  ;; russian analog
  (global-set-key (kbd "C-з") 'safe-find-file-in-project))

(use-package all-the-icons
  :ensure t)
;; todo simplify the installation
;; M-x all-the-icons-install-fonts
(use-package neotree
  :ensure t
  :config
  (defun neo-buffer--insert-root-entry (node)
    "Shorter pwd in neotree."
    (neo-buffer--node-list-set nil node)
    (when (display-graphic-p)
      (insert
       (concat
        (all-the-icons-octicon
         "repo"
         :height 1.4
         :face 'neo-root-dir-face
         :v-adjust -0.1)
        (propertize " " 'face 'neo-root-dir-face))))
    (insert
     (propertize (neo-path--file-short-name node) 'face 'neo-root-dir-face))
    (neo-buffer--newline-and-begin))

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))

  (defun neotree-project-dir-toggle ()
    "Toggle show the NeoTree window using the git root."
    (interactive)
    (if (neo-global--window-exists-p)
        (neotree-hide)
      (neotree-project-dir)))

  (setq-default neo-show-hidden-files t)
  (setq neo-show-updir-line nil)
  (setq neo-smart-open t)
  (setq neo-theme (if (display-graphic-p) 'icons 'ascii))
  (define-key neotree-mode-map (kbd "k") 'neotree-next-line)
  (define-key neotree-mode-map (kbd "i") 'neotree-previous-line)
  (define-key neotree-mode-map (kbd "j") 'backward-char)
  (define-key neotree-mode-map (kbd "l") 'forward-char)
  (define-key neotree-mode-map (kbd "C-b") 'neotree-toggle)
  (define-key neotree-mode-map (kbd "C-n") nil)
  (define-key neotree-mode-map (kbd "p") nil)
  (define-key neotree-mode-map (kbd "n") nil)
  (global-set-key (kbd "C-b") 'neotree-project-dir-toggle)

  ;; russian analog
  (define-key neotree-mode-map (kbd "л") 'neotree-next-line)
  (define-key neotree-mode-map (kbd "ш") 'neotree-previous-line)
  (define-key neotree-mode-map (kbd "о") 'backward-char)
  (define-key neotree-mode-map (kbd "д") 'forward-char)
  (define-key neotree-mode-map (kbd "C-и") 'neotree-toggle)
  (define-key neotree-mode-map (kbd "C-т") nil)
  (define-key neotree-mode-map (kbd "з") nil)
  (define-key neotree-mode-map (kbd "т") nil)
  (global-set-key (kbd "C-и") 'neotree-project-dir-toggle))

(use-package js2-mode
  :ensure t
  :init
  (add-hook 'js-mode-hook 'js2-minor-mode)
  (setq js2-bounce-indent-p t))

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
		      :height 140
		      :weight 'normal
		      :width 'normal)
  (setq-default line-spacing 2))

(setq inhibit-startup-screen t)
(column-number-mode)
(global-linum-mode)

(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(electric-pair-mode 1)

(global-set-key (kbd "C-/") 'comment-line)

(defun my-setup-indent (n)
  (setq css-indent-offset n) ; css-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode
  (setq pug-tab-width n)
  (setq sgml-basic-offset n)
  (setq standard-indent n))

(setq-default indent-tabs-mode nil)
(my-setup-indent 2)
