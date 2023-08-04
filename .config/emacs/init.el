;;; init.el -*- lexical-binding: t; -*-

;;; Code:

;;;; Package

(require 'package)
(require 'json)

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

(use-package no-littering
  :ensure t
  :config
  (no-littering-theme-backups)
  (setq custom-file null-device))

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

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title nil
	dashboard-items nil
	dashboard-footer-messages
	;; See: https://github.com/NonlinearFruit/Creeds.json
	(when (file-exists-p (concat user-emacs-directory "catechism.json"))
	  (let ((json (json-read-file (concat user-emacs-directory "catechism.json"))))
	    (mapcar (lambda (qa)
		      (let* ((number (alist-get 'Number qa))
			     (question (alist-get 'Question qa))
			     (answer (alist-get 'Answer qa)))
			(with-temp-buffer
			  (insert (format "Q%d %s\n\n%s" number question answer))
			  (setq fill-column (min 70 (/ (* 2 (window-width)) 3)))
			  (fill-region (point-min) (point-max))
			  (buffer-string))))
		    (alist-get 'Data json))))
	dashboard-set-footer dashboard-footer-messages))

(use-package ef-themes
  :ensure t
  :config
  (load-theme 'ef-light :no-confirm))

;;; init.el ends here
