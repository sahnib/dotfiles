(use-package dockerfile-mode
  :ensure t) 

(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(provide 'init-docker)
