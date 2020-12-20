(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred))

;; configure with ivy
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-ignore-duplicate t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; Company mode is a standard completion package that works well with lsp-mode.
(setq company-lsp-cache-candidates t)

;; make sure we have lsp-imenu everywhere we have LSP
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(provide 'init-lsp-mode)
