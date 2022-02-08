(use-package lsp-java
  :ensure t)

(require 'lsp)
(require 'lsp-java)

(add-hook 'java-mode-hook #'lsp)

(use-package dap-java :ensure nil)

(provide 'init-java)
