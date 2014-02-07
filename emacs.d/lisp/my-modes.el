;; org
(require 'org)
(require 'cl)

;; default directories
(setq org-directory "~/org")
(setq org-agenda-files (list (concat org-directory "/inbox.org")
			     (concat org-directory "/system_maint.org")
			     (concat org-directory "/active/")))

;; Location for capture items
(setq org-default-notes-file (concat org-directory "/inbox.org"))

;; Todo states
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)")))

;; Org structure
(setq org-log-into-drawer 'LOGBOOK)
(setq org-startup-indented t)
(setq org-catch-invisible-edits 'smart)

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
				 (org-agenda-files :maxlevel . 9))))

;; Special handling for C-a/C-e/C-k
(setq org-special-ctrl-a/e t)
(setq org-special-ctrl-k t)
(setq org-ctrl-k-protect-subtree t)

;; Handle Outlook links
(org-add-link-type "outlook" 'org-outlook-open)

(defun org-outlook-open (id)
   "Open the Outlook item identified by ID.  ID should be an Outlook GUID."
   (w32-shell-execute "open" "C:/Program Files (x86)/Microsoft Office/Office14/OUTLOOK.EXE" (concat "/select " "outlook:" id)))

;; Other customization
(setq org-return-follows-link t) ; really - who wants to use the mouse
(setq org-agenda-ignore-drawer-properties '(effort appt category)) ; not using these - speed up agendas

;; Agenda configuration
(setq org-agenda-span 'day) ; Only display a single day by default
(setq org-agenda-todo-ignore-with-date t) ; Don't show items with dates on TODO list - they're already planned for a date
(setq org-agenda-dim-blocked-tasks t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-enforce-todo-dependencies t)

;; Custom Agenda Views
(setq org-agenda-custom-commands
      '(("a" "Daily Agenda" 
	 ((tags-todo "morning" 
		  ((org-agenda-overriding-header "Morning Tasks")
		   (org-agenda-todo-ignore-with-date nil)
		   (org-agenda-todo-ignore-scheduled 'future)
		   (org-agenda-todo-ignore-deadlines 'future)
		   (org-agenda-hide-tags-regexp "morning")))
	  (agenda "" 
		  ((org-agenda-overriding-header "Today's Work")
		   (org-agenda-skip-function '(eg/org-agenda-skip-tags '("morning" "routine")))))
	  (tags-todo "routine" 
		  ((org-agenda-overriding-header "Routine Maintenance")
		   (org-agenda-todo-ignore-with-date nil)
		   (org-agenda-todo-ignore-scheduled 'future)
		   (org-agenda-todo-ignore-deadlines 'future)
		   (org-agenda-hide-tags-regexp "routine"))) ))
	))

(defun eg/org-agenda-skip-tags (tags &optional others)
  "Skip all entries that have one or more of specified tags.

If OTHERS is true, skip all entries that do NOT have one of the specified tags."
  (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
        (current-headline (or (and (org-at-heading-p)
                                   (point))
                              (save-excursion (org-back-to-heading)))))
    (if others
        (if (not (intersection tags (org-get-tags-at current-headline) :test 'string=))
            next-headline
          nil)
      (if (intersection tags (org-get-tags-at current-headline) :test 'string=)
          next-headline
        nil))))

(provide 'my-modes)
