(load-theme 'solarized-dark t)

(if (display-graphic-p)
    (progn ;; then
      (set-face-attribute 'default nil :font "AndaleMono-14"))
    ;; else
)

(provide 'my-look)
