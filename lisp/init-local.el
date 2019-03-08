;;; package --- Sumarry
;; Personal config for emacs of manxiaqu.

;;; Commentary:

;;; Code:

(message "Start load personal config of manxiaqu.")

;; Make windows maximized when loading files.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Set default font.
(set-face-attribute 'default nil :height 160)

;; Config for golang.
;; To enable go-mode and related features, you should install packages
;; including go-mode, go-autocomplete and backends tools to make coding
;; golang more effective, such as gofmt, golint and so on.
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-to-list 'load-path "~/.emacs.d/golang")
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
;; Reset key for chosing text of auto-complete.
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
;; Fmt go files with gofmt automatically when save files.
(add-hook 'before-save-hook 'gofmt-before-save)

;; Set f2 to open config file(.emacs) quickly.
(defun openConfig ()
  "Keyboard to open personal config files."
  (interactive)
  (find-file "~/.emacs.d/lisp/init-local.el"))
(global-set-key (kbd "<f2>") 'openConfig)


(provide 'init-local)
;;; init-local.el ends here
