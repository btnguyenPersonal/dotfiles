set nocompatible
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_keep_dir=0
let g:netrw_localcopydircmd='cp -r'
let g:netrw_list_hide='\v[\/](build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:ctrlp_custom_ignore='\v[\/](build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[1 q"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
    autocmd VimEnter * PlugInstall | q
endif
Plug 'tpope/vim-unimpaired'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'mhartington/oceanic-next'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'spolu/dwm.vim'
call plug#end()
colorscheme OceanicNext
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
set nojoinspaces
set tabstop=4
set shiftwidth=4
set softtabstop=-1
set encoding=utf-8
set hls
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
set number
set spell
set virtualedit=block
set history=500
set path+=**
set timeoutlen=1000
set ttimeoutlen=5
set tags=./tags;~
set bg=dark
set nostartofline
set termguicolors
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=1000
set showcmd
syntax on
highlight SpellBad cterm=underline gui=underline guibg=NONE ctermbg=NONE ctermfg=yellow guifg=NONE
highlight SpellCap guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE
highlight QuickFixLine cterm=underline gui=underline guibg=NONE guifg=green ctermbg=NONE ctermfg=green
highlight Search cterm=underline gui=underline guibg=NONE guifg=green ctermbg=NONE ctermfg=green
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
nmap <SPACE> <leader>
vmap <SPACE> <leader>
nnoremap <leader>w :call TrimWhitespace()<cr>
nnoremap <leader>l :call Format()<cr>
nnoremap <leader>t :silent Maketags<cr>:redraw!<cr>
nnoremap <leader>r :grep -F '' **/*.* <left><left><left><left><left><left><left><left><left>
nnoremap <leader>i :setlocal spell!<cr>
nnoremap <leader>n :MarkdownPreviewToggle<cr>
nnoremap <leader>e :Lexplore<cr>
nnoremap <leader>b :source $MYVIMRC<cr>
nmap <leader>f ofor(int count = 0; count < _iteration_size; count++) {}<left><esc>k:call ForLoop()<cr>/_iteration_size<cr>"_ciw
autocmd filetype java,c,cpp nmap <leader>f ofor(int count = 0; count < _iteration_size; count++) {}<left><esc>k:call ForLoop()<cr>/_iteration_size<cr>"_ciw
autocmd filetype js nmap <leader>f ofor(let count = 0; count < _iteration_size; count++) {}<left><esc>k:call ForLoop()<cr>/_iteration_size<cr>"_ciw
fun! ForLoop()
    call inputsave()
    let varname = input('var_name? ')
    call inputrestore()
    exec 's/count/' . varname . '/g'
endfun
fun! TrimWhitespace()
    :norm mg
    :%s/\s\+$//
    :norm `g
endfun
fun! Format()
    :norm mg
    :norm gg=G
    :norm `g
endfun
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
nnoremap Q <Nop>
nnoremap gh :nohls<cr>
nnoremap Y y$
nnoremap S ^C
inoremap {<cr> {<cr>}<esc>O
inoremap (<cr> (<cr>);<esc>O
inoremap <C-l> <Esc>/[)}"'\]>]<CR>:silent nohl<CR>a
inoremap <C-h> <Esc>?[({"'\[<]<CR>:silent nohl<CR>i
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
command! Maketags :!ctags -R --exclude=.git --exclude=vendor --exclude=package-lock.json --exclude=node_modules --exclude=db --exclude=log .
command W w
if v:version + has("patch541") >= 704
    set formatoptions+=j
endif
autocmd BufWritePost *.c,*.h,*.cpp silent! :Maketags
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
autocmd bufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd VimEnter * :norm zz
autocmd BufWinEnter * :norm zz
autocmd VimEnter * :norm zR
autocmd BufWinEnter * :norm zR
