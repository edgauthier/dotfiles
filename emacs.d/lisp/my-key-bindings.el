;; C-, bindings
(define-prefix-command 'my-prefix-map)
(global-set-key (kbd "C-,") 'my-prefix-map)
(define-key my-prefix-map (kbd "b") 'my-theme-cycle)
(define-key my-prefix-map (kbd "s") 'switch-to-scratch-and-back)

;; C-c bindings
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(provide 'my-key-bindings)
