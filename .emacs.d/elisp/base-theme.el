(use-package moe-theme
  :ensure t)

;; Load theme
(use-package flucui-themes
  :init
  (setq frame-background-mode 'dark)

  :config
  (load-theme 'flucui-dark t)
  (setq jmi/selected-theme 'flucui-dark))

;; Functions to toggle between light and dark
(defun sahnib/apply-theme-dark ()
  (interactive)
  (set-frame-parameter nil 'background-mode 'dark)
  (enable-theme jmi/selected-theme))

(defun sahnib/apply-theme-light ()
  (interactive)
  (set-frame-parameter nil 'background-mode 'light)
  (enable-theme jmi/selected-theme))

(provide 'base-theme)
