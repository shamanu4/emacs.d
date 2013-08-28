(add-to-list 'load-path "~/.emacs.d")

(setq default-input-method 'russian-computer)
(setq frame-title-format `("emacs@" ,(system-name) ": %f"))

;; тема
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'monokai t)

;; плюшки
(setq-default indent-tabs-mode nil)      ;; запрещаем выравнивание TAB-ами
(setq-default tab-width 4)               ;; TAB равен 4 пробелам
(setq-default line-number-mode t)        ;; показываем номер строки
(setq-default column-number-mode t)      ;; показываем номер столбца

(tool-bar-mode -1)                       ;; выключаем тулбар
(mouse-wheel-mode 1)                     ;; разрешаем колесо мыши
(hl-line-mode t)                         ;; подсвечиваем текущую строку
(desktop-save-mode t)                    ;; сохраняем буферы между запусками
(scroll-bar-mode (quote right))          ;; скроллбар пусть будет справа

(global-set-key "\C-z" 'undo)            ;; отмена по C-z

(add-hook 'before-save-hook 'delete-trailing-whitespace)  ;; при сохранении удаляем все висящие пробелы

;;;
;; поддержка python
;;;
(add-hook 'python-mode-hook 'flymake-mode)

(require 'flymake-cursor)

(when (load "flymake" t)
    (defun flymake-pylint-init ()
        (list "~/.emacs.d/bin/lintrunner.sh"
            (list buffer-file-name)))
    (add-to-list 'flymake-allowed-file-name-masks
                '("^[^\*]+\\.py$" flymake-pylint-init)))

;;
;; при загрузке файла с CRLF преобразовываем его в LF
;; кому это не нравится смогут переключить буфер по C-x Enter f
;;
(defun dos-file-endings-p ()
     (string-match "dos" (symbol-name buffer-file-coding-system)))
(defun find-file-check-line-endings ()
     (when (dos-file-endings-p)
         (set-buffer-file-coding-system 'undecided-unix)
         (set-buffer-modified-p nil)))
(add-hook 'find-file-hook 'find-file-check-line-endings)
