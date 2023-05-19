;;; init.el -*- lexical-binding: t; -*-

;;; Code:

;;;; Package

(require 'package)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;;; Dired

(use-package dired-x
  :hook (dired-mode . dired-omit-mode)
  :bind (:map dired-mode-map
	      ("o" . dired-omit-mode))
  :config
  (setq dired-omit-verbose nil))

;;;; Languages

(use-package eglot :ensure t)

(use-package markdown-mode :ensure t)

(use-package rust-mode :ensure t)

(use-package zig-mode :ensure t)

;;;; Miscellaneous

(setq-default
 backup-directory-alist
 `(("." . ,(concat user-emacs-directory "backups")))

 custom-file null-device)

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package eat
  :ensure t
  :custom
  (eat-kill-buffer-on-exit t))

;;; init.el ends here
