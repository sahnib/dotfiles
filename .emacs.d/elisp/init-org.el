(use-package org-bullets
  :ensure t)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq org=indent-mode 1)

(setq org-directory "~/workspace/org")

(setq org-default-notes-file (concat org-directory "/inbox.org"))

(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "Source Sans Pro")))))
(add-hook 'org-mode-hook 'variable-pitch-mode)

(add-hook 'org-mode-hook 'visual-line-mode)

(setq org-agenda-files   (list "~/workspace/org/")
      org-log-done 'time)

(provide 'init-org)
