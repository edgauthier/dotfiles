;; Don't prompt to follow symlinks
(setq vc-follow-symlinks nil)
(setq ring-bell-function 'ignore)

;; Only Y or N prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Jump right into the scratch buffer with no text
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)

(provide 'my-environment)
