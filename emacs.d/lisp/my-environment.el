;; Jump right into the scratch buffer with no text
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)

;; No bell
(setq visible-bell t)

;; No dialog boxes
(setq use-dialog-box nil)

;; No extra window chrome
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Only Y or N
(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't prompt to follow symlinks
(setq vc-follow-symlinks nil)

(provide 'my-environment)
