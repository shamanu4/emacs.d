(add-to-list 'load-path "~/.emacs.d/plugins/ecb-2.40")

(require 'ecb)
(require 'ecb-autoloads)


(setq ecb-create-layout-file "~/.emacs.d/.ecb-user-layout.el") ; where my layout are saved
(setq ecb-windows-width 25)

;; create a simple special layout "falkor1"
;; +------+-------+--------------------------------------+
;; |              |                                      |
;; |              |                                      |
;; | Directories  |                                      |
;; |              |          Edit                        |
;; |              |                                      |
;; +------+-------+                                      |
;; |   History    |                                      |
;; |              |                                      |
;; +-----------------------------------------------------+
(ecb-layout-define "falkor1" left nil
                   ;; The frame is already splitted side-by-side and point stays in the
                   ;; left window (= the ECB-tree-window-column)

                   ;; Here is the creation code for the new layout
                   ;; 1. Defining the current window/buffer as ECB-methods buffer
                   (ecb-set-directories-buffer)
                   ;; 2. Splitting the ECB-tree-windows-column in two windows
                   (ecb-split-ver 0.75 t)
                   ;; 3. Go to the second window
                   (other-window 1)
                   ;; 4. Defining the current window/buffer as ECB-history buffer
                   (ecb-set-history-buffer)
                   ;; 5. Make the ECB-edit-window current (see Postcondition above)
                   (select-window (next-window)))

;; create another simple special layout "falkor2"
;; +------+-------+--------------------------------------+
;; |              |                                      |
;; | Directories  |                                      |
;; |              |                                      |
;; +------+-------+                                      |
;; |   History    |              Edit                    |
;; +------+-------+                                      |
;; |   Methods    |                                      |
;; |              |                                      |
;; +-----------------------------------------------------+
(ecb-layout-define "falkor2" left nil
                   ;; The frame is already splitted side-by-side and point stays in the
                   ;; left window (= the ECB-tree-window-column)

                   ;; Here is the creation code for the new layout
                   ;; 1. Defining the current window/buffer as ECB-methods buffer
                   (ecb-set-directories-buffer)
                   ;; 2. Splitting the ECB-tree-windows-column in two windows
                   (ecb-split-ver 0.5 t)
                   ;; 3. Go to the second window
                   (other-window 1)
                   ;; 4. Defining the current window/buffer as ECB-history buffer
                   (ecb-set-history-buffer)
                   ;; 5. Splitting the ECB-tree-windows-column in two windows
                   (ecb-split-ver 0.25 t)
                   ;; 6. Go to the third window
                   (other-window 1)
                   ;; 7. Defining the current window/buffer as ECB-y buffer
                   (ecb-set-methods-buffer)
                   ;; 8. Make the ECB-edit-window current (see Postcondition above)
                   (select-window (next-window)))

;;(setq ecb-show-sources-in-directories-buffer "falkor1")
(setq ecb-show-sources-in-directories-buffer "falkor2")

;; see http://ecb.sourceforge.net/docs/Changing-the-ECB-layout.html for default
;; layout alternatives.
;; My personnal ECB layout (falkor), is as follows:
;; +------+-------+--------------------------------------+
;; |      |       |                                      |
;; | Dir  | Src   |                                      |
;; |      |       |                                      |
;; |      |       |                                      |
;; +------+-------+                                      |
;; |   History    |                 Edit                 |
;; |              |                                      |
;; +--------------+                                      |
;; |              |                                      |
;; |  Methods     |                                      |
;; |              |                                      |
;; |              |                                      |
;; +-----------------------------------------------------+
;; You can easily create your own layout using M-x ecv-create-new-layout
;; see ~/emacs.d/custom.el for the configuration of my own layout

(setq ecb-history-sort-method nil)  ; No sorting, means the most recently used
                                        ; buffers are on the top of the history
                                        ; and the seldom used buffers at the bottom
(setq ecb-vc-enable-support t)          ; show versionning status of the files
                                        ; in the sources/hstory (SVN etc.)
;; autostart ECB on emacs startup (put to nil to desactivate)
(setq ecb-auto-activate t)

;; --- Annoyances
;; use the primary button to navigate in the source tree -- middle button otherwise (!?!)
(setq ecb-tip-of-the-day nil)           ; disable tips of the day
(setq stack-trace-on-error t)

(provide 'init-ecb)
