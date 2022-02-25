if empty(glob('~/.config/nvim/autoload/plug.vim'))
  :exe '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do' : { -> mkdp#util#install() }, 'for': ['markdown','vim-plug']}
" parenthesis stuff
Plug 'tpope/vim-surround'
" code context support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" parenthesis highlighting
Plug 'luochen1990/rainbow'
" commenting code
Plug 'tpope/vim-commentary'
" plugins work with . command
Plug 'tpope/vim-repeat'
" better defaults
Plug 'tpope/vim-unimpaired'
" allow swapping with sub commands
Plug 'tpope/vim-abolish'
" git gutters
Plug 'airblade/vim-gitgutter'
" git integration
Plug 'tpope/vim-fugitive'
" indentation plugin
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gioele/vim-autoswap'
Plug 'projekt0n/github-nvim-theme'

" Initialize plugin system
call plug#end()

colorscheme github_dark_default

" adds mark if over the 80 char limit per line
" call matchadd('ColorColumn', '\%81v', 100)
" autocorrect on tab for commands
set wildmenu
set wildmode=full
set wildignorecase
" colors independent of what terminal you are using
set termguicolors
set hidden
" auto load changes in vim when a file changes
set autoread
" title
set title
set titlestring=
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
set statusline=%n
set statusline+=/%{NrBufs()}
set statusline+=\ %f
set statusline+=%M
set statusline+=%=
set statusline+=\ %2.3v
set statusline+=\ %l/%L
set statusline+=\ %{FugitiveStatusline()}
set laststatus=2
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
" path recursive searching with find
set path+=**
" i have no idea
set whichwrap+=<,>,h,l
set signcolumn=yes
" searches are not case-sensitive anymore
set ignorecase
set smartcase
" line numbers on the side
set number
" cursor always block
set guicursor=i:block
" copy paste integration with OS
set clipboard+=unnamedplus
" history of commands
set history=500
" intuitive visual block
set virtualedit=block
set mouse=a
" spell check
set spell
" syntax highlighting on
syntax on
" ex command current file mapping
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" turns off ex mode
nnoremap Q <NOP>
" braces macro
inoremap {<cr> {<cr>}<esc>O
" easier visual block moving around
xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"

let g:autoswap_detect_tmux = 1

let g:netrw_banner=0
let g:netrw_liststyle=3

" git gutter next chunk
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" space as leader
nmap <SPACE> <leader>
vmap <SPACE> <leader>

" ctags command
command! Maketags :!ctags -R --exclude=.git--exclude=vendor --exclude=node_modules --exclude=db --exclude=log .
" trim command
nnoremap <leader>w :call TrimWhitespace()<cr>
" git mergetool
nnoremap <leader>m :Git mergetool<cr>
" pic macro
nnoremap <leader>p o![]()<left>../pic/
" git addtool
nnoremap <leader>a <C-w>h:q<cr>:Gwrite<cr>:Git difftool --name-status<cr>:vert Gdiff :0<cr><C-w>l
" git difftool
nnoremap <leader>g :!git add -N .<cr>:Git difftool --name-status<cr>:vert Gdiff :0<cr><C-w>l
" markdown
nmap <leader>n :MarkdownPreviewToggle<cr>
nmap <leader>s z=
" look at branches
nnoremap <leader>j :GBranches<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" trim whitespace on save
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

" vim enter keep position
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
au bufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" have rainbow parenthesis
let g:rainbow_active = 1

let g:mkdp_browser = 'chromium'

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

highlight IndentBlanklineContextChar guifg=#00FF00 gui=nocombine

let g:indent_blankline_viewport_buffer = 0
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

autocmd FileType markdown IndentBlanklineDisable

highlight clear SignColumn

autocmd FileType sql iab add         ADD
autocmd FileType sql iab all         ALL
autocmd FileType sql iab alter       ALTER
autocmd FileType sql iab and         AND
autocmd FileType sql iab any         ANY
autocmd FileType sql iab as          AS
autocmd FileType sql iab asc         ASC
autocmd FileType sql iab backup      BACKUP
autocmd FileType sql iab between     BETWEEN
autocmd FileType sql iab by          BY
autocmd FileType sql iab case        CASE
autocmd FileType sql iab check       CHECK
autocmd FileType sql iab column      COLUMN
autocmd FileType sql iab constraint  CONSTRAINT
autocmd FileType sql iab create      CREATE
autocmd FileType sql iab database    DATABASE
autocmd FileType sql iab default     DEFAULT
autocmd FileType sql iab delete      DELETE
autocmd FileType sql iab desc        DESC
autocmd FileType sql iab distinct    DISTINCT
autocmd FileType sql iab drop        DROP
autocmd FileType sql iab exec        EXEC
autocmd FileType sql iab exists      EXISTS
autocmd FileType sql iab foreign     FOREIGN
autocmd FileType sql iab from        FROM
autocmd FileType sql iab full        FULL
autocmd FileType sql iab group       GROUP
autocmd FileType sql iab having      HAVING
autocmd FileType sql iab in          IN
autocmd FileType sql iab index       INDEX
autocmd FileType sql iab inner       INNER
autocmd FileType sql iab insert      INSERT
autocmd FileType sql iab into        INTO
autocmd FileType sql iab is          IS
autocmd FileType sql iab join        JOIN
autocmd FileType sql iab key         KEY
autocmd FileType sql iab left        LEFT
autocmd FileType sql iab like        LIKE
autocmd FileType sql iab limit       LIMIT
autocmd FileType sql iab not         NOT
autocmd FileType sql iab null        NULL
autocmd FileType sql iab or          OR
autocmd FileType sql iab order       ORDER
autocmd FileType sql iab outer       OUTER
autocmd FileType sql iab primary     PRIMARY
autocmd FileType sql iab procedure   PROCEDURE
autocmd FileType sql iab replace     REPLACE
autocmd FileType sql iab right       RIGHT
autocmd FileType sql iab rownum      ROWNUM
autocmd FileType sql iab select      SELECT
autocmd FileType sql iab set         SET
autocmd FileType sql iab table       TABLE
autocmd FileType sql iab top         TOP
autocmd FileType sql iab truncate    TRUNCATE
autocmd FileType sql iab union       UNION
autocmd FileType sql iab unique      UNIQUE
autocmd FileType sql iab update      UPDATE
autocmd FileType sql iab values      VALUES
autocmd FileType sql iab view        VIEW
autocmd FileType sql iab where       WHERE
