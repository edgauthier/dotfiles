;; org
(require 'org)
(require 'org-clock)
;(require 'org-protocol)
(require 'cl)
;(require 'real-auto-save)

;(add-hook 'org-mode-hook 'turn-on-real-auto-save)

;; default directories
(setq org-directory "~/org")
(setq org-agenda-files (list (concat org-directory "/inbox.org")
			     (concat org-directory "/system.org")
			     (concat org-directory "/active/")))

;; Location for capture items
(setq org-default-notes-file (concat org-directory "/inbox.org"))

;; Capture templates
(setq org-capture-templates
      '(("t" "Task" entry (file+headline (concat org-directory "/inbox.org") "Inbox")
	 "* TODO %?\n%u\n%a\n")
;	("w" "org-protocol" entry (file+headline (concat org-directory "/inbox.org") "Inbox") 
;	 "* TODO %i\n%u\n%a\n" :immediate-finish t)
	))


;; Todo states
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)")))
(setq org-treat-S-cursor-todo-selection-as-state-change nil) ; Allow Shift Cursor movements to fix up TODO states without logging
(setq org-enforce-todo-dependencies t)
(setq org-log-done 'time)

;; Tags


;; Completion
(setq org-completion-use-ido t)
(set org-indirect-buffer-display 'current-window)

;; Org structure
(setq org-log-into-drawer 'LOGBOOK)
(setq org-startup-indented t)
(setq org-catch-invisible-edits 'smart)
(setq org-startup-folded t)
(setq org-agenda-inhibit-startup nil)

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
				 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes 'confirm)

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
(setq org-agenda-dim-blocked-tasks t) ; Show me blocked tasks - better big picture view
(setq org-agenda-skip-scheduled-if-done t) ; Don't show Done tasks
(setq org-agenda-tags-todo-honor-ignore-options t) 
(setq org-agenda-window-setup 'current-window)
(setq org-agenda-start-on-weekday nil)

;; Highlight selected line in agenda
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1))) 
;; Disable mouse highlighting in agenda
(add-hook 'org-finalize-agenda-hook
	  (lambda () (remove-text-properties (point-min) (point-max) '(mouse-face t))))

;; Custom Agenda Views
(setq org-agenda-custom-commands
      '(
	("A" "Default Agenda View" agenda "")
;	("a" "Custom Daily Agenda" 
;	 ((tags-todo "morning" 
;		  ((org-agenda-overriding-header "Morning Tasks")
;		   (org-agenda-todo-ignore-with-date nil)
;		   (org-agenda-todo-ignore-scheduled 'future)
;		   (org-agenda-todo-ignore-deadlines 'future)
;		   (org-agenda-hide-tags-regexp "morning")))
;	  (agenda "" 
;		  ((org-agenda-overriding-header "Today's Work")
;		   (org-agenda-skip-function '(eg/org-agenda-skip-tags '("morning" "routine")))))
;	  (tags-todo "routine" 
;		  ((org-agenda-overriding-header "Routine Maintenance")
;		   (org-agenda-todo-ignore-with-date nil)
;		   (org-agenda-todo-ignore-scheduled 'future)
;		   (org-agenda-todo-ignore-deadlines 'future)
;		   (org-agenda-hide-tags-regexp "routine"))) )
;	 ((org-agenda-compact-blocks t)) )
	("a" "Custom Daily Agenda" 
	 ((agenda "morning" 
		  ((org-agenda-overriding-header "Morning Tasks")
		   (org-agenda-skip-function '(eg/org-agenda-skip-tags '("morning") t))
		   (org-agenda-hide-tags-regexp "morning")))
	  (agenda "" 
		  ((org-agenda-overriding-header "Today's Work")
		   (org-agenda-skip-function '(eg/org-agenda-skip-tags '("morning" "routine")))))
	  (agenda "routine" 
		  ((org-agenda-overriding-header "Routine Maintenance")
		   (org-agenda-skip-function '(eg/org-agenda-skip-tags '("routine") t))
		   (org-agenda-hide-tags-regexp "routine"))) ))

	))

(defun eg/org-agenda-skip-tags (tags &optional others)
  "Skip all entries that have one or more of specified tags.

If OTHERS is true, skip all entries that do NOT have one of the specified tags."
  (save-restriction
    (widen)
    (show-branches)
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
	  nil)))))

(defun eg/org-remove-empty-propert-drawers ()
  "*Remove all empty property drawers in current file."
  (interactive)
  (unless (eq major-mode 'org-mode)
    (error "You need to turn on Org mode for this function."))
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward ":PROPERTIES:" nil t)
      (save-excursion
        (org-remove-empty-drawer-at "PROPERTIES" (match-beginning 0))))))

(provide 'my-modes)
