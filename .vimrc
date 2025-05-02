call plug#begin()
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/tpope/vim-commentary'
call plug#end()
syntax on
nnoremap @ @w
nnoremap < <<
nnoremap > >>
nnoremap n nzz
nnoremap N Nzz
nnoremap z zz
vnoremap P "_dP
nmap <c-l> :noh<cr>
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
nnoremap <c-f> :%s/<c-r>///g<left><left>
nnoremap <c-f> :%s/<c-r>///g<left><left>
vnoremap <c-f> :%s/<c-r>///g<left><left>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nmap e gcc
vmap e gc
vnoremap # :vimgrep '<c-r>/' `git ls-files`<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <c-g> :vimgrep '' `git ls-files`<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <c-k> :cp<cr>zz
nnoremap <c-j> :cn<cr>zz
set laststatus=0
set incsearch
set hlsearch
set noswapfile
set bg=dark
set ttimeoutlen=1
set tabstop=4
set shiftwidth=4
set expandtab
set cindent
set hidden
set wrap
set number
set ruler
set clipboard=unnamed,unnamedplus
set scrolloff=8
