;; Don't prompt to follow symlinks
(setq vc-follow-symlinks nil)
(setq ring-bell-function 'ignore)

;; Only Y or N prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Jump right into the scratch buffer with no text
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)

;; Ignore case for buffer matching
(setq read-buffer-completion-ignore-case t)

;; Wrap long lines at spaces
(setq global-visual-line-mode 1)

;; Prefer horizontal splits
(setq split-width-threshold 9999)

(provide 'my-environment)
