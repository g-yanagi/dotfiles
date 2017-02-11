set nocompatible               " be iMproved
filetype off                   " required!

" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc',{
            \ 'build' : {
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'Align'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'othree/html5.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle "tyru/caw.vim.git"
NeoBundle "google/vim-ft-go"
NeoBundle 'vim-jp/vim-go-extra'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'hitode7456/vim-jsm'
NeoBundle 'moll/vim-node'
NeoBundle 'mattn/jscomplete-vim'
NeoBundle 'myhere/vim-nodejs-complete'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'elzr/vim-json'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'dracula/vim'
call neobundle#end()

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
" set number
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
" fold
set foldmethod=marker

" □とか○の文字があってもカーソル位置がずれないようにする
set ambiwidth=double

" 色
set background=dark
colorscheme elflord

autocmd BufNewFile,BufRead *.json   set ft=json
autocmd BufNewFile,BufRead *.mfj    set ft=json
autocmd BufNewFile,BufRead *.jsm    set ft=jsm
autocmd BufNewFile,BufRead *.ejs    set ft=html
autocmd BufNewFile,BufRead *.volt   set ft=htmldjango

autocmd FileType go     autocmd BufWritePre <buffer> Fmt
autocmd FileType ruby   setl sw=2 sts=2 et
autocmd FileType eruby  setl sw=2 sts=2 et
autocmd FileType coffee setl sw=2 sts=2 et
autocmd FileType js     setl sw=4 sts=4 et
autocmd FileType yaml   setl sw=2 sts=2 et

" 全角スペースを目立たせる
highlight link ZenkakuSpace Error
match ZenkakuSpace /　/

" スクロールは１行づつ行うようにする
nnoremap j gj
nnoremap k gk

" vimdiff の配色を変更
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

" 非表示文字を表示させる
set list
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

" caw
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

" ctrlp
let g:ctrlp_working_path_mode = 0

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
"let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'

if has('win32') || has('win64')
	" Display user name on Windows.
	let g:vimshell_prompt = $USERNAME."% "
else
	" Display user name on Linux.
	let g:vimshell_prompt = $USER."% "
endif

" Initialize execute file list.
let g:vimshell_execute_file_list = {}
call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
let g:vimshell_execute_file_list['rb'] = 'ruby'
let g:vimshell_execute_file_list['pl'] = 'perl'
let g:vimshell_execute_file_list['py'] = 'python'
call vimshell#set_execute_file('html,xhtml', 'gexe firefox')

autocmd FileType vimshell
			\ call vimshell#altercmd#define('g', 'git')
			\| call vimshell#altercmd#define('i', 'iexe')
			\| call vimshell#altercmd#define('l', 'll')
			\| call vimshell#altercmd#define('ll', 'ls -l')
			\| call vimshell#hook#add('chpwd', 'my_chpwd', 'MyChpwd')

function! MyChpwd(args, context)
	call vimshell#execute('ls')
endfunction

autocmd FileType int-* call s:interactive_settings()
function! s:interactive_settings()
endfunction

" tmux で色落ちする問題対策
set t_ut=

" jscomplete-vim
setl omnifunc=jscomplete#CompleteJS

" vim-nodejs-complete
setl omnifunc=jscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
let g:node_usejscomplete = 1

" syntastic
let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
let g:syntastic_check_on_save=1 "保存時にはチェック
let g:syntastic_check_on_wq = 0 " wqではチェックしない
let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
set statusline+=%#warningmsg# "エラーメッセージの書式
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint'] "ESLintを使う
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': []
      \ }

" vim-json
let g:vim_json_syntax_conceal = 0


" rainbow_parentheses.vim
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

