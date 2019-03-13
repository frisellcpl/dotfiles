;;; package --- Main init file

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)

(require 'lang-python)
(require 'lang-javascript)
(require 'lang-web)
(require 'lang-rust)
(require 'lang-dotnet)

(require 'better-defaults)

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'solarized-light t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

(eval-after-load
 'company
 '(add-to-list 'company-backends 'company-omnisharp))

(add-hook 'csharp-mode-hook #'company-mode)
