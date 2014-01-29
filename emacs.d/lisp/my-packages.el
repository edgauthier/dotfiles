(require 'package)
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
    '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cl)
(defvar my-package-list '(color-theme-solarized
			  org
			  markdown-mode)
  "Default packages")

(defun my-packages-installed-p ()
  (loop for p in my-package-list
	when (not (package-installed-p p)) do (return nil)
	finally (return t)))

(unless (my-packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (p my-package-list)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'my-packages)
