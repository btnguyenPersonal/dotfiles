set nocompatible
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:loaded_matchparen=1
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'wikitopian/hardmode'
call plug#end()
filetype indent plugin on
hi LineNr ctermfg=gray ctermbg=NONE
set hidden
set wildmenu
set wildignorecase
set expandtab
set ttyfast
set nrformats=alpha
set tabstop=4
set shiftwidth=4
set autoindent
set copyindent
set smartindent
set hlsearch
set cindent
set incsearch
set lazyredraw
set ignorecase
set number
set tags=tags
set timeoutlen=1000
set ttimeoutlen=1
set mouse=n
syntax on
nnoremap <c-l> :noh<cr>
nnoremap Q <nop>
inoremap kj <esc>
command! Tags :!ctags -R .
command! Trim :%s/\s\+$//g
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
