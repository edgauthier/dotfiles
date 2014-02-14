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

;; Use IDO mode
(ido-mode 1)

;; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)

;; Use ido everywhere
(setq ido-everywhere t)

;; Complete variables/functions as well
(icomplete-mode 1)

;; Use ibuffer
(defalias 'list-buffers 'ibuffer)

;; Wrap long lines at spaces
(global-visual-line-mode 1)

;; Prefer horizontal splits
(setq split-width-threshold 9999)

;; Load changed files if there are no changes in the buffer
(global-auto-revert-mode t)

(provide 'my-environment)
