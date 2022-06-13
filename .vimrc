set nocompatible
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_keep_dir=0
let ignorelist = '\v[\/](coverage|build|dist|doc|tmp|node_modules)|\v(package-lock.json|tags)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:netrw_list_hide=ignorelist
let g:ctrlp_custom_ignore=ignorelist
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:loaded_matchparen=1
call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
call plug#end()
filetype indent plugin on
hi LineNr ctermfg=gray ctermbg=NONE
set hidden
set bs=2
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
set undofile
set undodir=~/.vim/undodir
set directory=$HOME/.vim/swapfiles//
syntax on
nmap S ^C
nmap Y y$
inoremap kj <esc>
command! Tags :!ctags -R --exclude=coverage --exclude=tmp --exclude=coverage --exclude=.git --exclude=vendor --exclude=package-lock.json --exclude=node_modules --exclude=db --exclude=log --exclude=dist --exclude=build .
command! Trim :%s/\s\+$//g
