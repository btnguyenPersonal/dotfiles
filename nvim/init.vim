" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'JiriChara/dragvisuals.vim'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

nmap <SPACE> <leader>
vmap <SPACE> <leader>

call matchadd('ColorColumn', '\%81v', 100)
set wildmenu
set wildmode=longest:longest,full
set wildignorecase
set noshowmode
set termguicolors
set expandtab
set smarttab
set cindent
set copyindent
set tabstop=2
set shiftwidth=2
set nobackup
set nowb
set directory=~/.vim/tmp
set scrolloff=2
set incsearch
set hlsearch
set lazyredraw
set magic
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set signcolumn=no
set foldcolumn=0
set ignorecase
set number relativenumber
set clipboard+=unnamedplus
set splitbelow
set splitright
set history=500
set mouse=a
set linebreak
set virtualedit=block
set matchpairs+=<:>
set title
set titleold=
set title titlestring=
hi Pmenu guibg=Black guifg=White
hi PmenuSel guibg=Black guifg=LightGreen
vnoremap <ESC> <ESC><ESC>
vnoremap y myy`y
vnoremap Y myY`y
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv
nnoremap ; :
vnoremap ; :
nnoremap v <C-V>
nnoremap <C-V> v
xnoremap v <C-V>
xnoremap <C-V> v
xmap <BS> x
syntax on
vmap <expr> <LEFT>  'DVB_Drag('left')
vmap <expr> <RIGHT> 'DVB_Drag('right')
vmap <expr> <DOWN>  'DVB_Drag('down')
vmap <expr> <UP>    'DVB_Drag('up')
vmap <expr> D DVB_Duplicate()
map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
nmap Y y$
vnoremap < <gv
vnoremap > >gv
nnoremap n nzzzv
nnoremap N Nzzzv
inoremap <C-h> <C-w>
inoremap kj <ESC>
inoremap <C-a> <HOME>
inoremap <C-e> <END>
xnoremap <S-TAB> :s/\%V/0<C-V><TAB>/<CR>gvg<C-A>gv:retab<ESC>gvI<C-G>u<ESC>gv/ <CR>:s/\%V /./<CR>:nohl<CR>
xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"

iab retrun return
iab pritn print
iab teh the
iab liek like

highlight Search guibg='Purple' guifg='White'
highlight Folded guibg='none' guifg='Green'
highlight CocUnusedHighlight guibg='none' guifg='Yellow'
highlight CocHighlightText guibg='Green' guifg='White'
highlight CocHighlightRead guibg='Green' guifg='White'
highlight CocHighlightWrite guibg='Green' guifg='White'

vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle

let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
let $FZF_DEFAULT_OPTS = '--layout=reverse'

nnoremap <leader>f :Files<cr>
nnoremap <leader>F :AllFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>k :History<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>R :Rg<space>
nnoremap <leader>gb :GBranches<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>cc :cd /<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>m :e ~/.buffer<cr>
nnoremap <leader>s :%s///g<left><left><left>
vnoremap <leader>s :s///g<left><left><left>
nnoremap <leader>v :vsp<cr>
nnoremap <leader>i :silent !alacritty -e nvim ~/.config/nvim/init.vim &<cr>
nnoremap <leader>d "_d
vnoremap <leader>D "_D
vnoremap <leader>p "_dp
vnoremap <leader>P "_dP
nnoremap <cr> :noh<cr>
nnoremap , @@

autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $` <esc>`>a`<esc>`<i`<esc>

inoremap $1 ()<left>
inoremap $2 []<left>
inoremap $3 {}<left>
inoremap $4 {<esc>o}<esc>O
inoremap $' ''<left>
inoremap $" ""<left>
inoremap $< <><left>

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

let g:floaterm_keymap_toggle = '<C-t>'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

augroup FloatermCustomisations
    autocmd!
    autocmd ColorScheme * highlight FloatermBorder guibg=none
augroup END

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ ]
set hidden
set updatetime=300
set autoread
set autowrite
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd FileType text let b:coc_suggest_disable = 1
autocmd FileType markdown let b:coc_suggest_disable = 1

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>af  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
