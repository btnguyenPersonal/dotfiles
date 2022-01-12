" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" markdown preview
Plug 'iamcco/markdown-preview.nvim'
" parenthesis stuff
Plug 'tpope/vim-surround'
" cool visual dragging plugin
Plug 'JiriChara/dragvisuals.vim'
" moar languages
Plug 'sheerun/vim-polyglot'
" fzf so i can find files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
" coc so i can have IDE like behavior
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'

" Initialize plugin system
call plug#end()

" space as leader
nmap <SPACE> <leader>
vmap <SPACE> <leader>

" adds mark if over the 80 char limit per line
call matchadd('ColorColumn', '\%81v', 100)
" autocorrect on tab for commands
set wildmenu
set wildmode=full
set wildignorecase
" colors independent of what terminal you are using
set termguicolors
set hidden
set updatetime=300
set shortmess+=c
set autoread
" no tabs only spaces
set expandtab
set smarttab
" indentation stuff
set cindent
set copyindent
set tabstop=2
set shiftwidth=2
" where to store .swp files
set directory=~/.vim/tmp
" context around scrolling
set scrolloff=1
" search will update with ever char pressed
set incsearch
set nohls
" less redrawing when running macros (much faster)
set lazyredraw
" funny comment
" backspace can break lines
set backspace=eol,start,indent
" adds <> as matching pairs
set matchpairs+=<:>
" statusline
set statusline=(%n)\ %f%M%=\ %2.3v\ %l/%L
set laststatus=2
" i have no idea
set whichwrap+=<,>,h,l
" fuck sign column and fold column
set signcolumn=no
set foldcolumn=0
" searches are not case-sensitive anymore
set ignorecase
set smartcase
" line numbers on the side
set number
" copy paste integration with OS
set clipboard+=unnamedplus
" where :sp and :vsp will split to
set splitbelow
set splitright
" history of commands
set history=500
" allows mouse input
set mouse=a
" intuitive visual block
set virtualedit=block
" changes the title of the terminal
set title titlestring=%<%F%=%l/%L-%P titlelen=70
" spell check
set spell
" syntax highlighting on
syntax on
" cool dragging for visual block
vmap <expr> <LEFT>  'DVB_Drag('left')
vmap <expr> <RIGHT> 'DVB_Drag('right')
vmap <expr> <DOWN>  'DVB_Drag('down')
vmap <expr> <UP>    'DVB_Drag('up')
vmap <expr> D DVB_Duplicate()
" ex command completion with c-n and c-p
cnoremap <C-n> <Up>
cnoremap <C-p> <Down>
" ex command current file mapping
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" when searching always keep next instance centered
nnoremap n nzzzv
nnoremap N Nzzzv
" allow ctrl backspace in insert mode
inoremap <C-h> <C-w>
inoremap {<cr> {<cr>}<esc>O
" easier visual block moving around
xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"

" coc autosuggestions colors
hi Pmenu guibg=White guifg=Black
hi PmenuSel guibg=LightGreen guifg=Black
" more readable colors
highlight Search guibg='Purple' guifg='White'
highlight Folded guibg='none' guifg='Green'

" fzf layout
let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" leader commands
" search files
nnoremap <leader>f :Files<cr>
" search through open buffers
nnoremap <leader>b :Buffers<cr>
" search through what files have been edited last with nvim
nnoremap <leader>k :History<cr>
" grep instances of text in all files at directory
nnoremap <leader>r :Rg<cr>
" above but allows regex
nnoremap <leader>R :Rg<space>
" look at branches
nnoremap <leader>gb :GBranches<cr>

" trim whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

highlight CocUnusedHighlight guibg='none' guifg='Yellow'
highlight CocHighlightText guibg='Green' guifg='White'
highlight CocHighlightRead guibg='Green' guifg='White'
highlight CocHighlightWrite guibg='Green' guifg='White'

" pressing enter doesn't accept coc autosuggestions
inoremap <silent><expr> <cr> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<cr>"
" tab will accept an autosuggestion
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
" c-n and c-p will cycle through the suggestions
inoremap <silent><expr> <c-n>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "" :
      \ coc#refresh()
inoremap <silent><expr><c-p> pumvisible() ? "\<C-p>" : ""

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-highlight',
  \ ]

" remove suggestions for text and markdown files
autocmd FileType markdown,text let b:coc_suggest_disable = 1

" vim enter keep position
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
au bufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let g:mkdp_auto_start = 1
let g:mkdp_browser = 'surf'
