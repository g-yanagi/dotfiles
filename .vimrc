set nocompatible               " be iMproved
filetype off                   " required!

" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'Align'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'othree/html5.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle "tyru/caw.vim.git"
NeoBundle 'fatih/vim-go'

filetype plugin indent on     " required!
filetype indent on
syntax on

" 改行時に自動にインデントする
set autoindent
" 構文を解釈してインデントする
set smartindent
" ファイル内の <Tab> が対応する空白の数
set smarttab
" 対応する括弧をハイライト
set showmatch
" <Tab>キーによるファイル名補完を有効にする
set wildmenu
" OS のクリップボードを共有する
set clipboard=unnamed
" 開いているファイルに変更があった場合はロードする
set autoread
" 未保存な状態でもバッファを切替えられるようにする
set hidden
" 入力中のコマンドを表示する
set showcmd
" タブを半角スペースに変更
set expandtab
" 自動的に改行しないようにする
set textwidth=0
" 行番号
set number
" 入力中から詮索できるようにする
set incsearch
" 検索にマッチした語をハイライト
set hlsearch
" 小文字入力時大文字小文字を無視
set ignorecase
" 大文字入力時大文字小文字を無視
set smartcase
" バックアップファイルを有効
set nobackup
" バックアップファイルの場所
" set backupdir=~/.vim/vim_backup
" スワップファイルを有効
set noswapfile
" スワップファイルの場所
" set directory=~/.vim/vim_swap
" ベルを無効化
set visualbell
set t_vb=
" 改行をまたいで移動できるようにする
set whichwrap=b,s,h,l,<,>,[,]
" バックスペースでなんでも消せるように
set backspace=indent,eol,start
" タブの幅とか
set tabstop=4 shiftwidth=4 softtabstop=0
" ステータスバー
set laststatus=2
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P

" 全角スペースを目立たせる
highlight link ZenkakuSpace Error
match ZenkakuSpace /　/

" スクロールは１行づつ行うようにする
nnoremap j gj
nnoremap k gk

" インサートモードでも移動できるようにする
" imap <c-o> <END>
" imap <c-a> <HOME>
" imap <c-h> <LEFT>
" imap <c-j> <DOWN>
" imap <c-k> <UP>

" カレントディレクトリを自動的に移動 (ctrlp と相性が悪いのでコメントアウト)
" augroup BufferAu
"   autocmd!
   " change current directory
"   autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
" augroup END

" vimdiff の配色を変更
hi DiffAdd    ctermfg=black ctermbg=2  
hi DiffChange ctermfg=black ctermbg=3  
hi DiffDelete ctermfg=black ctermbg=6  
hi DiffText   ctermfg=black ctermbg=7

" 非表示文字を表示させる
set list
" set listchars=tab:..,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:..,trail:-,extends:»,precedes:«,nbsp:%

" Plugin setting
" --------------------

" NEED Commenter
let NERDShutUp = 1 "no alart undfined filetype

" rails.vim
let g:rails_level=3

" simple-javascript-indeter
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

" ruby モードのインデントを変更
au FileType ruby setl sw=2 sts=2 et
" eruby モードのインデントを変更
au FileType eruby setl sw=2 sts=2 et
" coffee モードのインデントを変更
au FileType coffee setl sw=2 sts=2 et

" gtags
" map <C-g> :Gtags
" map <C-h> :Gtags -f %<CR>
" map <C-j> :GtagsCursor<CR>
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>

" caw
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

" ctrlp
let g:ctrlp_working_path_mode = 0

" for golang
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
autocmd FileType go autocmd BufWritePre <buffer> Fmt
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
