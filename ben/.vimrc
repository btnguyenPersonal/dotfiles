set nocompatible
set virtualedit=block
set modelines=0
set laststatus=0
set matchpairs=(:),{:},[:],<:>,':',":"
set backspace=eol,start,indent
set shiftwidth=2
set tabstop=2
set ignorecase
set copyindent
set cindent
set smarttab
set expandtab
set clipboard=unnamedplus
set hidden
set timeoutlen=200
set path+=.,**
set nu rnu
color evening
syntax on
filetype plugin indent on
autocmd BufWritePre * %s/\s\+$//e
