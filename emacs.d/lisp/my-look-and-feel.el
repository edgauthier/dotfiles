;; Set theme
(setq color-theme-is-global t)

(setq my-color-themes (list
  'tangotango
  'zenburn
;;  'solarized-dark
  'solarized-light
))

(defun my-theme-set-default () ; Set the first row
  (interactive)
  (setq theme-current my-color-themes)
  (load-theme (car theme-current) t))

(defun my-describe-theme () ; Show the current theme
  (interactive)
  (message "%s" (car theme-current)))

(defun my-theme-cycle ()            
  (interactive)
  (disable-theme (car theme-current))
  (setq theme-current (cdr theme-current))
  (if (null theme-current)
      (setq theme-current my-color-themes))
  (load-theme (car theme-current) t)
  ;; Fonts keep getting rest back to 9pt for some reason
  ;; Fix up on each operating system differently
  (if (eql system-type 'darwin)
      (set-face-attribute 'default nil :height 140))
  (if (eql system-type 'windows-nt)
      (set-face-attribute 'default nil :height 100))
  (message "%S" (car theme-current)))

(setq theme-current my-color-themes)
(setq color-theme-is-global nil) ; Initialization
(my-theme-set-default)
(global-set-key [f4] 'my-theme-cycle)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Other look and feel settings

;; No dialog boxes
(setq use-dialog-box nil)

;; No extra window chrome
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; No bell
(setq visible-bell t)

(provide 'my-look-and-feel)
