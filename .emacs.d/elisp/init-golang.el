(use-package go-mode
  :mode "\\(\\.go\\|go\\.mod\\|go\\.sum\\)\\'"
  :hook ((go-mode . lsp-deferred)
         (before-save . lsp-format-buffer)
         (before-save . lsp-organize-imports))
  :bind (:map go-mode-map
              ("C-x t f" . go-test-current-file)
              ("C-x t t" . go-test-current-test))
  :ensure t)

(defun lsp-cannonical-file-name  (file-name)
  "Return the cannonical FILE-NAME."
  (directory-file-name (expand-file-name file-name)))

;; Go Settings - Move it to its own module if managing multiple languages becomes messy here
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(lsp-register-custom-settings
 '(("gopls.completeUnimported" t t)
   ("gopls.staticcheck" t t)))

(provide 'init-golang)
