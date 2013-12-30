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
 "lisp/rhtml"
 )

(set-keyboard-coding-system 'utf-8)

;; keymap
(global-set-key "\C-h" 'delete-backward-char)

;; indent
(setq-default tab-width 2 indent-tabs-mode nil)
(defun n-indent ()
  (interactive)
  (setq tab-width 4)
  (setq indent-tabs-mode t))

(defun a-indent ()
  (interactive)
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq perl-indent-level 8))

(defun g-indent ()
  (interactive)
  (setq tab-width 2)
  (setq indent-tabs-mode nil))

;; 背景色とか
(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "yellow")
(add-to-list 'default-frame-alist '(alpha . (0.80 0.80)))
(setq-default line-spacing 0)

;; ビープ音を抑制
(setq ring-bell-function '(lambda ()))

;; tramp
(setq tramp-sytax 'url)
(require 'tramp)
(setq tramp-default-method "ssh")

;; windowサイズ最大化
(defun mac-toggle-max-window ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (set-frame-parameter nil 'fullscreen nil)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

;; フォント
(let ((ws window-system))
  (cond ((eq ws 'ns)
         (set-face-attribute 'default nil
                             :family "Ricty"
                             :height 140)
         (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty")))))

;; 行番号
(require 'linum)
(global-linum-mode t)
(setq linum-format "%5d")

;; タブ全角スペースの表示
(when (window-system)
  (defface my-face-r-1 '((t (:background "gray15"))) nil)
  (defface my-face-b-1 '((t (:background "gray"))) nil)
  (defface my-face-b-2 '((t (:background "gray26"))) nil)
  (defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
  (defvar my-face-r-1 'my-face-r-1)
  (defvar my-face-b-1 'my-face-b-1)
  (defvar my-face-b-2 'my-face-b-2)
  (defvar my-face-u-1 'my-face-u-1)
  (defadvice font-lock-mode (before my-font-lock-mode ())
    (font-lock-add-keywords
     major-mode
     '(("\t" 0 my-face-b-2 append)
       ("　" 0 my-face-b-1 append)
       ("[ \t]+$" 0 my-face-u-1 append)
       ("[\r]*\n" 0 my-face-r-1 append)
       )))
  (ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
  (ad-activate 'font-lock-mode))

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
    coffee-mode
    findr
    inf-ruby
    inflections
    jump
    multiple-cursors
    php-mode
    popup
    rinari
    ruby-compilation
    smartrep
    web-mode
    yaml-mode)
  "A list of packages to install from MELPA at launch.")

;; 起動時に存在しない時には自動に install
(dolist (package my/packages)
  (when (or (not (package-installed-p package)))
    (package-install package)))

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;;; rhtml mode
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda ()
            (rinari-launch)
            (abbrev-mode nil)
            ))

;; memo-pop
(require 'cl)
(require 'memo-pop)
(memo-pop-set-window-height 60)
(memo-pop-set-key-and-file [f2] "~/Dropbox/memo.txt")

;; multi-occur
(require 'multiple-cursors)
(require 'smartrep)
(declare-function smartrep-define-key "smartrep")
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)
(global-unset-key "\C-t")
(smartrep-define-key global-map "C-t"
  '(("C-t"      . 'mc/mark-next-like-this)
    ("n"        . 'mc/mark-next-like-this)
    ("p"        . 'mc/mark-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("u"        . 'mc/unmark-next-like-this)
    ("U"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)
    ("d"        . 'mc/mark-all-like-this-dwim)
    ("i"        . 'mc/insert-numbers)
    ("o"        . 'mc/sort-regions)
    ("O"        . 'mc/reverse-regions)))
