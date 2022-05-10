set nocompatible
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_keep_dir=0
let g:netrw_localcopydircmd='cp -r'
let g:netrw_list_hide='\v[\/](build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:ctrlp_custom_ignore='\v[\/](build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:ctrlp_cache_dir = '$HOME/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:mkdp_browser='microsoft-edge-stable'
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[1 q"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
call plug#begin('~/.vim/plugged')
Plug 'rhysd/conflict-marker.vim'
Plug 'joshdick/onedark.vim'
Plug 'kien/ctrlp.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'kien/rainbow_parentheses.vim'
call plug#end()
colorscheme onedark
filetype indent plugin on
set t_Co=256
set hidden
set updatetime=300
set wildmenu
set wildmode=list:longest
set wildignorecase
set wildignore=**/node_modules/**
set shortmess+=c
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
set title titlestring=
set nobackup
set nowritebackup
set directory=~/.vim/tmp
set backspace=eol,start,indent
set mouse=n
set ignorecase
set smartcase
set laststatus=0
set number norelativenumber
set nospell
set cursorline
autocmd Filetype markdown setlocal spell
autocmd Filetype text setlocal spell
set virtualedit=block
set history=500
set path+=**
set formatoptions+=j
set timeoutlen=1000
set ttimeoutlen=5
set nostartofline
set termguicolors
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=1000
set showcmd
set display+=lastline
syntax on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
autocmd FileType markdown match none
nmap <SPACE> <leader>
vmap <SPACE> <leader>
nnoremap <leader>w :%s/\s\+$//g<cr>
nnoremap <leader>r :grep -F '' **/*.* <left><left><left><left><left><left><left><left><left>
nnoremap <leader>n :MarkdownPreviewToggle<cr>
nnoremap <leader>t :Maketags<cr>
nnoremap <leader>e :Lexplore<cr>
nnoremap <leader>b :source $MYVIMRC<cr>
command! Maketags :!ctags -R --exclude=.git --exclude=vendor --exclude=package-lock.json --exclude=node_modules --exclude=db --exclude=log .
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
autocmd bufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd filetype markdown set nocopyindent noautoindent nosmartindent nocindent
