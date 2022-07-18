set nocompatible
syntax on
let g:fzf_layout = { 'down':  '30%'}
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()
hi LineNr ctermfg=gray
set hidden
set expandtab
set bg=light
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
nnoremap <c-g> :Ag<cr>
nnoremap <c-p> :GFiles<cr>
inoremap <expr> <c-x><c-j> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')
inoremap kj <esc>
command! Tags :!ctags -R .
command! Trim :%s/\s\+$//g
