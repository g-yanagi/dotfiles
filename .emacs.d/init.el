;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;;;;
;; Packages
;;;;


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)

;; カラーテーマ
(load-theme 'dracula t)


;; 透過
(add-to-list 'default-frame-alist '(alpha . (0.80 0.80)))

;; C-h でバックスペース
(global-set-key "\C-h" 'delete-backward-char)

;; window 幅で折り返す
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;; ビープ音を抑制
(setq ring-bell-function 'ignore)

;; 文字コード
(set-keyboard-coding-system 'utf-8)

;; aspell
(setq-default ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;; フォント
(let ((ws window-system))
  (cond ((eq ws 'mac)
         (set-face-attribute 'default nil
                             :family "Ricty"
                             :height 160)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode web-mode use-package tagedit smex smartrep smartparens rainbow-delimiters projectile prodigy popwin pallet nyan-mode markdown-mode magit jump ido-ubiquitous idle-highlight-mode htmlize flycheck-cask expand-region exec-path-from-shell drag-stuff dracula-theme clojure-mode-extra-font-locking clj-refactor auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
