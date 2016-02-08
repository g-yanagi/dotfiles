;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-
;;;;
;; Packages
;;;;
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; install する package list
(defvar my-packages
  '(auto-complete
    findr
    inflections
    jump
    multiple-cursors
    popup
    smartrep
    web-mode
    color-theme-solarized
    htmlize
    markdown-mode
    org
    paredit
    clojure-mode    
    clojure-mode-extra-font-locking
    cider
    ido-ubiquitous
    smex
    projectile
    rainbow-delimiters
    tagedit
;    magit
    )
  "A list of packages to install from MELPA at launch.")

;; 起動時に存在しない時には自動に install
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/auto-install")
(add-to-list 'load-path "~/dotfiles/.emacs.d/customizations")

(require 'ido)
(ido-mode t)

;; フォント
(let ((ws window-system))
  (cond ((eq ws 'ns)
         (set-face-attribute 'default nil
                             :family "Ricty"
                             :height 140)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty")))))

;; indent
(setq-default tab-width 2 indent-tabs-mode nil)

;; backup file
(custom-set-variables
 '(make-backup-files nil)
 '(auto-save-default nil))

;; menu bar とか
(custom-set-variables
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

;; カラーテーマ
(load-theme 'solarized-dark t)

;; markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; スクロールを一行ずつにする
(defvar scroll-step 1)
(put 'set-goal-column 'disabled nil)

;; C-h でバックスペース
(global-set-key "\C-h" 'delete-backward-char)

;; window 幅で折り返す
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)

;; ビープ音を抑制
(defvar ring-bell-function '(lambda ()))

;; 文字コード
(set-keyboard-coding-system 'utf-8)

;; org mode
(require 'org-install)
(require 'ox-md nil t)
;; org-modeのルートディレクトリ
(defvar org-directory "~/Dropbox/org/")
;; org-modeのデフォルトの書き込み先
(defvar org-default-notes-file (concat org-directory "notes.org"))
;; メモとtodo
(define-key global-map "\C-cc" 'org-capture)
(defvar org-capture-templates
      '(
        ("t" "Task" entry (file+headline "~/Dropbox/org/tasks.org" "Tasks")
         "* TODO %T")
        ("f" "Fodder" entry (file+headline "~/Dropbox/org/fodders.org" "Fodders")
         "* %T")
        ("m" "Memo" entry (file+headline "~/Dropbox/org/memos.org" "Memos")
         "* %T")
        )
      )

;; auto-install

(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(custom-set-variables
 '(ediff-window-setup-funciton 'ediff-setup-windows-plain))

;; junk file 
(require 'open-junk-file)
(global-set-key (kbd "C-c C-z") 'open-junk-file)

(require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

(require 'paredit)
(define-key paredit-mode-map "\C-j" 'eval-print-last-sexp)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hock 'enable-paredit-mode)
(add-hook 'ielm-mode-hock 'enable-paredit-mode)

(require 'auto-async-byte-compile)
(custom-set-variables
 '(auto-async-byte-compile-exclude-files-regexp "/junk/")
 '(auto-async-byte-compile-exclude-files-regexp "init.el")
 '(eldoc-idle-delay 0.2)
 '(eldoc-minor-mode-string ""))
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hock 'turn-on-eldoc-mode)
(show-paren-mode 1)
(global-set-key (kbd "\C-m") 'newline-and-indent)
(find-function-setup-keys)


;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")













