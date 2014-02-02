;; org
(setq org-directory "~/org")
(setq org-agenda-files (list (concat org-directory "/inbox.org")
			     (concat org-directory "/misc.org")
			     (concat org-directory "/system_maint.org")
			     (concat org-directory "/active/")))
(setq org-log-done t)

(provide 'my-modes)
