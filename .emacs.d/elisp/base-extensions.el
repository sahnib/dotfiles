(use-package flycheck
  :ensure t)

;; company for autocompletion
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package counsel
  :ensure t)

;; Enable vertico
(use-package vertico
  :ensure t)

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package magit
  :config

  (setq magit-completing-read-function 'ivy-completing-read)

  :bind
  ;; Magic
  ("C-x g s" . magit-status)
  ("C-x g x" . magit-checkout)
  ("C-x g c" . magit-commit)
  ("C-x g p" . magit-push)
  ("C-x g u" . magit-pull)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive))

(use-package magit-popup
  :ensure t)

(use-package which-key
  :ensure
  :config
  (which-key-mode))

(use-package yaml-mode
  :ensure t)

;; map suspend frame to C-z C-z to prevent emacs freezing
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "C-z C-z") 'my-suspend-frame)

(defun my-suspend-frame ()
  "In a GUI environment, do nothing; otherwise `suspend-frame'."
  (interactive)
  (if (display-graphic-p)
      (message "suspend-frame disabled for graphical displays.")
    (suspend-frame)))

(setq-default ediff-forward-word-function 'forward-char)

(use-package all-the-icons
  :ensure t)

(use-package csv-mode
  :ensure t)

(setq smerge-command-prefix "\C-cv")

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(use-package darkroom
  :ensure t)

(provide 'base-extensions)
