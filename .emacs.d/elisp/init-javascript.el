(use-package rjsx-mode
  :hook (((js2-mode rjsx-mode) . lsp-deferred))
  :mode ("\\.js\\'"
         "\\.jsx\\'"))

(use-package typescript-mode
  :hook (((typescript-mode) . lsp-deferred)))

(use-package add-node-modules-path
  :defer t
  :hook (((js2-mode typescript-mode rjsx-mode) . add-node-modules-path)))

(use-package prettier-js
  :ensure t)

(setq prettier-js-args '("--bracket-spacing" "false"
			 "--single-quote" "true"
			 "--trailing-comma" "es5"
			 "--arrow-parens" "avoid"))

(setq prettier-js-show-errors 'echo)

(setq js-indent-level 2)
(setq-default typescript-indent-level 2)

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)

(provide 'init-javascript)
