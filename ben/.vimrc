syntax on
color evening
set nu rnu
set nocompatible
filetype plugin indent on
filetype off
set path+=**
set timeoutlen=200
set hidden
set clipboard=unnamedplus
set expandtab
set smarttab
set cindent
set copyindent
set ignorecase
set tabstop=2
set shiftwidth=2
set backspace=eol,start,indent
set matchpairs=(:),{:},[:],<:>,':',":"
set laststatus=0
set modelines=0
set virtualedit=block
inoremap <C-h> <C-w>
inoremap <C-a> <HOME>
inoremap <C-e> <END>
autocmd BufWritePre * %s/\s\+$//e
