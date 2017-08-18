"basics
syntax on
filetype plugin indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set mouse=a
let base16colorspace=256
set timeoutlen=1000 ttimeoutlen=0
set showmatch
set shell=/bin/bash

"hi CursorLine term=bold cterm=bold ctermbg=Gray
colorscheme wal
"Vim-Plug integration
call plug#begin()
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dylanaraps/wal.vim'
call plug#end()
