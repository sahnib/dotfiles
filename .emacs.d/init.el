(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'base-theme)
(require 'base-extensions)

(require 'init-org)
(require 'init-lsp-mode)

(require 'init-golang)
(require 'init-cpp)
(require 'init-java)
;;(require 'init-python)
;;(require 'init-haskell)
(require 'init-docker)
(require 'init-rust)

(require 'init-leetcode)
