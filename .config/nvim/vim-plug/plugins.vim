" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  Plug 'christianchiarulli/onedark.vim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'dense-analysis/ale'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'mhinz/vim-startify'

  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'

  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  Plug 'kamykn/spelunker.vim'

  Plug 'sebdah/vim-delve', { 'for': ['go'] }

  Plug 'benmills/vimux'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
