set nocompatible
syntax on
set hidden
set expandtab
set bg=dark
set tabstop=4
set shiftwidth=4
set autoindent
set ignorecase
set number
set autochdir
set timeoutlen=1000
set ttimeoutlen=1
set laststatus=0
nnoremap Q <nop>
inoremap kj <esc>
command! Tags :!ctags -R .
command! Trim :%s/\s\+$//g
