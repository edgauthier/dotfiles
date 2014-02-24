;; org
(require 'org)
(require 'org-clock)
(require 'org-checklist)
(require 'cl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode global key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C-c bindings
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(define-key global-map "\C-cc" 'org-capture)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other customization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

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
	 "* TODO %?\n:LOGBOOK:\n- Task captured on %u \\\\\n%a\n:END:\n")
;	("w" "org-protocol" entry (file+headline (concat org-directory "/inbox.org") "Inbox") 
;	 "* TODO %i\n%u\n%a\n" :immediate-finish t)
	))


;; Todo states
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(setq org-treat-S-cursor-todo-selection-as-state-change nil) ; Allow Shift Cursor movements to fix up TODO states without logging
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
(setq org-log-done 'time)

;; Tags
(setq org-fast-tag-selection-single-key 't)
(setq org-tag-alist '(("NOTES" . ?n)
                      ("MANAGEMENT" . ?m)
                      ("HIDDEN" . ?h)
                      ("SOMEDAY" . ?s)))

;; Completion
(setq org-completion-use-ido t)
(set org-indirect-buffer-display 'current-window)

;; Org structure
(setq org-log-into-drawer 'LOGBOOK)
(setq org-startup-indented t)
(setq org-catch-invisible-edits 'smart)
(setq org-startup-folded 'content)
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

;; Use IDs for links
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)

;; List bullets
(setq org-list-demote-modify-bullet (quote (("+" . "-")
                                            ("*" . "-")
                                            ("-" . "+")
                                            ("1." . "-")
                                            ("1)" . "-")
                                            ("A)" . "-")
                                            ("B)" . "-")
                                            ("a)" . "-")
                                            ("b)" . "-")
                                            ("A." . "-")
                                            ("B." . "-")
                                            ("a." . "-")
                                            ("b." . "-"))))

;; Other customization
(setq org-return-follows-link t) ; really - who wants to use the mouse
(setq org-agenda-ignore-drawer-properties '(effort appt category)) ; not using these - speed up agendas

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;; Agenda customization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

(setq org-agenda-span 'day) ; Only display a single day by default
(setq org-agenda-dim-blocked-tasks t) ; Show me blocked tasks - better big picture view
(setq org-agenda-skip-scheduled-if-done t) ; Don't show Done tasks
(setq org-agenda-skip-deadline-if-done t) ; Don't show Done tasks
(setq org-agenda-tags-todo-honor-ignore-options t) 
(setq org-agenda-window-setup 'current-window)
(setq org-agenda-start-on-weekday nil)

;; Highlight selected line in agenda
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1))) 

(add-hook 'org-finalize-agenda-hook
	  (lambda () 
        (remove-text-properties (point-min) (point-max) '(mouse-face t)) ; Disable mouse highlighting in agenda
        (eg/hide-hidden-subtrees-in-all-org-files))) ; Hide hidden subtrees that may have been opened while generating the agenda

;; Custom Agenda Views
(setq org-agenda-custom-commands
      '(
	("A" "Default Agenda View" agenda "")
	(" " "Custom Daily Agenda" 
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
		   (org-agenda-hide-tags-regexp "routine"))) )
	 ((org-agenda-compact-blocks t)) )
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Utility functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

(defun eg/org-agenda-redo-in-other-window ()
  "Call org-agenda-redo function even in the non-agenda buffer."
  (interactive)
  (let ((agenda-window (get-buffer-window org-agenda-buffer-name t)))
    (when agenda-window
      (with-selected-window agenda-window (org-agenda-redo)))))
;(run-at-time nil 300 'eg/org-agenda-redo-in-other-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom visibility handline based on certain tags - keep some headings collapsed based on tags
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Tags that flag a subtree to be hidden during cycling
(setq eg/org-hidden-tags '("HIDDEN" "NOTES" "SOMEDAY"))

;; Hide hidden subtrees when loading an org-mode file
(add-hook 'org-mode-hook 
          (lambda ()
            (eg/org-hide-hidden-subtrees (point-min) (point-max))))

;; Hook into org-cycle to hide subtrees based on our hidden tags
(add-hook 'org-cycle-hook 'eg/org-cycle-hide-hidden-subtrees)

;; Kep mapping to toggle default hidden tag on sub tree
(add-hook 'org-mode-hook 
          (lambda ()
            (local-set-key "\C-c\C-xh" 'eg/org-toggle-hidden-tag)))

(defun eg/org-toggle-hidden-tag ()
  "Toggles the default (first) hidden tag for the current heading."
  (interactive)
  (let (set)
    (org-back-to-heading t)
    (setq set (org-toggle-tag (first eg/org-hidden-tags)))
    (when set (hide-subtree))))

(defun eg/hide-hidden-subtrees-in-all-org-files ()
  "Hides hidden subtrees in all org agenda files"
  (interactive)
  (dolist (f (org-agenda-files t))
    (eg/hide-hidden-subtrees-in-file f)))

(defun eg/hide-hidden-subtrees-in-file (f)
  "Hides the hidden subtrees in the buffer for file f"  
  (interactive)
  (set-buffer (org-get-agenda-file-buffer f))
  (eg/org-hide-hidden-subtrees (point-min) (point-max)))
        
;; Check for hidden tags after the tags are changed
;; Disabled right now - currently fires when any tag is added, not just a hidden tag
;(add-hook 'org-after-tags-change-hook 'org-after-tags-change-hide-hidden-subtrees)

;(defun eg/org-after-tags-change-hide-hidden-subtrees ()
;  "Hides the subtree if this heading contains one of the hidden tags"
;  (interactive)
;  (save-excursion
;    (let ((tags (org-get-local-tags)))
;      (when (intersection tags eg/org-hidden-tags :test 'string=)
;        (hide-subtree)))))

;; The following code for handling custom hidden tags is based on the code for handling the special
;; ARCHIVE tag

;; Hook into org-cycle to hide any hidden sub-trees after cycling visibility
(defun eg/org-cycle-hide-hidden-subtrees (state)
  "Re-hide all hidden subtrees after a visibility state change."
  (when (and (not (looking-at (concat ".*" (eg/org-hidden-tag-re))))
             (not (memq state '(overview folded))))
    (save-excursion
      (let* ((globalp (memq state '(contents all)))
             (beg (if globalp (point-min) (point)))
             (end (if globalp (point-max) (org-end-of-subtree t))))
        (eg/org-hide-hidden-subtrees beg end)
        (goto-char beg)))))

(defun eg/org-hide-hidden-subtrees (beg end)
  "Re-hide all hidden subtrees after a visibility state change."
  (save-excursion
    (let* ((re (eg/org-hidden-tag-re)))
      (goto-char beg)
      (while (re-search-forward re end t)
        (when (org-at-heading-p)
          (org-flag-subtree t)
          (org-end-of-subtree t))))))

(defun eg/org-hidden-tag-re ()
  "Gets the regex that matches a hidden tag."
  (concat ":\\(" (mapconcat 'identity eg/org-hidden-tags "\\|") "\\):"))

(provide 'my-modes)
