if empty(glob('~/.config/nvim/autoload/plug.vim'))
  :exe '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do' : { -> mkdp#util#install() }, 'for': ['markdown','vim-plug']}
" parenthesis stuff
Plug 'tpope/vim-surround'
" moar languages
Plug 'sheerun/vim-polyglot'
" fzf so i can find files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
" code context support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" c++ highlighting with ccls
Plug 'jackguo380/vim-lsp-cxx-highlight'
" parenthesis highlighting
Plug 'luochen1990/rainbow'
" IDE features
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" commenting code
Plug 'tpope/vim-commentary'
" plugins work with . command
Plug 'tpope/vim-repeat'
" better defaults
Plug 'tpope/vim-unimpaired'
" allow swapping with sub commands
Plug 'tpope/vim-abolish'
" vscode-like appearance
Plug 'tomasiser/vim-code-dark'
" git gutters
Plug 'airblade/vim-gitgutter'
" git integration
Plug 'tpope/vim-fugitive'
" indentation plugin
Plug 'lukas-reineke/indent-blankline.nvim'

" Initialize plugin system
call plug#end()

" have to put this here so doesn't override my highlighting
colorscheme codedark

" space as leader
nmap <SPACE> <leader>
vmap <SPACE> <leader>

" adds mark if over the 80 char limit per line
call matchadd('ColorColumn', '\%81v', 100)
" autocorrect on tab for commands
set wildmenu
set wildmode=full
set wildignorecase
set ruler
" colors independent of what terminal you are using
set termguicolors
set hidden
set updatetime=300
set shortmess+=c
" auto load changes in vim when a file changes
set autoread
" no tabs only spaces
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
" can use c-a on letters
set nrformats+=alpha
" indentation stuff
set autoindent
set smartindent
set cindent
" where to store .swp files
set directory=~/.vim/tmp
" context around scrolling
set scrolloff=6
set spell
" search will update with ever char pressed
set incsearch
set nohls
" less redrawing when running macros (much faster)
set lazyredraw
set nobackup
set nowritebackup
" backspace can break lines
set backspace=eol,start,indent
" adds <> as matching pairs
set matchpairs+=<:>
" statusline
set statusline=(%n)\ %f%M%=\ %2.3v\ %l/%L\ %{FugitiveStatusline()}
set laststatus=2
" i have no idea
set whichwrap+=<,>,h,l
" fuck sign column and fold column
set signcolumn=yes
" searches are not case-sensitive anymore
set ignorecase
set smartcase
" line numbers on the side
set number
set relativenumber
" copy paste integration with OS
set clipboard+=unnamedplus
" where :sp and :vsp will split to
set splitbelow
" history of commands
set history=500
" allows mouse input
set mouse=a
" intuitive visual block
set virtualedit=block
" spell check
" set spell
" syntax highlighting on
syntax on
vnoremap < <gv
vnoremap > >gv
" emacs cmd line edit
cnoremap <C-a>      <Home>
cnoremap <C-e>      <End>
cnoremap <C-k>      <C-u>
" ex command completion with c-n and c-p
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" ex command current file mapping
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" when searching always keep next instance centered
nnoremap n nzzzv
nnoremap N Nzzzv
" easier window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" turns off ex mode
nnoremap Q <NOP>
" braces macro
inoremap {<cr> {<cr>}<esc>O
" easier visual block moving around
xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"

" fzf layout
let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }
let $FZF_DEFAULT_OPTS = '--layout=reverse'

" git gutter next chunk
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" leader commands
" call highlight variable
nnoremap <leader>l :call CocActionAsync('highlight')<cr>
" save command
nnoremap <leader>w :call TrimWhitespace()<cr>:wa<cr>
" git mergetool
nnoremap <leader>m :Git mergetool<cr>
" git addtool
nnoremap <leader>a <C-w>h:q<cr>:Gwrite<cr>:Git difftool --name-status<cr>:vert Gdiff :0<cr><C-w>l
" git difftool
nnoremap <leader>c :!git add -N .<cr>:Git difftool --name-status<cr>:vert Gdiff :0<cr><C-w>l
" search files
nnoremap <leader>f :Files<cr>
" find files and put into quickfix list
nnoremap <leader>F :FileFile
" search through open buffers
nnoremap <leader>b :Buffers<cr>
" search through what files have been edited last with nvim
nnoremap <leader>k :History<cr>
" grep instances of text in all files at directory
nnoremap <leader>g :Rg<cr>
" format file command
nnoremap <leader>= mggg=G`g:call TrimWhitespace()<cr>zz
" look at branches
nnoremap <leader>j :GBranches<cr>

" trim whitespace on save
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

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

" coc extensions
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-vimlsp',
      \ 'coc-css',
      \ 'coc-highlight',
      \ 'coc-snippets',
      \ ]

" vim enter keep position
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
au bufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" have rainbow parenthesis
let g:rainbow_active = 1

" have markdown preview auto open in surf
let g:mkdp_auto_start = 1
let g:mkdp_browser= 'surf'

highlight DiffAdd guibg=#006400
highlight DiffText guibg=#666600
highlight DiffChange guibg=#1E1E1E

" coc highlighting for vars and stuff
highlight CocUnusedHighlight guibg='none' guifg='Yellow'
highlight CocHighlightText guibg='Green' guifg='White'
highlight CocHighlightRead guibg='Green' guifg='White'
highlight CocHighlightWrite guibg='Green' guifg='White'

" git gutter colors
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" highlights all of the line numbers for the git gutters
au VimEnter * :GitGutterLineNrHighlightsEnable

" easy for loop macro
" there has to be a better way to do this smh
iab aforl for (int a = 0; a < count; a++) {
iab bforl for (int b = 0; b < count; b++) {
iab cforl for (int c = 0; c < count; c++) {
iab dforl for (int d = 0; d < count; d++) {
iab eforl for (int e = 0; e < count; e++) {
iab fforl for (int f = 0; f < count; f++) {
iab gforl for (int g = 0; g < count; g++) {
iab hforl for (int h = 0; h < count; h++) {
iab iforl for (int i = 0; i < count; i++) {
iab jforl for (int j = 0; j < count; j++) {
iab kforl for (int k = 0; k < count; k++) {
iab lforl for (int l = 0; l < count; l++) {
iab mforl for (int m = 0; m < count; m++) {
iab nforl for (int n = 0; n < count; n++) {
iab oforl for (int o = 0; o < count; o++) {
iab pforl for (int p = 0; p < count; p++) {
iab qforl for (int q = 0; q < count; q++) {
iab rforl for (int r = 0; r < count; r++) {
iab sforl for (int s = 0; s < count; s++) {
iab tforl for (int t = 0; t < count; t++) {
iab uforl for (int u = 0; u < count; u++) {
iab vforl for (int v = 0; v < count; v++) {
iab wforl for (int w = 0; w < count; w++) {
iab xforl for (int x = 0; x < count; x++) {
iab yforl for (int y = 0; y < count; y++) {
iab zforl for (int z = 0; z < count; z++) {
iab aletl for (let a = 0; a < count; a++) {
iab bletl for (let b = 0; b < count; b++) {
iab cletl for (let c = 0; c < count; c++) {
iab dletl for (let d = 0; d < count; d++) {
iab eletl for (let e = 0; e < count; e++) {
iab fletl for (let f = 0; f < count; f++) {
iab gletl for (let g = 0; g < count; g++) {
iab hletl for (let h = 0; h < count; h++) {
iab iletl for (let i = 0; i < count; i++) {
iab jletl for (let j = 0; j < count; j++) {
iab kletl for (let k = 0; k < count; k++) {
iab lletl for (let l = 0; l < count; l++) {
iab mletl for (let m = 0; m < count; m++) {
iab nletl for (let n = 0; n < count; n++) {
iab oletl for (let o = 0; o < count; o++) {
iab pletl for (let p = 0; p < count; p++) {
iab qletl for (let q = 0; q < count; q++) {
iab rletl for (let r = 0; r < count; r++) {
iab sletl for (let s = 0; s < count; s++) {
iab tletl for (let t = 0; t < count; t++) {
iab uletl for (let u = 0; u < count; u++) {
iab vletl for (let v = 0; v < count; v++) {
iab wletl for (let w = 0; w < count; w++) {
iab xletl for (let x = 0; x < count; x++) {
iab yletl for (let y = 0; y < count; y++) {
iab zletl for (let z = 0; z < count; z++) {

" find files and populate the quickfix list
fun! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -iname "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfun
command! -nargs=1 FindFile call FindFiles(<q-args>)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gp <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

highlight IndentBlanklineContextStart guisp=#00FF00 gui=underline
highlight IndentBlanklineContextChar guifg=#00FF00 gui=nocombine
let g:indent_blankline_viewport_buffer = 10000
let g:indent_blankline_context_patterns = [
      \ "class",
      \ "^func",
      \ "method",
      \ "^if",
      \ "while",
      \ "for",
      \ "with",
      \ "try",
      \ "except",
      \ "arguments",
      \ "argument_list",
      \ "object",
      \ "dictionary",
      \ "element",
      \ "table",
      \ "^switch",
      \ "^case",
      \ "^default",
      \ "tuple", ]
