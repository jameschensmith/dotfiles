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

;;;; Miscellaneous

(setq-default
 backup-directory-alist
 `(("." . ,(concat user-emacs-directory "backups")))

 custom-file null-device)

;;; init.el ends here