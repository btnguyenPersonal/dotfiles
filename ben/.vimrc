set nocompatible
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif
Plug 'gioele/vim-autoswap'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
call plug#end()
call matchadd('ColorColumn', '\%81v', 100)
set hidden
set updatetime=300
set wildmenu
set wildmode=full
set wildignorecase
set shortmess+=c
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set nrformats+=alpha
set autoindent
set smartindent
set cindent
set scrolloff=6
set incsearch
set nohls
set lazyredraw
set title titlestring=
set nobackup
set nowritebackup
set directory=~/.vim/tmp
set backspace=eol,start,indent
set signcolumn=yes
set laststatus=2
set statusline=%n
set statusline+=/%{NrBufs()}
set statusline+=\ %f%M%=\ %2.3v\ %l/%L
function! NrBufs()
    let i = bufnr('$')
    let j = 0
    while i >= 1
        if buflisted(i)
            let j+=1
        endif
        let i-=1
    endwhile
    return j
endfunction
set ignorecase
set smartcase
set number
set clipboard+=unnamedplus
set virtualedit=block
set history=500
set path=$PWD/**
set wildignore=**/node_modules/**
set timeoutlen=1000
set ttimeoutlen=5
syntax on
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:autoswap_detect_tmux = 1
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
colorscheme elflord
nmap <SPACE> <leader>
vmap <SPACE> <leader>
nnoremap <leader>w :call TrimWhitespace()<cr>
nnoremap <leader>t :Maketags<cr>
nnoremap <leader>m :Git mergetool<cr>
nnoremap <leader>a <C-w>h:q<cr>:Gwrite<cr>:Git difftool --name-status<cr>:vert Gdiff :0<cr><C-w>l
nnoremap <leader>g :!git add -N .<cr>:Git difftool --name-status<cr>:vert Gdiff :0<cr><C-w>l
nmap <leader>s z=
nnoremap <leader>j :GBranches<cr>
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
nnoremap Q <Nop>
inoremap {<cr> {<cr>}<esc>O
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
command! Maketags :!ctags -R --exclude=.git--exclude=vendor --exclude=node_modules --exclude=db --exclude=log .
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
au bufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd VimEnter * :norm zz
highlight DiffAdd guibg=#006400
highlight DiffText guibg=#666600
highlight DiffChange guibg=#1E1E1E
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
highlight clear SignColumn
