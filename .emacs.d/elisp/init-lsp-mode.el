(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred))

;; (setq debug-on-error t)

;; configure with ivy
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-sideline-ignore-duplicate t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(setq read-process-output-max (* 1024 1024)) ;; 1mb

(setq lsp-idle-delay 0.500)

(setq lsp-log-io nil) ; if set to true can cause a performance hit

;; Company mode is a standard completion package that works well with lsp-mode.
(setq company-lsp-cache-candidates t)

;; make sure we have lsp-imenu everywhere we have LSP
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)

(use-package dap-mode
  :ensure t)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(provide 'init-lsp-mode)
