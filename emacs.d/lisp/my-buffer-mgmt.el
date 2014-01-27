(defun switch-to-scratch-and-back ()
    "Toggle between *scratch* buffer and the current buffer.
     If the *scratch* buffer does not exist, create it."
    (interactive)
    (let ((scratch-buffer-name (get-buffer-create "*scratch*")))
        (if (equal (current-buffer) scratch-buffer-name)
            (switch-to-buffer (other-buffer))
            (switch-to-buffer scratch-buffer-name))))

(provide 'my-buffer-mgmt)
