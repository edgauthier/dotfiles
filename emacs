(add-to-list 'load-path "~/.emacs.d/net-lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/")

(load-library "my-packages")
(load-library "my-look")
(load-library "my-environment")
(load-library "my-buffer-mgmt")

(when (display-graphic-p)
  (server-start))
