"settings
syntax on
color evening
set nu rnu
set is
set nocompatible
filetype plugin indent on
filetype off
set hidden
set clipboard=unnamedplus
set autoindent
set ignorecase
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=eol,start,indent
set incsearch
set hlsearch
set matchpairs=(:),{:},[:],<:>,':',":"
set laststatus=0
set modelines=0
set virtualedit=block
set lazyredraw
"keybinds
inoremap kj <ESC>
inoremap <C-h> <C-w>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
vnoremap y myy`y
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap v <C-v>
nnoremap v <C-v>
nnoremap <C-v> v
inoremap <C-a> <HOME>
inoremap <C-e> <END>
nmap <cr> :noh<cr>
"leader binds
nmap <SPACE> <leader>
vmap <SPACE> <leader>
nnoremap <leader>a mggg=G`gzz
nnoremap <leader>s :%s//g<left><left>
vnoremap <leader>s :s//g<left><left>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>x :x<cr>
autocmd BufWritePre * %s/\s\+$//e
