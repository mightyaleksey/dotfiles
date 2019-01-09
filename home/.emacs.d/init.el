(setq startup-time (current-time))

(add-hook 'after-init-hook
          (lambda ()
            (setq elapsed-time (float-time (time-subtract (current-time) startup-time)))))

(defun display-startup-echo-area-message ()
  (message "Loaded in %.3fs" elapsed-time))


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

(column-number-mode)


(require 'package)

(setq inhibit-startup-screen t
      make-backup-files nil ; stop creating backup~ files
      auto-save-default nil ; stop creating #autosave# files
      create-lockfiles nil
      package-archives
      '(("gnu"          . "http://elpa.gnu.org/packages/")
        ("melpa"        . "http://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/"))
      package-archive-priorities
      '(("gnu" . 0)
        ("melpa" . 5)
        ("melpa-stable" . 10))
      package-enable-at-startup nil)

(package-initialize nil)


(defun my-auto-package-refresh-contents (&rest args)
  (package-refresh-contents)
  (advice-remove 'package-install 'my-auto-package-refresh-contents))

(advice-add 'package-install :before 'my-auto-package-refresh-contents)


(unless (package-installed-p 'use-package)
  (message "EMACS install use-package")
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


(defun qwerty--define-keys (@keymap-name @key-cmd-alist)
  (interactive)
  (mapc
   (lambda ($pair)
     (define-key @keymap-name (kbd (car $pair)) (cdr $pair)))
   @key-cmd-alist))


(use-package xah-fly-keys
  :init
  (setq xah-fly-use-control-key nil)
  :config
  (xah-fly-keys-set-layout "qwerty")

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
    "Set command mode keys."
    (interactive)
    (qwerty--define-keys
     xah-fly-key-map
     '(
       ("~" . nil)
       (":" . nil)

       ("SPC" . xah-fly-leader-key-map)
       ("DEL" . xah-fly-leader-key-map)

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
       ("-" . xah-backward-punct)
       ("=" . xah-forward-punct)

       ("q" . xah-reformat-lines)
       ("w" . xah-shrink-whitespaces)
       ("e" . xah-backward-kill-word)
       ("r" . xah-kill-word)
       ("t" . set-mark-command)
       ("y" . undo)
       ("u" . backward-word)
       ("i" . previous-line)
       ("o" . forward-word)
       ("p" . xah-insert-space-before)
       ("[" . hippie-expand)
       ;; ("]" . xah-forward-equal-sign)
       ("a" . execute-extended-command)
       ("s" . open-line)
       ("d" . xah-delete-backward-char-or-bracket-text)
       ("f" . xah-fly-insert-mode-activate)
       ("g" . xah-delete-current-text-block)
       ("h" . xah-beginning-of-line-or-block)
       ("j" . backward-char)
       ("k" . next-line)
       ("l" . forward-char)
       (";" . xah-end-of-line-or-block)
       ("'" . xah-cycle-hyphen-underscore-space)
       ("\\" . nil)
       ("`" . other-frame)
       ("z" . xah-comment-dwim)
       ("x" . xah-cut-line-or-region)
       ("c" . xah-copy-line-or-region)
       ("v" . xah-paste-or-paste-previous)
       ("b" . xah-toggle-letter-case)
       ("n" . isearch-forward)
       ("m" . xah-backward-left-bracket)
       ("," . xah-next-window-or-frame)
       ("." . xah-forward-right-bracket)
       ("/" . xah-goto-matching-bracket)
       ))

    (define-key xah-fly-key-map (kbd "a")
      (if (fboundp 'smex) 'smex (if (fboundp 'helm-M-x) 'helm-M-x 'execute-extended-command)))

    (progn
      (setq xah-fly-insert-state-q nil )
      (modify-all-frames-parameters (list (cons 'cursor-type 'box))))

    (setq mode-line-front-space "C")
    (force-mode-line-update))

  (defun xah-fly-insert-mode-init ()
    "Set insertion mode keys."
    (interactive)
    (qwerty--define-keys
     xah-fly-key-map
     '(
       ("~" . nil)
       (":" . nil)

       ("SPC" . nil)
       ("DEL" . nil)

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
       ("-" . nil)
       ("=" . nil)

       ("q" . nil)
       ("w" . nil)
       ("e" . nil)
       ("r" . nil)
       ("t" . nil)
       ("y" . nil)
       ("u" . nil)
       ("i" . nil)
       ("o" . nil)
       ("p" . nil)
       ("[" . nil)
       ("]" . nil)
       ("a" . nil)
       ("s" . nil)
       ("d" . nil)
       ("f" . nil)
       ("g" . nil)
       ("h" . nil)
       ("j" . nil)
       ("k" . nil)
       ("l" . nil)
       (";" . nil)
       ("'" . nil)
       ("\\" . nil)
       ("`" . nil)
       ("z" . nil)
       ("x" . nil)
       ("c" . nil)
       ("v" . nil)
       ("b" . nil)
       ("n" . nil)
       ("m" . nil)
       ("," . nil)
       ("." . nil)
       ("/" . nil)
       ))

    (progn
      (setq xah-fly-insert-state-q t)
      (modify-all-frames-parameters (list (cons 'cursor-type 'bar))))

    (setq mode-line-front-space "I")
    (force-mode-line-update))

  (qwerty--define-keys
   xah-fly-key-map
   '(
     ("C-a" . mark-whole-buffer)
     ("C-n" . xah-new-empty-buffer)
     ("C-o" . find-file)
     ("C-s" . save-buffer)
     ("C-v" . yank)
     ("C-w" . xah-close-current-buffer)
     ("C-z" . undo)
     ))

  (qwerty--define-keys
   xah-fly-leader-key-map
   '(
     ("4" . split-window-right-and-focus)))

  (global-set-key (kbd "<home>") 'xah-fly-command-mode-activate-no-hook)

  (defun xah-fly-keys-russian-on ()
    "Add russian layout keys."
    (interactive)
    (progn
      (qwerty--define-keys
       xah-fly-key-map
       '(
         ("й" . xah-reformat-lines)
         ("ц" . xah-shrink-whitespaces)
         ("у" . xah-backward-kill-word)
         ("к" . xah-kill-word)
         ("е" . set-mark-command)
         ("н" . undo)
         ("г" . backward-word)
         ("ш" . previous-line)
         ("щ" . forward-word)
         ("з" . xah-insert-space-before)
         ("х" . hippie-expand)
         ("ф" . execute-extended-command)
         ("ы" . open-line)
         ("в" . xah-delete-backward-char-or-bracket-text)
         ("а" . xah-fly-insert-mode-activate)
         ("п" . xah-delete-current-text-block)
         ("р" . xah-beginning-of-line-or-block)
         ("о" . backward-char)
         ("л" . next-line)
         ("д" . forward-char)
         ("ж" . xah-end-of-line-or-block)
         ("э" . xah-cycle-hyphen-underscore-space)
         ("ё" . nil)
         ("я" . xah-comment-dwim)
         ("ч" . xah-cut-line-or-region)
         ("с" . xah-copy-line-or-region)
         ("м" . xah-paste-or-paste-previous)
         ("и" . xah-toggle-letter-case)
         ("т" . isearch-forward)
         ("ь" . xah-backward-left-bracket)
         ("б" . xah-next-window-or-frame)
         ("ю" . xah-forward-right-bracket)
         ))))

  (defun xah-fly-keys-russian-off ()
    "Remove russian layout keys."
    (interactive)
    (progn
      (qwerty--define-keys
       xah-fly-key-map
       '(
         ("й" . nil)
         ("ц" . nil)
         ("у" . nil)
         ("к" . nil)
         ("е" . nil)
         ("н" . nil)
         ("г" . nil)
         ("ш" . nil)
         ("щ" . nil)
         ("з" . nil)
         ("х" . nil)
         ("ф" . nil)
         ("ы" . nil)
         ("в" . nil)
         ("а" . nil)
         ("п" . nil)
         ("р" . nil)
         ("о" . nil)
         ("л" . nil)
         ("д" . nil)
         ("ж" . nil)
         ("э" . nil)
         ("ё" . nil)
         ("я" . nil)
         ("ч" . nil)
         ("с" . nil)
         ("м" . nil)
         ("и" . nil)
         ("т" . nil)
         ("ь" . nil)
         ("б" . nil)
         ("ю" . nil)
         ))))

  (add-hook 'xah-fly-command-mode-activate-hook 'xah-fly-keys-russian-on)
  (add-hook 'xah-fly-insert-mode-activate-hook 'xah-fly-keys-russian-off)

  (xah-fly-keys 1))

(use-package which-key
  :config
  (which-key-mode))

;; http://ergoemacs.org/emacs/emacs_key_notation_return_vs_RET.html
(use-package multiple-cursors
  :commands
  (mc/mark-previous-like-this
   mc/mark-next-like-this
   mc/mark-next-like-this-word
   mc/skip-to-next-like-this
   mc/edit-ends-of-lines)
  :bind
  (("C-k" . mc/mark-next-like-this)
   ("C-d" . mc/mark-next-like-this-word)
   ("C-f" . mc/skip-to-next-like-this)
   ("C-l" . mc/edit-ends-of-lines)))


(use-package ivy
  :init
  (setq ivy-extra-directories nil
        ivy-re-builders-alist '((read-file-name-internal . ivy--regex-plus)
                                (t . ivy--regex-fuzzy)))
  (ivy-mode 1))


