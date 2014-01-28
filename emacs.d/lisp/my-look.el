(load-theme 'solarized-dark t)

(if (display-graphic-p)
    (progn ;; then
      (if (eq system-type 'darwin)
      (set-face-attribute 'default nil :font "AndaleMono-14"))
      (if (eq system-type 'windows-nt)
	  (set-face-attribute 'default nil :font "Bitstream Vera Sans Mono-10.0")))
    ;; else
)

(provide 'my-look)
