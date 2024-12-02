(use-package org-bullets
  :ensure t)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq org=indent-mode 1)

(setq org-directory "~/workspace/org")

(setq org-default-notes-file (concat org-directory "/inbox.org"))

(provide 'init-org)
