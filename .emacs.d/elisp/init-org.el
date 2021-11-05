(use-package org-bullets)

(setq org-directory "~/.org")

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-agenda-files (list "~/.org/inbox.org"
                             "~/.org/saml.org"))

(setq org-default-notes-file (concat org-directory "/inbox.org"))

(provide 'init-org)
