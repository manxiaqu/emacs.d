;;; package --- Sumarry
;; Personal config for emacs of manxiaqu.

;;; Commentary:

;;; Code:

(message "Start load personal config of manxiaqu.")

;; Make windows maximized when loading files.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Set default font.
(set-face-attribute 'default nil :height 160)

;; Config for chinese input method.
(require-package 'pyim)
(require-package 'pyim-basedict)
(setq default-input-method "pyim")
(global-set-key (kbd "C-\\") 'toggle-input-method)
(setq pyim-default-scheme 'quanpin)

;; Config for gist package.
(require-package 'gist)

;; Config for golang.
;; To enable go-mode and related features, you should install packages
;; including go-mode, go-autocomplete and backends tools to make coding
;; golang more effective, such as gofmt, golint and so on.
(require-package 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-to-list 'load-path "~/.emacs.d/golang")
;; Use require here instead of require-package. The go-autocomplete is
;; provided by go-autocomplete.el under ~/.emacs.d/golang/ downloaded
;; manually.
(require-package 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
;; Reset key for chosing text of auto-complete.
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
;; Fmt go files with gofmt automatically when save files.
(add-hook 'before-save-hook 'gofmt-before-save)
;; Config for go-eldoc which shows type of variables.
(require-package 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; Disable backup files automatically.
(setq make-backup-files nil)

;; Config for neotree to view directory as a tree.
(require-package 'neotree)
(global-set-key (kbd "<f8>") 'neotree-toggle)

;; Set f2 to open config file(.emacs) quickly.
(defun openConfig ()
  "Keyboard to open personal config files."
  (interactive)
  (find-file "~/.emacs.d/lisp/init-local.el"))
(global-set-key (kbd "<f2>") 'openConfig)


(provide 'init-local)
;;; init-local.el ends here
