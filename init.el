(add-to-list 'load-path "~/.emacs.d")

(when (require 'redo nil 'noerror)
    (global-set-key (kbd "C-S-z") 'redo))

(global-set-key (kbd "C-z") 'undo)

(if (fboundp 'pc-selection-mode)
        (pc-selection-mode)
      (require 'pc-select))

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'python-mode-hook 'flymake-mode)

(require 'flymake-cursor)

(when (load "flymake" t)
   (defun flymake-pylint-init ()
     (list "~/bin/lintrunner.sh"
           (list buffer-file-name)))
   (add-to-list 'flymake-allowed-file-name-masks
                '("^[^\*]+\\.py$" flymake-pylint-init)))

(defun py-to-start-of-class()
  (interactive)
  (py-beginning-of-def-or-class 'class)
)

(defun py-to-end-of-class()
  (interactive)
  (py-end-of-def-or-class 'class)
)

(add-hook 'python-mode-hook
               '(lambda ()
  (local-set-key [(s menu)] 'rope-code-assist)
  (local-set-key [(s up)] 'python-move-to-start-of-class)
  (local-set-key [(s down)] 'python-move-to-end-of-class)
  (local-set-key [(meta down)] 'py-end-of-def-or-class)
  (local-set-key [(meta up)] 'py-beginning-of-def-or-class)
  (local-set-key (kbd "C-c C-a") 'py-to-start-of-class)
  (local-set-key (kbd "C-c C-e") 'py-to-end-of-class)
  (local-set-key (kbd "s-q") 'py-shift-region-left)
  (local-set-key (kbd "s-w") 'py-shift-region-right)
  )
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
