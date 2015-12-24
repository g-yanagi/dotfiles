;; -*- mode: emacs-lisp; coding: utf-8; indent-tabs-mode: nil -*-

;; path 追加用
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-loadpath)
            (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path
 "lisp"
 "lisp/skk"
 )

(set-keyboard-coding-system 'utf-8)

;; keymap
(global-set-key "\C-h" 'delete-backward-char)

;; indent
(setq-default tab-width 2 indent-tabs-mode nil)

;; ビープ音を抑制
(setq ring-bell-function '(lambda ()))

;; tramp
(setq tramp-sytax 'url)
(require 'tramp)
(setq tramp-default-method "ssh")

;; フォント
(let ((ws window-system))
  (cond ((eq ws 'ns)
         (set-face-attribute 'default nil
                             :family "Ricty"
                             :height 140)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty")))))

;; backup file
(setq make-backup-files nil)
(setq auto-save-default nil)

;; menu bar とか
(custom-set-variables
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

;; marmalade
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; install する package list
(defvar my/packages
  '(auto-complete
    clojure-mode
    findr
    inflections
    jump
    multiple-cursors
    popup
    smartrep
    web-mode
    color-theme-solarized
    htmlize
    )
  "A list of packages to install from MELPA at launch.")

;; 起動時に存在しない時には自動に install
(dolist (package my/packages)
  (when (or (not (package-installed-p package)))
    (package-install package)))

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; memo-pop
;; カラーテーマ
(load-theme 'solarized-dark t)

(require 'cl)
(require 'memo-pop)
(memo-pop-set-window-height 60)
(memo-pop-set-key-and-file [f2] "~/Dropbox/memo.txt")
(memo-pop-set-key-and-file [f3] "~/Dropbox/mail_draft.txt")

(require 'skk-setup)
;; C-\ でも SKK に切り替えられるように設定
(setq default-input-method "japanese-skk")
;; 送り仮名が厳密に正しい候補を優先して表示
(setq skk-henkan-strict-okuri-precedence t)
;;漢字登録時、送り仮名が厳密に正しいかをチェック
(setq skk-check-okurigana-on-touroku t)

(require 'org-install)
;; org-modeのルートディレクトリ
(setq org-directory "~/Dropbox/org/")
;; org-modeのデフォルトの書き込み先
(setq org-default-notes-file (concat org-directory "notes.org"))
;; メモとtodo
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Task" entry (file+headline "~/Dropbox/org/tasks.org" "Tasks")
         "* TODO %T")
        ("m" "Memo" entry (file+headline "~/Dropbox/org/memos.org" "Memos")
         "* %T")
        ))
