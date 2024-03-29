display settings for gvim
" ----------------------
" colorscheme railscasts
" set background=dark
" colorscheme desert
" set showtabline=2
set background=dark
colorscheme dracula


" window size
if has("win32")
    au GUIEnter * simalt ~x
else
"    set transparency=8
    au GUIEnter * set lines=60
    au GUIEnter * set columns=190
endif

" menus
set guioptions-=T " no tool bar
set guioptions-=m " no menu bar
set guioptions-=r " no right scrollbar
set guioptions-=R " no right scrollbar
set guioptions-=l " no left scrollbar
set guioptions-=L " no left scrollbar

" set guifont=Ricty:h14
set guifont=Migu_1M:h20

