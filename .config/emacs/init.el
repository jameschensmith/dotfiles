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

;;;; Languages

(use-package eglot :ensure t)

(use-package zig-mode :ensure t)

;;;; Miscellaneous

(setq-default
 backup-directory-alist
 `(("." . ,(concat user-emacs-directory "backups")))

 custom-file null-device)

(use-package eat
  :ensure t
  :custom
  (eat-kill-buffer-on-exit t))

;;; init.el ends here