(use-package find-file-in-project
  :config
  (defun safe-find-file-in-project ()
    "Same as `find-file-in-project`, except avoids search in the home directory."
    (interactive)
    (if (equal (ffip-get-project-root-directory) "~/")
        (message "Since project directory is `~/`, use open-file.")
      (find-file-in-project)))

  (qwerty--define-keys
   global-map
   '(
     ("C-p" . safe-find-file-in-project)
     ;; russian analog
     ("C-з" . safe-find-file-in-project)
     )))


(use-package all-the-icons)
(use-package neotree
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

  (defun neotree-open-file-and-hide ()
    "Open file and hide NeoTree window."
    (interactive)
    (if (not (file-directory-p
              (neo-buffer--get-filename-current-line)))
        (progn
          (neotree-enter)
          (neotree-hide))
      (neotree-enter)))

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
  (setq neo-show-updir-line nil
        neo-smart-open t
        neo-theme (if (display-graphic-p) 'icons 'ascii))

  (qwerty--define-keys
   neotree-mode-map
   '(
     ("RET" . neotree-open-file-and-hide)
     ("k"   . neotree-next-line)
     ("i"   . neotree-previous-line)
     ("j"   . backward-char)
     ("l"   . forward-char)
     ("C-b" . neotree-toggle)
     ("C-n" . nil)
     ("p"   . nil)
     ("n"   . nil)
     ;; russian analog
     ("л" . neotree-next-line)
     ("ш" . neotree-previous-line)
     ("о" . backward-char)
     ("д" . forward-char)
     ("C-и" . neotree-toggle)
     ("C-т" . nil)
     ("з" . nil)
     ("т" . nil)
     ))
  (qwerty--define-keys
   global-map
   '(
     ("C-b" . neotree-project-dir)
     ;; russian analog
     ("C-и" . neotree-project-dir))
   ))


