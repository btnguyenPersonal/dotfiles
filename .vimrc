set nocompatible
syntax on
set hidden
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set ignorecase
set number
nnoremap Q <nop>
inoremap kj <esc>
command! Tags :!ctags -R .
command! Trim :%s/\s\+$//g
