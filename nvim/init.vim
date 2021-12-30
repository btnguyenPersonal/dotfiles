" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" markdown preview
Plug 'iamcco/markdown-preview.nvim'
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
" one keypress to comment for all languages
Plug 'scrooloose/nerdcommenter'
" cool status bar
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

" space as leader
nmap <SPACE> <leader>
vmap <SPACE> <leader>

" adds mark if over the 80 char limit per line
call matchadd('ColorColumn', '\%81v', 100)
" autocorrect on tab for commands
set wildmenu
set wildmode=longest:longest,full
set wildignorecase
" hides the mode at the bottom e.g. --INSERT--
" because have cool status bar that shows it don't need it
set noshowmode
" colors independent of what terminal you are using
set termguicolors
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
set scrolloff=8
" search will update with ever char pressed
set incsearch
set hlsearch
" less redrawing when running macros (much faster)
set lazyredraw
" regex features
set magic
" backspace can break lines
set backspace=eol,start,indent
" adds <> as matching pairs
set matchpairs+=<:>
" i have no idea
set whichwrap+=<,>,h,l
" fuck sign column and fold column
set signcolumn=no
set foldcolumn=0
" searches are not case-sensitive anymore
set ignorecase
set smartcase
" line numbers on the side
set number relativenumber
" copy paste integration with OS
set clipboard+=unnamedplus
set timeoutlen=200
" where :sp and :vsp will split to
set splitbelow
set splitright
" history of commands
set history=500
" allows mouse input
set mouse=a
" break lines on words instead of characters
set linebreak
" intuitive visual block
set virtualedit=block
" changes the title of the terminal
set title
set gdefault
" coc autosuggestions colors
hi Pmenu guibg=White guifg=Black
hi PmenuSel guibg=LightGreen guifg=Black
" syntax highlighting on
syntax on
" cool dragging for visual block
vmap <expr> <LEFT>  'DVB_Drag('left')
vmap <expr> <RIGHT> 'DVB_Drag('right')
vmap <expr> <DOWN>  'DVB_Drag('down')
vmap <expr> <UP>    'DVB_Drag('up')
vmap <expr> D DVB_Duplicate()
" when searching always keep next instance centered
nnoremap n nzzzv
nnoremap N Nzzzv
" allow ctrl backspace in insert mode
inoremap <C-h> <C-w>
" easier visual block moving around
xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"
" press enter to remove current highlighting useful after searching and don't
" want the highlighting to happen anymore
nnoremap <cr> :noh<cr>
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

" fixes easy misspells
iab retrun return
iab pritn print
iab teh the
iab liek like

" more readable colors
highlight Search guibg='Purple' guifg='White'
highlight Folded guibg='none' guifg='Green'
highlight CocUnusedHighlight guibg='none' guifg='Yellow'
highlight CocHighlightText guibg='Green' guifg='White'
highlight CocHighlightRead guibg='Green' guifg='White'
highlight CocHighlightWrite guibg='Green' guifg='White'

" commenting out code shortcut
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle

" fzf layout
let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" leader commands

" search files
nnoremap <leader>s :%s//<left>
vnoremap <leader>s :s//<left>
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

" no idea
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
au bufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" force save, actually doesn't really work idk why
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" trim whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" let you j and k into wrapped lines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" coc extentions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ ]
" allow files to be changed without saving
set hidden
set updatetime=300
set autoread
set autowrite
set shortmess+=c

" no idea
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" remove suggestions for text and markdown files
autocmd FileType text let b:coc_suggest_disable = 1
autocmd FileType markdown let b:coc_suggest_disable = 1

" Remap keys for gotos
" use coc for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
" same as calling :help on something
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:mkdp_auto_start = 1
let g:mkdp_browser = 'surf'
