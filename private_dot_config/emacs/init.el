(setq inhibit-startup-message t) ; Disable startup screen.
(setq column-number-mode t)      ; Display current column.

(scroll-bar-mode -1) ; Disable visible scrollbar.
(tool-bar-mode -1)   ; Disable toolbar.
(tooltip-mode -1)    ; Disable tooltips.
(menu-bar-mode -1)   ; Disable menu bar.

;; Display line numbers.
(global-display-line-numbers-mode)

;; Bootstrap straight.el package manager.
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Use straight.el for use-package expressions.
(straight-use-package 'use-package)

;; Always use straight.el with use-package.
(setq straight-use-package-by-default t)

;; Define Norman keyboard layout for ErgoEmacs.
(defvar ergoemacs-layout-norman
  '("" "`" "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "-" "=" ""
    "" ""  "q" "w" "d" "f" "k" "j" "u" "r" "l" ";" "[" "]" "\\"
    "" ""  "a" "s" "e" "t" "g" "y" "n" "i" "o" "h" "'" "" ""
    "" ""  "z" "x" "c" "v" "b" "p" "m" "," "." "/" "" "" ""
    ;; Shifted
    "" "~" "!" "@" "#" "$" "%" "^" "&" "*" "(" ")" "_" "+" ""
    "" ""  "Q" "W" "D" "F" "K" "J" "U" "R" "L" ":" "{" "}" "|"
    "" ""  "A" "S" "E" "T" "G" "Y" "N" "I" "O" "H" "\"" "" ""
    "" ""  "Z" "X" "C" "V" "B" "P" "M" "<" ">" "?" "" "" "")
  "US Norman layout.")

;; Use ErgoEmacs keybindings.
(use-package ergoemacs-mode
  :init
  (setq ergoemacs-theme nil)
  (setq ergoemacs-keyboard-layout "norman")
  :config
  (ergoemacs-mode 1))

;; Use Dracula theme.
(use-package dracula-theme
  :config
  (load-theme 'dracula t))
