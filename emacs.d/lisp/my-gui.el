;; Customizations in use when running outside the terminal
(if (display-graphic-p)
    (progn ;; then
      ;; Chose fonts based on the operating system
      (if (eql system-type 'darwin)
      (set-face-attribute 'default nil :font "DejaVuSansMono-14"))
      (if (eql system-type 'windows-nt)
	  (set-face-attribute 'default nil :font "DejaVu Sans Mono-10.0"))
      ;; Set the default window size
      (add-to-list 'default-frame-alist '(height . 40))
      (add-to-list 'default-frame-alist '(width . 130))
      )
    ;; Else
)

(provide 'my-gui)
