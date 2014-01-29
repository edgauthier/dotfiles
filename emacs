(add-to-list 'load-path "~/.emacs.d/net-lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/")

(load-library "my-packages")
(load-library "my-look-and-feel")
(load-library "my-environment")
(load-library "my-buffer-mgmt")
(load-library "my-key-bindings")

(when (display-graphic-p)
  (server-start))
