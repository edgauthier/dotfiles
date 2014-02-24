(defun eg/regexp-or-list-of-strings (items)
  (concat "\\(" (mapconcat 'identity items "\\|") "\\)"))

(provide 'my-functions)
