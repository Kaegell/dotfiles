"basics
syntax on
set number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set mouse=a
let base16colorspace=256
set timeoutlen=1000 ttimeoutlen=0
set showmatch
set wildmenu
set wildmode=longest:list:full
set shell=/bin/bash
setlocal foldmethod=indent
set foldlevel=99

filetype plugin indent on
"hi CursorLine term=bold cterm=bold ctermbg=Gray
colorscheme wal

call plug#begin('~/.config/nvim/plugged')
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dylanaraps/wal.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()
