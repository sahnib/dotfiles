(use-package lsp-java
  :ensure t)

(require 'lsp)
(require 'lsp-java)

(add-hook 'java-mode-hook #'lsp)

(use-package dap-java :ensure nil)

(setq lsp-java-vmargs '("-noverify" "-Xmx1G" "-XX:+UseG1GC" "-XX:+UseStringDeduplication" "-javaagent:/home/ANT.AMAZON.COM/sahnib/workspace/lombok.jar" "-Xbootclasspath/a:/home/ANT.AMAZON.COM/sahnib/workspace/lombok.jar"))

(provide 'init-java)
