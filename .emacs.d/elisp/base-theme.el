;; Load theme

(use-package solaire-mode
  :ensure t
  :config
  (solaire-global-mode +1))

(load-theme 'modus-vivendi t)

(add-to-list 'default-frame-alist
             '(font . "Source Code Pro 14"))

;; Configure current line highlighting style (works best with Emacs 28 or newer)
;; (setq vscode-dark-plus-render-line-highlight 'line)

(provide 'base-theme)
