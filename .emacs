;; -*- lexical-binding: t -*-

;; measure startup time
(add-hook 'emacs-startup-hook (lambda ()
  (message "Loaded in %s with %d garbage collections."
    (format "%.2f seconds"
      (float-time (time-subtract after-init-time before-init-time)))
      gcs-done)))

;; defer compilations
(defvar comp-deferred-compliation)
(setq comp-deferred-compilation t)
;; improve performance
(setq package-enable-at-startup nil)
(setq frame-inhibit-implied-resize t)

;; update directories
(setq package-user-dir "~/.config/emacs/packages")
(setq remember-data-file "~/.config/emacs/notes")
(setq-default user-emacs-directory "~/.config/emacs/")

;; UI & UX experience
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq initial-buffer-choice nil)
;; no scroll bars.
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode 0))
;; no menu and toolbar.
(menu-bar-mode 0)
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode 0))
;; customize modeline.
;;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Mode-Line-Variables.html#Mode-Line-Variables
;;; https://github.com/kgaipal/emacs/blob/master/lisp/mode-line-customization.el
(defun t-modeline-space-between (left right)
  (let ((available-width (- (window-total-width)
          (+ (length (format-mode-line left))
             (length (format-mode-line right))))))
    (list left (make-string available-width (string-to-char " ")) right)))
;; show utf-8 instead of U.
;; coding-system-alist - available coding system names.
(defvar t-modeline-encoding
  '(:eval (upcase (replace-regexp-in-string "-\\(dos\\|mac\\|unix\\)" "" (symbol-name buffer-file-coding-system)))))
(put 't-modeline-encoding 'risky-local-variable t)
(setq-default mode-line-format
        '((:eval (t-modeline-space-between
      (format-mode-line (list " " (propertize "%b" 'face 'mode-line-buffer-id)))
      (format-mode-line (list "Ln %l, Col %c" "   " 't-modeline-encoding "   " 'mode-name " " 'minor-mode-alist " "))))))

;; keybindings
;; replace C-x
(global-set-key (kbd "C-w") ctl-x-map)
(global-set-key (kbd "C-x") nil)

;; set encoding
(prefer-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
;; backups
(setq-default auto-save-default nil)
(setq-default auto-save-file-name-transforms '((".*" "~/.config/emacs/autosave/" t)))
(setq-default auto-save-list-file-prefix "~/.config/emacs/autosave/")
(setq-default backup-directory-alist '(("." . "~/.config/emacs/backups/")))
(setq-default delete-old-versions t)
(setq-default make-backup-files t)

;; show "notes" initially if scratch is opened (no file loaded),
;; the changes will be saved automatically
(add-hook 'emacs-startup-hook (lambda ()
  (when (eq (current-buffer) (get-buffer "*scratch*"))
    (setq remember-notes-auto-save-visited-file-name t)
    (remember-notes t))))