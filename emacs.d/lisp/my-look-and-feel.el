;; Set the default theme
(load-theme 'solarized-light t)

;; No dialog boxes
(setq use-dialog-box nil)

;; No extra window chrome
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; No bell
(setq visible-bell t)

;; Only Y or N prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Jump right into the scratch buffer with no text
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)

;; Customizations in use when running outside the terminal
(if (display-graphic-p)
    (progn ;; then
      ;; Chose fonts based on the operating system
      (if (eq system-type 'darwin)
      (set-face-attribute 'default nil :font "AndaleMono-14"))
      (if (eq system-type 'windows-nt)
	  (set-face-attribute 'default nil :font "Bitstream Vera Sans Mono-10.0"))
      ;; Set the default window size
      (add-to-list 'default-frame-alist '(height . 50))
      (add-to-list 'default-frame-alist '(width . 130))
      )
    ;; Else
)

(provide 'my-look-and-feel)
