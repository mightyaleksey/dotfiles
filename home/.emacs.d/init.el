(menu-bar-mode -1)
;; gnu
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; show columns in status bar
(column-number-mode)

;; always insert left/right brackets together
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

;; trim spaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; ensure newline at the end of file
(setq require-final-newline t)

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;; with iTerm2 (default light background) it looks pretty
(load-theme 'leuven)

;;(load "~/.emacs.d/packages.el")
(run-with-idle-timer 0 nil #'load "~/.emacs.d/packages.el")
