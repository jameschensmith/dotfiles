;;; init.el -*- lexical-binding: t; -*-

(require 'package)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;; init.el ends here
