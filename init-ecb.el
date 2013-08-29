(add-to-list 'load-path "~/.emacs.d/plugins/ecb-2.40")

(require 'ecb)
(require 'ecb-autoloads)

(setq ecb-windows-width 15)
;(setq ecb-layout-name "layout-name")

(setq ecb-history-sort-method nil)  ; No sorting, means the most recently used
                                        ; buffers are on the top of the history
                                        ; and the seldom used buffers at the bottom
(setq ecb-vc-enable-support t)          ; show versionning status of the files
                                        ; in the sources/hstory (SVN etc.)
;; autostart ECB on emacs startup (put to nil to desactivate)
(setq ecb-auto-activate t)

(setq ecb-tip-of-the-day nil)           ; disable tips of the day

(provide 'init-ecb)
