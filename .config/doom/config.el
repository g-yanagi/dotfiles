;;; Add to ~/.doom.d/config.el
(setq doom-font (font-spec :family "Migu 1M" :size 22 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Migu 1M") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "Migu 1M" :size 22)
      doom-big-font (font-spec :family "Migu 1M" :size 22))

(setq +lsp-company-backends '(company-tabnine))
