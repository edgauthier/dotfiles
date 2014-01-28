(add-to-list 'load-path "~/.emacs.d/net-lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/")

(load-library "my-packages")
(load-library "my-look")
(load-library "my-environment")
(load-library "my-buffer-mgmt")

(when (display-graphic-p)
  (server-start))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Desktop/gtdsample.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
