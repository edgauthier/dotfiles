;; C-, bindings for a minor mode
(define-prefix-command 'my-prefix-map)
(define-key my-prefix-map (kbd "b") 'my-theme-cycle)
(define-key my-prefix-map (kbd "s") 'switch-to-scratch-and-back)

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(define-key my-keys-minor-mode-map (kbd "C-,") 'my-prefix-map)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(provide 'my-key-bindings)
