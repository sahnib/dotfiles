(use-package pyvenv
  :ensure t)

(pyvenv-activate "~/.python_packages")

(setq lsp-python-executable-cmd "python3")
(add-hook 'python-mode-hook #'lsp)

(setq-default lsp-pyls-configuration-sources ["flake8"])

(provide 'init-python)
