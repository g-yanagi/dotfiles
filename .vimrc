set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" My Bundles here:
Bundle 'railscasts'
Bundle 'surround.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ctrlp.vim'
Bundle 'Haml'

" ...
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" "Bundle 'gmarik/vundle'



" edit
" ----------------------
set autoindent
set smartindent
set smarttab
set tabstop=2 shiftwidth=2 softtabstop=0
set showmatch " show mactch brace
set wildmenu
set clipboard=unnamed " share OS clipboard
set autoread
set hidden
set showcmd
set backspace=indent,eol,start
set expandtab
set textwidth=0

highlight link ZenkakuSpace Error
match ZenkakuSpace /　/

" move
" ----------------------
nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,]

" When insert mode, enable hjkl and enable go to home/end.
imap <c-o> <END>
imap <c-a> <HOME>
imap <c-h> <LEFT>
imap <c-j> <DOWN>
imap <c-k> <UP>
imap <c-l> <Right>

" search
" ----------------------
set incsearch
set ignorecase
set smartcase
" set hlsearch

" no bell
set visualbell
set t_vb=

" backup
" --------------------
set nobackup
set backupdir=~/.vim/vim_backup
set swapfile
set directory=~/.vim/vim_swap

" status bar
" --------------------
set laststatus=2
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P

" key map
" --------------------
let mapleader = ","
noremap <CR> o<ESC>

" auto command
" --------------------
augroup BufferAu
   autocmd!
   " change current directory
   autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
augroup END

" Plugin setting
" --------------------

" NEED Commenter
let NERDShutUp = 1 "no alart undfined filetype

" rails.vim
let g:rails_level=3


" foldling
" --------------------
" set foldmethod=indent
" set foldlevel=2
" set foldcolumn=3


" 行番号
" --------------------
set number
