set nocompatible
syntax on
filetype indent plugin on
hi LineNr ctermfg=gray
hi Comment ctermfg=darkgreen
set hidden
set wildmenu
set wildignorecase
set expandtab
set ttyfast
set nrformats=alpha
set tabstop=4
set shiftwidth=4
set autoindent
set lazyredraw
set ignorecase
set number
set tags=tags
set timeoutlen=1000
set ttimeoutlen=1
set mouse=n
nnoremap <c-l> :noh<cr>
nnoremap Q <nop>
inoremap kj <esc>
command! Tags :!ctags -R .
command! Trim :%s/\s\+$//g
