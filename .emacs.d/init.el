(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'base-extensions)

(require 'init-lsp-mode)
(require 'init-golang)
(require 'init-javascript)
(require 'init-python)
(require 'init-haskell)

(require 'init-org)

(require 'init-leetcode)
