set nocompatible
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_keep_dir=0
let g:netrw_localcopydircmd='cp -r'
let g:netrw_list_hide='\v[\/](build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:ctrlp_custom_ignore='\v[\/](build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:dwm_map_keys=0
let g:mkdp_browser='microsoft-edge-stable'
let g:easytags_always_enabled = 1
let g:easytags_async=1
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
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'spolu/dwm.vim'
call plug#end()
colorscheme darkblue
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
set laststatus=2
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
set display+=lastline
syntax on
highlight SpellBad cterm=underline gui=underline guibg=NONE ctermbg=NONE ctermfg=yellow guifg=NONE
highlight SpellCap guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE
highlight StatusLine guibg=black guifg=white ctermbg=black ctermfg=white
highlight Normal guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE guifg=gray ctermfg=gray gui=italic cterm=italic
highlight SignColumn guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
nmap <SPACE> <leader>
vmap <SPACE> <leader>
nnoremap <leader>w :call TrimWhitespace()<cr>
nnoremap <leader>l :call Format()<cr>
nnoremap <leader>t :silent Maketags<cr>:redraw!<cr>
nnoremap <leader>r :grep -F '' **/*.* <left><left><left><left><left><left><left><left><left>
nnoremap <leader>i :setlocal spell!<cr>
nnoremap <leader>k :Autoformat<cr>
nnoremap <leader>n :MarkdownPreviewToggle<cr>
nnoremap <leader>e :Lexplore<cr>
nnoremap <leader>b :source $MYVIMRC<cr>
nnoremap <leader>gc :GrammarousCheck<cr>
vnoremap <leader>gc :GrammarousCheck<cr>
nnoremap <leader>gr :GrammarousReset<cr>
nnoremap <leader>ij OID: peterax1LANG: JAVATASK:*/<esc>ggO/*<esc>/TASK:<cr>A <c-r>%<esc>F.DG:nohls<cr>A
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
noremap [a     :previous<cr>
noremap ]a     :next<cr>
noremap [A     :first<cr>
noremap ]A     :last<cr>
noremap [b     :bprevious<cr>
noremap ]b     :bnext<cr>
noremap [B     :bfirst<cr>
noremap ]B     :blast<cr>
noremap [l     :lprevious<cr>
noremap ]l     :lnext<cr>
noremap [L     :lfirst<cr>
noremap ]L     :llast<cr>
noremap [<C-L> :lpfile<cr>
noremap ]<C-L> :lnfile<cr>
noremap [q     :cprevious<cr>
noremap ]q     :cnext<cr>
noremap [Q     :cfirst<cr>
noremap ]Q     :clast<cr>
noremap [<C-Q> :cpfile<cr>
noremap ]<C-Q> :cnfile<cr>
noremap [t     :tprevious<cr>
noremap ]t     :tnext<cr>
noremap [T     :tfirst<cr>
noremap ]T     :tlast<cr>
noremap [<C-T> :ptprevious<cr>
noremap ]<C-T> :ptnext<cr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
nnoremap Q <Nop>
nnoremap gt :bn<cr>
nnoremap gT :bp<cr>
nnoremap Y y$
nnoremap S ^C
inoremap {<cr> {<cr>}<esc>O
inoremap (<cr> (<cr>);<esc>O
nmap <CR>   <Plug>DWMFocus
nmap <C-C>  <Plug>DWMClose
nmap <C-N>  <Plug>DWMNew
nnoremap gl <cr>
nnoremap <C-K>  <C-W>W
nnoremap <C-J>  <C-W>w
nnoremap <C-l> :nohls<cr>
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
autocmd filetype markdown set nocopyindent noautoindent nosmartindent nocindent