(use-package company)
(use-package flycheck)
(use-package tide
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package css-mode
  :mode
  ("\\.styl$" . css-mode))
(use-package pug-mode)

(use-package js2-mode
  :init
  (setq-default js-indent-align-list-continuation nil
                js2-strict-trailing-comma-warning nil)
  (add-hook 'js-mode-hook 'js2-minor-mode)
  :config
  (defun js--multi-line-declaration-indentation ()
    "Override the default function `js--multi-line-declaration-indentation',
which is a helper for the multiline variable declaration.
The default behavior spoils indentation for the beggining of chain
on the second line in expression. Since usage of multiline variable declaration
is unpopular nowadays (it produces additional diffs in case you need to add or remove smthing),
turn off indentation support for it."
    nil))

(use-package rjsx-mode
  :mode
  ("\\.js$" . rjsx-mode)
  :config
  (define-key rjsx-mode-map "<" nil)
  (define-key rjsx-mode-map (kbd "C-d") nil)
  (define-key rjsx-mode-map ">" nil))


(use-package linum
  :init
  (setq linum-format " %d ")
  :hook ((css-mode . linum-mode)
         (js-mode . linum-mode)
         (typescript-mode . linum-mode)))


(use-package fireplace)

(use-package github-modern-theme
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


(define-key global-map (kbd "C-\\") 'comment-line)


(setq require-final-newline t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(electric-pair-mode 1)


(defun my-setup-indent (n)
  (setq css-indent-offset n ; css-mode
        js-indent-level n ; js-mode
        js2-basic-offset n ; js2-mode
        pug-tab-width n
        sgml-basic-offset n
        standard-indent n
        typescript-indent-level n))

(setq-default indent-tabs-mode nil)
(my-setup-indent 2)
