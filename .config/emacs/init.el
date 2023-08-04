;;; init.el -*- lexical-binding: t; -*-

;;; Code:

;;;; Package

(require 'package)

(setq-default
 package-archives
 '(("elpa"        . "https://elpa.gnu.org/packages/")
   ("elpa-nongnu" . "https://elpa.nongnu.org/nongnu/")
   ("melpa"       . "https://melpa.org/packages/")))

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

(use-package csharp-mode :ensure t)

(use-package typescript-mode :ensure t)

(use-package zig-mode :ensure t)

(use-package yaml-mode :ensure t)

;;;; Miscellaneous

(setq-default
 backup-directory-alist
 `(("." . ,(concat user-emacs-directory "backups")))

 custom-file null-device)

(use-package devil
  :ensure t
  :config
  (global-devil-mode))

(use-package exec-path-from-shell
  :if (and (display-graphic-p) (eq system-type 'darwin))
  :ensure t
  :config
  (exec-path-from-shell-initialize))

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
