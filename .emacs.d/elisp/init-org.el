(use-package org-bullets
  :ensure t)

(setq org-directory "~/workspace/org")

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-default-notes-file (concat org-directory "/inbox.org"))

(provide 'init-org)
