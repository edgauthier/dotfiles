(define-prefix-command 'my-prefix-map)
(global-set-key (kbd "C-,") 'my-prefix-map)
(define-key my-prefix-map (kbd "b") 'toggle-my-current-theme)

(provide 'my-key-bindings)
