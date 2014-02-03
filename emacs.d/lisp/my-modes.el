;; org
(setq org-directory "~/org")
(setq org-agenda-files (list (concat org-directory "/inbox.org")
			     (concat org-directory "/misc.org")
			     (concat org-directory "/system_maint.org")
			     (concat org-directory "/active/")))
(setq org-log-done t)

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; Special handling for C-a/C-e
(setq org-special-ctrl-a/e t)

(provide 'my-modes)
