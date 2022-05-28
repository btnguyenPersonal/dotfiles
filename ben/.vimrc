set nocompatible
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_keep_dir=0
let g:netrw_list_hide='\v[\/](target|dist|build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:ctrlp_custom_ignore='\v[\/](target|dist|build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
syntax on
call plug#begin()
Plug 'kien/ctrlp.vim'
call plug#end()
colorscheme desert
filetype indent plugin on
set hidden
set updatetime=300
set wildmenu
set wildignorecase
set expandtab
set smarttab
set ttyfast
set nrformats=alpha
set nojoinspaces
set tabstop=4
set shiftwidth=4
set softtabstop=-1
set encoding=utf-8
set autoindent
set copyindent
set smartindent
set cindent
set incsearch
set lazyredraw
set mouse=n
set ignorecase
set smartcase
set laststatus=0
set number
set history=500
set formatoptions+=j
set timeoutlen=1000
set ttimeoutlen=5
set nostartofline
set showcmd
set scrolloff=6
set display+=lastline
imap kj <esc>
nmap S ^C
nmap Y y$
nmap <SPACE> <leader>
vmap <SPACE> <leader>
nnoremap <leader>w :%s/\s\+$//g<cr>
nnoremap <leader>r :grep -F '' **/*.* <left><left><left><left><left><left><left><left><left>
nnoremap <leader>t :Maketags<cr>
nnoremap <leader>e :Lexplore<cr>
nnoremap <leader>b :source $MYVIMRC<cr>
command! Maketags :!ctags -R --exclude=.git --exclude=vendor --exclude=package-lock.json --exclude=node_modules --exclude=db --exclude=log .
