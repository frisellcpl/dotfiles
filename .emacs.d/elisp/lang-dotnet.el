;; csharp-mode, omnisharp

;; csharp-mode
;; https://github.com/josteink/csharp-mode
;; omnisharp
;; https://github.com/OmniSharp/omnisharp-emacs

(use-package csharp-mode)

(defun my-csharp-mode-hook ()
  ;; enable the stuff you want for C# here
  (electric-pair-mode 1)       ;; Emacs 24
  (electric-pair-local-mode 1);; Emacs 25
  (omnisharp-mode 1)
  )

(use-package omnisharp)

(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)
(add-hook 'csharp-mode-hook #'flycheck-mode)
(provide 'lang-dotnet)