;;; this is my config for ecb - emacs code browser

;;; activate ecb
(require 'ecb)
;; (require 'ecb-autoloads)
(setq stack-trace-on-error t)

;;; my favorite layout
(setq ecb-windows-width 0.12)
(setq ecb-layout-name "leftright2"
	  ecb-layout-window-sizes
	  '(("leftright2"
		 (ecb-directories-buffer-name 0.12 . 0.6428571428571429)
		 (ecb-sources-buffer-name 0.12 . 0.3392857142857143)
		 (ecb-methods-buffer-name 0.12 . 0.6428571428571429)
		 (ecb-history-buffer-name 0.12 . 0.3392857142857143))))

;;; compilation window
(setq ecb-compile-window-height 12)
(setq ecb-enlarged-compilation-window-max-height 0.5)
(setq ecb-compilation-buffer-names
	  '(("\\*[cC]ompilation.*\\*" . t)
	   ("*Backtrace*")
	   ("*Compile-log*")
	   ("*Messages*")))
(setq ecb-compile-window-temporally-enlarge 'after-selection)

;;; show sources in directories buffer
(setq ecb-show-sources-in-directories-buffer 'always)

;;; replacement for built-in ecb-deactive, ecb-hide-ecb-windows and
;;; ecb-show-ecb-windows functions
;;; since they hide/deactive ecb but not restore the old windows for me
(defun tmtxt/ecb-deactivate ()
  "deactive ecb and then split emacs into 2 windows that contain 2 most recent buffers"
  (interactive)
  (ecb-deactivate)
  (split-window-right)
  (switch-to-next-buffer)
  (other-window 1))
(defun tmtxt/ecb-hide-ecb-windows ()
  "hide ecb and then split emacs into 2 windows that contain 2 most recent buffers"
  (interactive)
  (ecb-hide-ecb-windows)
  (split-window-right)
  (switch-to-next-buffer)
  (other-window 1))
(defun tmtxt/ecb-show-ecb-windows ()
  "show ecb windows and then delete all other windows except the current one"
  (interactive)
  (ecb-show-ecb-windows)
  (delete-other-windows))

;;; source path for ecb
;;; NOTE: only add those sources that are not system dependent (the same on many
;;; system, computer, OS) here. Ex: the .emacs.d and .conkerorrc dir always stay
;;; in the home directory.
;;; for those which change frequently, do not add here, use M-x customize-option
;;; and edit the ecb-source-path variable
;;; sometimes this not works, use M-x customize-group and edit the
;;; ecb-source-path manually or another method is just delete the custom.el file
;;; in .emacs.d folder
(add-to-list 'ecb-source-path '("~/.emacs.d/" ".emacs.d"))
(add-to-list 'ecb-source-path '("~/.conkerorrc" ".conkerorrc"))
(add-to-list 'ecb-source-path '("~/dotfiles" "dotfiles"))
(add-to-list 'ecb-source-path '("~/javascript/vntxt_pedigree/" "vntxt_pedigree"))

;;; finally provide the library
(provide 'tmtxt-ecb)
