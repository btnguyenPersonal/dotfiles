syntax on
color evening
set number relativenumber
set clipboard+=unnamedplus
nmap <SPACE> <leader>
vmap <SPACE> <leader>
inoremap <C-h> <C-w>
inoremap kj <ESC>
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
vnoremap y myy`y
vnoremap Y myY`y
nnoremap ; :
vnoremap ; :
set timeoutlen=500
set ttimeoutlen=0
set wildmenu
set wildmode=longest:longest,full
set wildignorecase
set hidden
set expandtab
set copyindent
set tabstop=2
set shiftwidth=2
set scrolloff=8
set hlsearch
set backspace=eol,start,indent
set matchpairs+=<:>
set laststatus=0
set virtualedit=block
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
nnoremap v <C-V>
xnoremap v <C-V>
nnoremap <C-V> v
xnoremap <C-V> v
map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
nmap Y y$
nmap <cr> :noh<cr>
vnoremap < <gv
vnoremap > >gv
nnoremap n nzzzv
nnoremap N Nzzzv
inoremap <C-a> <HOME>
inoremap <C-e> <END>
nnoremap <leader>e :e<space>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>s :%s//g<left><left>
vnoremap <leader>s :s//g<left><left>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>d "_d
vnoremap <leader>D "_D
vnoremap <leader>p "_dp
vnoremap <leader>P "_dP
