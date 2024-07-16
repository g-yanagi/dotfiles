;;; Add to ~/.doom.d/config.el
(setq doom-font (font-spec :family "UDEV Gothic NF" :size 20)
      doom-variable-pitch-font (font-spec :family "UDEV Gothic NF") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "UDEV Gothic NF" :size 20)
      doom-big-font (font-spec :family "UDEV Gothic NF" :size 20))

;(after! web-mode
;  (set-company-backend! 'web-mode '(company-robe company-files :with company-yasnippet))
;  (set-company-backend! 'web-mode '(company-tabnine company-robe company-files :with company-yasnippet))
;   )

(use-package! company-tabnine
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tabnine))

; (use-package company-tabnine :ensure t)

; (require 'company-tabnine)

; (add-to-list 'company-backends #'company-tabnine)

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

; (setq +lsp-company-backends '(company-tabnine))

; (use-package! company-tabnine
;  :after company
;  :config
;  (cl-pushnew 'company-tabnine (default-value 'company-backends)))
;
(defun shou/tabnine-off ()
  "turn off TabNine for this buffer"
  (interactive)
  (setq-local company-backends (delete 'company-tabnine company-backends)))

(defun shou/tabnine-on ()
  "turn on TabNine for this buffer"
  (interactive)
  (setq-local company-backends (add-to-list 'company-backends 'company-tabnine)))

(defun web-mode-indent (num)
  (interactive "nIndent: ")
  (setq web-mode-markup-indent-offset num)
  (setq web-mode-css-indent-offset num)
  (setq web-mode-code-indent-offset num)
  )

(setq auto-save-default nil)

;; 日付の挿入
(defun insert-current-date ()
  "Insert the current date in YYYY-MM-DD format."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(map! :leader
      :desc "Insert current date"
      "i d" #'insert-current-date)


(setq company-idle-delay 10)

;;(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
;;(add-to-list 'default-frame-alist '(alpha . (85 . 50)))
