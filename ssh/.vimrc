set nocompatible
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_keep_dir=0
let g:netrw_localcopydircmd='cp -r'
let g:netrw_list_hide='\v[\/](build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:ctrlp_custom_ignore='\v[\/](build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:autoswap_detect_tmux = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme="jellybeans"
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_working_path_mode = 'r'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --ignore build --ignore doc --ignore tmp --ignore node_modules --ignore "package-lock.json" --ignore "tags" --ignore "*.class" --ignore "*.png" --ignore "*.jpg" --ignore "*.tar" --ignore "*.gz" --ignore "*.zip" --ignore "*.d" --ignore "*.o" --ignore "*.exe" --ignore "*.so" --ignore "*.dll" --nocolor -g ""'
endif
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
Plug 'ervandew/supertab'
Plug 'gioele/vim-autoswap'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-slash'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()
filetype plugin on
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
set nrformats+=alpha
set ttyfast
set nojoinspaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set encoding=utf-8
set autoindent
set copyindent
set smartindent
set cindent
set scrolloff=6
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
set number
set clipboard^=unnamed,unnamedplus
set virtualedit=block
set history=500
set path+=**
set timeoutlen=1000
set ttimeoutlen=5
set splitbelow
set splitright
set tags=./tags;~
set bg=dark
set undofile
set undolevels=1000
set undoreload=1000
set showcmd
syntax on
nmap <SPACE> <leader>
vmap <SPACE> <leader>
nnoremap <leader>w :call TrimWhitespace()<cr>
nnoremap <leader>t :silent Maketags<cr>:redraw!<cr>
nnoremap <leader>s z=
nnoremap <leader>c ^~
nnoremap <leader>r :grep -F '' **/*.* <left><left><left><left><left><left><left><left><left>
nnoremap <leader>i :setlocal spell!<cr>
nnoremap <leader>m :Git mergetool<cr>
nnoremap <leader>n :MarkdownPreviewToggle<cr>
nnoremap <leader>a <C-w>h:q<cr>:Gwrite<cr>:Git difftool --name-status<cr>:vert Gdiff :0<cr><C-w>l
nnoremap <leader>g :!git add -N .<cr>:Git difftool --name-status<cr>:vert Gdiff :0<cr><C-w>l
nnoremap <leader>j :GBranches<cr>
nnoremap <leader>e :Lexplore<cr>
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
nnoremap Q <Nop>
nnoremap Y y$
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>
nnoremap <down> :bdel<cr>
nnoremap <up> :CtrlPBuffer<cr>
noremap <plug>(slash-after) zz
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
autocmd filetype sql iab absolute          ABSOLUTE
autocmd filetype sql iab action            ACTION
autocmd filetype sql iab add               ADD
autocmd filetype sql iab admin             ADMIN
autocmd filetype sql iab after             AFTER
autocmd filetype sql iab aggregate         AGGREGATE
autocmd filetype sql iab alias             ALIAS
autocmd filetype sql iab all               ALL
autocmd filetype sql iab allocate          ALLOCATE
autocmd filetype sql iab alter             ALTER
autocmd filetype sql iab and               AND
autocmd filetype sql iab any               ANY
autocmd filetype sql iab are               ARE
autocmd filetype sql iab array             ARRAY
autocmd filetype sql iab as                AS
autocmd filetype sql iab asc               ASC
autocmd filetype sql iab assertion         ASSERTION
autocmd filetype sql iab at                AT
autocmd filetype sql iab authorization     AUTHORIZATION
autocmd filetype sql iab backup            BACKUP
autocmd filetype sql iab before            BEFORE
autocmd filetype sql iab begin             BEGIN
autocmd filetype sql iab between           BETWEEN
autocmd filetype sql iab binary            BINARY
autocmd filetype sql iab bit               BIT
autocmd filetype sql iab blob              BLOB
autocmd filetype sql iab boolean           BOOLEAN
autocmd filetype sql iab both              BOTH
autocmd filetype sql iab breadth           BREADTH
autocmd filetype sql iab break             BREAK
autocmd filetype sql iab browse            BROWSE
autocmd filetype sql iab bulk              BULK
autocmd filetype sql iab by                BY
autocmd filetype sql iab call              CALL
autocmd filetype sql iab cascade           CASCADE
autocmd filetype sql iab cascaded          CASCADED
autocmd filetype sql iab case              CASE
autocmd filetype sql iab cast              CAST
autocmd filetype sql iab catalog           CATALOG
autocmd filetype sql iab char              CHAR
autocmd filetype sql iab character         CHARACTER
autocmd filetype sql iab check             CHECK
autocmd filetype sql iab checkpoint        CHECKPOINT
autocmd filetype sql iab class             CLASS
autocmd filetype sql iab clob              CLOB
autocmd filetype sql iab close             CLOSE
autocmd filetype sql iab clustered         CLUSTERED
autocmd filetype sql iab coalesce          COALESCE
autocmd filetype sql iab collate           COLLATE
autocmd filetype sql iab collation         COLLATION
autocmd filetype sql iab column            COLUMN
autocmd filetype sql iab commit            COMMIT
autocmd filetype sql iab completion        COMPLETION
autocmd filetype sql iab compute           COMPUTE
autocmd filetype sql iab connect           CONNECT
autocmd filetype sql iab connection        CONNECTION
autocmd filetype sql iab constraint        CONSTRAINT
autocmd filetype sql iab constraints       CONSTRAINTS
autocmd filetype sql iab constructor       CONSTRUCTOR
autocmd filetype sql iab contains          CONTAINS
autocmd filetype sql iab containstable     CONTAINSTABLE
autocmd filetype sql iab continue          CONTINUE
autocmd filetype sql iab convert           CONVERT
autocmd filetype sql iab corresponding     CORRESPONDING
autocmd filetype sql iab create            CREATE
autocmd filetype sql iab cross             CROSS
autocmd filetype sql iab cube              CUBE
autocmd filetype sql iab current           CURRENT
autocmd filetype sql iab current_date      CURRENT_DATE
autocmd filetype sql iab current_path      CURRENT_PATH
autocmd filetype sql iab current_role      CURRENT_ROLE
autocmd filetype sql iab current_time      CURRENT_TIME
autocmd filetype sql iab current_timestamp CURRENT_TIMESTAMP
autocmd filetype sql iab current_user      CURRENT_USER
autocmd filetype sql iab cursor            CURSOR
autocmd filetype sql iab cycle             CYCLE
autocmd filetype sql iab data              DATA
autocmd filetype sql iab database          DATABASE
autocmd filetype sql iab date              DATE
autocmd filetype sql iab day               DAY
autocmd filetype sql iab dbcc              DBCC
autocmd filetype sql iab deallocate        DEALLOCATE
autocmd filetype sql iab dec               DEC
autocmd filetype sql iab decimal           DECIMAL
autocmd filetype sql iab declare           DECLARE
autocmd filetype sql iab default           DEFAULT
autocmd filetype sql iab deferrable        DEFERRABLE
autocmd filetype sql iab deferred          DEFERRED
autocmd filetype sql iab delete            DELETE
autocmd filetype sql iab deny              DENY
autocmd filetype sql iab depth             DEPTH
autocmd filetype sql iab deref             DEREF
autocmd filetype sql iab desc              DESC
autocmd filetype sql iab describe          DESCRIBE
autocmd filetype sql iab descriptor        DESCRIPTOR
autocmd filetype sql iab destroy           DESTROY
autocmd filetype sql iab destructor        DESTRUCTOR
autocmd filetype sql iab deterministic     DETERMINISTIC
autocmd filetype sql iab diagnostics       DIAGNOSTICS
autocmd filetype sql iab dictionary        DICTIONARY
autocmd filetype sql iab disconnect        DISCONNECT
autocmd filetype sql iab disk              DISK
autocmd filetype sql iab distinct          DISTINCT
autocmd filetype sql iab distributed       DISTRIBUTED
autocmd filetype sql iab domain            DOMAIN
autocmd filetype sql iab double            DOUBLE
autocmd filetype sql iab drop              DROP
autocmd filetype sql iab dummy             DUMMY
autocmd filetype sql iab dump              DUMP
autocmd filetype sql iab dynamic           DYNAMIC
autocmd filetype sql iab each              EACH
autocmd filetype sql iab else              ELSE
autocmd filetype sql iab end               END
autocmd filetype sql iab end               END
autocmd filetype sql iab equals            EQUALS
autocmd filetype sql iab errlvl            ERRLVL
autocmd filetype sql iab escape            ESCAPE
autocmd filetype sql iab every             EVERY
autocmd filetype sql iab except            EXCEPT
autocmd filetype sql iab exception         EXCEPTION
autocmd filetype sql iab exec              EXEC
autocmd filetype sql iab exec              EXEC
autocmd filetype sql iab execute           EXECUTE
autocmd filetype sql iab exists            EXISTS
autocmd filetype sql iab exit              EXIT
autocmd filetype sql iab external          EXTERNAL
autocmd filetype sql iab false             FALSE
autocmd filetype sql iab fetch             FETCH
autocmd filetype sql iab file              FILE
autocmd filetype sql iab fillfactor        FILLFACTOR
autocmd filetype sql iab first             FIRST
autocmd filetype sql iab float             FLOAT
autocmd filetype sql iab for               FOR
autocmd filetype sql iab foreign           FOREIGN
autocmd filetype sql iab found             FOUND
autocmd filetype sql iab free              FREE
autocmd filetype sql iab freetext          FREETEXT
autocmd filetype sql iab freetexttable     FREETEXTTABLE
autocmd filetype sql iab from              FROM
autocmd filetype sql iab full              FULL
autocmd filetype sql iab function          FUNCTION
autocmd filetype sql iab general           GENERAL
autocmd filetype sql iab get               GET
autocmd filetype sql iab global            GLOBAL
autocmd filetype sql iab go                GO
autocmd filetype sql iab goto              GOTO
autocmd filetype sql iab grant             GRANT
autocmd filetype sql iab group             GROUP
autocmd filetype sql iab grouping          GROUPING
autocmd filetype sql iab having            HAVING
autocmd filetype sql iab holdlock          HOLDLOCK
autocmd filetype sql iab host              HOST
autocmd filetype sql iab hour              HOUR
autocmd filetype sql iab identity          IDENTITY
autocmd filetype sql iab identity_insert   IDENTITY_INSERT
autocmd filetype sql iab identitycol       IDENTITYCOL
autocmd filetype sql iab if                IF
autocmd filetype sql iab ignore            IGNORE
autocmd filetype sql iab immediate         IMMEDIATE
autocmd filetype sql iab in                IN
autocmd filetype sql iab index             INDEX
autocmd filetype sql iab indicator         INDICATOR
autocmd filetype sql iab initialize        INITIALIZE
autocmd filetype sql iab initially         INITIALLY
autocmd filetype sql iab inner             INNER
autocmd filetype sql iab inout             INOUT
autocmd filetype sql iab input             INPUT
autocmd filetype sql iab insert            INSERT
autocmd filetype sql iab int               INT
autocmd filetype sql iab integer           INTEGER
autocmd filetype sql iab intersect         INTERSECT
autocmd filetype sql iab interval          INTERVAL
autocmd filetype sql iab into              INTO
autocmd filetype sql iab is                IS
autocmd filetype sql iab isolation         ISOLATION
autocmd filetype sql iab iterate           ITERATE
autocmd filetype sql iab join              JOIN
autocmd filetype sql iab key               KEY
autocmd filetype sql iab kill              KILL
autocmd filetype sql iab language          LANGUAGE
autocmd filetype sql iab large             LARGE
autocmd filetype sql iab last              LAST
autocmd filetype sql iab lateral           LATERAL
autocmd filetype sql iab leading           LEADING
autocmd filetype sql iab left              LEFT
autocmd filetype sql iab less              LESS
autocmd filetype sql iab level             LEVEL
autocmd filetype sql iab like              LIKE
autocmd filetype sql iab limit             LIMIT
autocmd filetype sql iab lineno            LINENO
autocmd filetype sql iab load              LOAD
autocmd filetype sql iab local             LOCAL
autocmd filetype sql iab localtime         LOCALTIME
autocmd filetype sql iab localtimestamp    LOCALTIMESTAMP
autocmd filetype sql iab locator           LOCATOR
autocmd filetype sql iab map               MAP
autocmd filetype sql iab match             MATCH
autocmd filetype sql iab minute            MINUTE
autocmd filetype sql iab modifies          MODIFIES
autocmd filetype sql iab modify            MODIFY
autocmd filetype sql iab module            MODULE
autocmd filetype sql iab month             MONTH
autocmd filetype sql iab names             NAMES
autocmd filetype sql iab national          NATIONAL
autocmd filetype sql iab natural           NATURAL
autocmd filetype sql iab nchar             NCHAR
autocmd filetype sql iab nclob             NCLOB
autocmd filetype sql iab new               NEW
autocmd filetype sql iab next              NEXT
autocmd filetype sql iab no                NO
autocmd filetype sql iab nocheck           NOCHECK
autocmd filetype sql iab nonclustered      NONCLUSTERED
autocmd filetype sql iab none              NONE
autocmd filetype sql iab not               NOT
autocmd filetype sql iab null              NULL
autocmd filetype sql iab nullif            NULLIF
autocmd filetype sql iab numeric           NUMERIC
autocmd filetype sql iab object            OBJECT
autocmd filetype sql iab of                OF
autocmd filetype sql iab off               OFF
autocmd filetype sql iab offsets           OFFSETS
autocmd filetype sql iab old               OLD
autocmd filetype sql iab on                ON
autocmd filetype sql iab only              ONLY
autocmd filetype sql iab open              OPEN
autocmd filetype sql iab opendatasource    OPENDATASOURCE
autocmd filetype sql iab openquery         OPENQUERY
autocmd filetype sql iab openrowset        OPENROWSET
autocmd filetype sql iab openxml           OPENXML
autocmd filetype sql iab operation         OPERATION
autocmd filetype sql iab option            OPTION
autocmd filetype sql iab or                OR
autocmd filetype sql iab order             ORDER
autocmd filetype sql iab ordinality        ORDINALITY
autocmd filetype sql iab out               OUT
autocmd filetype sql iab outer             OUTER
autocmd filetype sql iab output            OUTPUT
autocmd filetype sql iab over              OVER
autocmd filetype sql iab pad               PAD
autocmd filetype sql iab parameter         PARAMETER
autocmd filetype sql iab parameters        PARAMETERS
autocmd filetype sql iab partial           PARTIAL
autocmd filetype sql iab path              PATH
autocmd filetype sql iab percent           PERCENT
autocmd filetype sql iab plan              PLAN
autocmd filetype sql iab postfix           POSTFIX
autocmd filetype sql iab precision         PRECISION
autocmd filetype sql iab prefix            PREFIX
autocmd filetype sql iab preorder          PREORDER
autocmd filetype sql iab prepare           PREPARE
autocmd filetype sql iab preserve          PRESERVE
autocmd filetype sql iab primary           PRIMARY
autocmd filetype sql iab print             PRINT
autocmd filetype sql iab prior             PRIOR
autocmd filetype sql iab privileges        PRIVILEGES
autocmd filetype sql iab proc              PROC
autocmd filetype sql iab procedure         PROCEDURE
autocmd filetype sql iab public            PUBLIC
autocmd filetype sql iab raiserror         RAISERROR
autocmd filetype sql iab read              READ
autocmd filetype sql iab reads             READS
autocmd filetype sql iab readtext          READTEXT
autocmd filetype sql iab real              REAL
autocmd filetype sql iab reconfigure       RECONFIGURE
autocmd filetype sql iab recursive         RECURSIVE
autocmd filetype sql iab ref               REF
autocmd filetype sql iab references        REFERENCES
autocmd filetype sql iab referencing       REFERENCING
autocmd filetype sql iab relative          RELATIVE
autocmd filetype sql iab replication       REPLICATION
autocmd filetype sql iab restore           RESTORE
autocmd filetype sql iab restrict          RESTRICT
autocmd filetype sql iab result            RESULT
autocmd filetype sql iab return            RETURN
autocmd filetype sql iab returns           RETURNS
autocmd filetype sql iab revoke            REVOKE
autocmd filetype sql iab right             RIGHT
autocmd filetype sql iab role              ROLE
autocmd filetype sql iab rollback          ROLLBACK
autocmd filetype sql iab rollup            ROLLUP
autocmd filetype sql iab routine           ROUTINE
autocmd filetype sql iab row               ROW
autocmd filetype sql iab rowcount          ROWCOUNT
autocmd filetype sql iab rowguidcol        ROWGUIDCOL
autocmd filetype sql iab rows              ROWS
autocmd filetype sql iab rule              RULE
autocmd filetype sql iab save              SAVE
autocmd filetype sql iab savepoint         SAVEPOINT
autocmd filetype sql iab schema            SCHEMA
autocmd filetype sql iab scope             SCOPE
autocmd filetype sql iab scroll            SCROLL
autocmd filetype sql iab search            SEARCH
autocmd filetype sql iab second            SECOND
autocmd filetype sql iab section           SECTION
autocmd filetype sql iab select            SELECT
autocmd filetype sql iab sequence          SEQUENCE
autocmd filetype sql iab session           SESSION
autocmd filetype sql iab session_user      SESSION_USER
autocmd filetype sql iab set               SET
autocmd filetype sql iab sets              SETS
autocmd filetype sql iab setuser           SETUSER
autocmd filetype sql iab shutdown          SHUTDOWN
autocmd filetype sql iab size              SIZE
autocmd filetype sql iab smallint          SMALLINT
autocmd filetype sql iab some              SOME
autocmd filetype sql iab space             SPACE
autocmd filetype sql iab specific          SPECIFIC
autocmd filetype sql iab specifictype      SPECIFICTYPE
autocmd filetype sql iab sql               SQL
autocmd filetype sql iab sqlexception      SQLEXCEPTION
autocmd filetype sql iab sqlstate          SQLSTATE
autocmd filetype sql iab sqlwarning        SQLWARNING
autocmd filetype sql iab start             START
autocmd filetype sql iab state             STATE
autocmd filetype sql iab statement         STATEMENT
autocmd filetype sql iab static            STATIC
autocmd filetype sql iab statistics        STATISTICS
autocmd filetype sql iab structure         STRUCTURE
autocmd filetype sql iab system_user       SYSTEM_USER
autocmd filetype sql iab table             TABLE
autocmd filetype sql iab temporary         TEMPORARY
autocmd filetype sql iab terminate         TERMINATE
autocmd filetype sql iab textsize          TEXTSIZE
autocmd filetype sql iab than              THAN
autocmd filetype sql iab then              THEN
autocmd filetype sql iab time              TIME
autocmd filetype sql iab timestamp         TIMESTAMP
autocmd filetype sql iab timezone_hour     TIMEZONE_HOUR
autocmd filetype sql iab timezone_minute   TIMEZONE_MINUTE
autocmd filetype sql iab to                TO
autocmd filetype sql iab top               TOP
autocmd filetype sql iab trailing          TRAILING
autocmd filetype sql iab tran              TRAN
autocmd filetype sql iab transaction       TRANSACTION
autocmd filetype sql iab translation       TRANSLATION
autocmd filetype sql iab treat             TREAT
autocmd filetype sql iab trigger           TRIGGER
autocmd filetype sql iab true              TRUE
autocmd filetype sql iab truncate          TRUNCATE
autocmd filetype sql iab tsequal           TSEQUAL
autocmd filetype sql iab under             UNDER
autocmd filetype sql iab union             UNION
autocmd filetype sql iab unique            UNIQUE
autocmd filetype sql iab unknown           UNKNOWN
autocmd filetype sql iab unnest            UNNEST
autocmd filetype sql iab update            UPDATE
autocmd filetype sql iab updatetext        UPDATETEXT
autocmd filetype sql iab usage             USAGE
autocmd filetype sql iab use               USE
autocmd filetype sql iab user              USER
autocmd filetype sql iab using             USING
autocmd filetype sql iab value             VALUE
autocmd filetype sql iab values            VALUES
autocmd filetype sql iab varchar           VARCHAR
autocmd filetype sql iab variable          VARIABLE
autocmd filetype sql iab varying           VARYING
autocmd filetype sql iab view              VIEW
autocmd filetype sql iab waitfor           WAITFOR
autocmd filetype sql iab when              WHEN
autocmd filetype sql iab whenever          WHENEVER
autocmd filetype sql iab where             WHERE
autocmd filetype sql iab while             WHILE
autocmd filetype sql iab with              WITH
autocmd filetype sql iab without           WITHOUT
autocmd filetype sql iab work              WORK
autocmd filetype sql iab write             WRITE
autocmd filetype sql iab writetext         WRITETEXT
autocmd filetype sql iab year              YEAR
autocmd filetype sql iab zone              ZONE
scriptencoding utf-8

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="codedark"

" Highlighting function (inspiration from https://github.com/chriskempson/base16-vim)
if &t_Co >= 256
    let g:codedark_term256=1
elseif !exists("g:codedark_term256")
    let g:codedark_term256=0
endif
fun! <sid>hi(group, fg, bg, attr, sp)
  if !empty(a:fg)
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . (g:codedark_term256 ? a:fg.cterm256 : a:fg.cterm)
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . (g:codedark_term256 ? a:bg.cterm256 : a:bg.cterm)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if !empty(a:sp)
    exec "hi " . a:group . " guisp=" . a:sp.gui
  endif
endfun

" ------------------
" Color definitions:
" ------------------

" Terminal colors (base16):
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "18"
  let s:cterm02 = "19"
  let s:cterm04 = "20"
  let s:cterm06 = "21"
  let s:cterm09 = "16"
  let s:cterm0F = "17"
else
  let s:cterm01 = "00"
  let s:cterm02 = "08"
  let s:cterm04 = "07"
  let s:cterm06 = "07"
  let s:cterm09 = "06"
  let s:cterm0F = "03"
endif

" General appearance colors:
" (some of them may be unused)

let s:cdNone = {'gui': 'NONE', 'cterm': 'NONE', 'cterm256': 'NONE'}
let s:cdFront = {'gui': '#D4D4D4', 'cterm': s:cterm05, 'cterm256': '188'}
let s:cdBack = {'gui': '#1E1E1E', 'cterm': s:cterm00, 'cterm256': '234'}

let s:cdTabCurrent = {'gui': '#1E1E1E', 'cterm': s:cterm00, 'cterm256': '234'}
let s:cdTabOther = {'gui': '#2D2D2D', 'cterm': s:cterm01, 'cterm256': '236'}
let s:cdTabOutside = {'gui': '#252526', 'cterm': s:cterm01, 'cterm256': '235'}

let s:cdLeftDark = {'gui': '#252526', 'cterm': s:cterm01, 'cterm256': '235'}
let s:cdLeftMid = {'gui': '#373737', 'cterm': s:cterm03, 'cterm256': '237'}
let s:cdLeftLight = {'gui': '#3F3F46', 'cterm': s:cterm03, 'cterm256': '238'}

let s:cdPopupFront = {'gui': '#BBBBBB', 'cterm': s:cterm06, 'cterm256': '250'}
let s:cdPopupBack = {'gui': '#2D2D30', 'cterm': s:cterm01, 'cterm256': '236'}
let s:cdPopupHighlightBlue = {'gui': '#073655', 'cterm': s:cterm0D, 'cterm256': '24'}
let s:cdPopupHighlightGray = {'gui': '#3D3D40', 'cterm': s:cterm03, 'cterm256': '237'}

let s:cdSplitLight = {'gui': '#898989', 'cterm': s:cterm04, 'cterm256': '245'}
let s:cdSplitDark = {'gui': '#444444', 'cterm': s:cterm03, 'cterm256': '238'}
let s:cdSplitThumb = {'gui': '#424242', 'cterm': s:cterm04, 'cterm256': '238'}

let s:cdCursorDarkDark = {'gui': '#222222', 'cterm': s:cterm01, 'cterm256': '235'}
let s:cdCursorDark = {'gui': '#51504F', 'cterm': s:cterm03, 'cterm256': '239'}
let s:cdCursorLight = {'gui': '#AEAFAD', 'cterm': s:cterm04, 'cterm256': '145'}
let s:cdSelection = {'gui': '#264F78', 'cterm': s:cterm03, 'cterm256': '24'}
let s:cdLineNumber = {'gui': '#5A5A5A', 'cterm': s:cterm04, 'cterm256': '240'}

let s:cdDiffRedDark = {'gui': '#4B1818', 'cterm': s:cterm08, 'cterm256': '52'}
let s:cdDiffRedLight = {'gui': '#6F1313', 'cterm': s:cterm08, 'cterm256': '52'}
let s:cdDiffRedLightLight = {'gui': '#FB0101', 'cterm': s:cterm08, 'cterm256': '09'}
let s:cdDiffGreenDark = {'gui': '#373D29', 'cterm': s:cterm0B, 'cterm256': '237'}
let s:cdDiffGreenLight = {'gui': '#4B5632', 'cterm': s:cterm09, 'cterm256': '58'}

let s:cdSearchCurrent = {'gui': '#49545F', 'cterm': s:cterm09, 'cterm256': '239'}
let s:cdSearch = {'gui': '#4C4E50', 'cterm': s:cterm0A, 'cterm256': '239'}

" Syntax colors:

if !exists("g:codedark_conservative")
    let g:codedark_conservative=0
endif

let s:cdGray = {'gui': '#808080', 'cterm': s:cterm04, 'cterm256': '08'}
let s:cdViolet = {'gui': '#646695', 'cterm': s:cterm04, 'cterm256': '60'}
let s:cdBlue = {'gui': '#569CD6', 'cterm': s:cterm0D, 'cterm256': '75'}
let s:cdDarkBlue = {'gui': '#223E55', 'cterm': s:cterm0D, 'cterm256': '73'}
let s:cdLightBlue = {'gui': '#9CDCFE', 'cterm': s:cterm0C, 'cterm256': '117'}
if g:codedark_conservative | let s:cdLightBlue = s:cdFront | endif
let s:cdGreen = {'gui': '#608B4E', 'cterm': s:cterm0B, 'cterm256': '65'}
let s:cdBlueGreen = {'gui': '#4EC9B0', 'cterm': s:cterm0F, 'cterm256': '43'}
let s:cdLightGreen = {'gui': '#B5CEA8', 'cterm': s:cterm09, 'cterm256': '151'}
let s:cdRed = {'gui': '#F44747', 'cterm': s:cterm08, 'cterm256': '203'}
let s:cdOrange = {'gui': '#CE9178', 'cterm': s:cterm0F, 'cterm256': '173'}
let s:cdLightRed = {'gui': '#D16969', 'cterm': s:cterm08, 'cterm256': '167'}
if g:codedark_conservative | let s:cdLightRed = s:cdOrange | endif
let s:cdYellowOrange = {'gui': '#D7BA7D', 'cterm': s:cterm0A, 'cterm256': '179'}
let s:cdYellow = {'gui': '#DCDCAA', 'cterm': s:cterm0A, 'cterm256': '187'}
if g:codedark_conservative | let s:cdYellow = s:cdFront | endif
let s:cdPink = {'gui': '#C586C0', 'cterm': s:cterm0E, 'cterm256': '176'}
if g:codedark_conservative | let s:cdPink = s:cdBlue | endif

" Vim editor colors
"    <sid>hi(GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE, SPECIAL)
call <sid>hi('Normal', s:cdFront, s:cdBack, 'none', {})
call <sid>hi('ColorColumn', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('Cursor', s:cdCursorDark, s:cdCursorLight, 'none', {})
call <sid>hi('CursorLine', {}, s:cdCursorDarkDark, 'none', {})
call <sid>hi('Directory', s:cdBlue, s:cdBack, 'none', {})
call <sid>hi('DiffAdd', {}, s:cdDiffGreenDark, 'none', {})
call <sid>hi('DiffChange', {}, s:cdDiffRedDark, 'none', {})
call <sid>hi('DiffDelete', {}, s:cdDiffRedLight, 'none', {})
call <sid>hi('DiffText', {}, s:cdDiffRedLight, 'none', {})
call <sid>hi('EndOfBuffer', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('ErrorMsg', s:cdRed, s:cdBack, 'none', {})
call <sid>hi('VertSplit', s:cdSplitDark, s:cdBack, 'none', {})
call <sid>hi('Folded', s:cdLeftLight, s:cdLeftDark, 'underline', {})
call <sid>hi('FoldColumn', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('SignColumn', {}, s:cdBack, 'none', {})
call <sid>hi('IncSearch', s:cdNone, s:cdSearchCurrent, 'none', {})
call <sid>hi('LineNr', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('CursorLineNr', s:cdPopupFront, s:cdBack, 'none', {})
call <sid>hi('MatchParen', s:cdNone, s:cdCursorDark, 'none', {})
call <sid>hi('ModeMsg', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('MoreMsg', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('NonText', s:cdLineNumber, s:cdBack, 'none', {})
call <sid>hi('Pmenu', s:cdPopupFront, s:cdPopupBack, 'none', {})
call <sid>hi('PmenuSel', s:cdPopupFront, s:cdPopupHighlightBlue, 'none', {})
call <sid>hi('PmenuSbar', {}, s:cdPopupHighlightGray, 'none', {})
call <sid>hi('PmenuThumb', {}, s:cdPopupFront, 'none', {})
call <sid>hi('Question', s:cdBlue, s:cdBack, 'none', {})
call <sid>hi('Search', s:cdNone, s:cdSearch, 'none', {})
call <sid>hi('SpecialKey', s:cdBlue, s:cdNone, 'none', {})
call <sid>hi('SpellBad', s:cdNone, s:cdNone, 'undercurl', {})
call <sid>hi('SpellCap', s:cdNone, s:cdNone, 'undercurl', {})
call <sid>hi('SpellLocal', s:cdNone, s:cdNone, 'undercurl', {})
call <sid>hi('StatusLine', s:cdFront, s:cdLeftMid, 'none', {})
call <sid>hi('StatusLineNC', s:cdFront, s:cdLeftDark, 'none', {})
call <sid>hi('TabLine', s:cdFront, s:cdTabOther, 'none', {})
call <sid>hi('TabLineFill', s:cdFront, s:cdTabOutside, 'none', {})
call <sid>hi('TabLineSel', s:cdFront, s:cdTabCurrent, 'none', {})
call <sid>hi('Title', s:cdNone, s:cdNone, 'bold', {})
call <sid>hi('Visual', s:cdNone, s:cdSelection, 'none', {})
call <sid>hi('VisualNOS', s:cdNone, s:cdSelection, 'none', {})
call <sid>hi('WarningMsg', s:cdOrange, s:cdBack, 'none', {})
call <sid>hi('WildMenu', s:cdNone, s:cdSelection, 'none', {})

call <sid>hi('Comment', s:cdGreen, {}, 'none', {})

call <sid>hi('Constant', s:cdBlue, {}, 'none', {})
call <sid>hi('String', s:cdOrange, {}, 'none', {})
call <sid>hi('Character', s:cdOrange, {}, 'none', {})
call <sid>hi('Number', s:cdLightGreen, {}, 'none', {})
call <sid>hi('Boolean', s:cdBlue, {}, 'none', {})
call <sid>hi('Float', s:cdLightGreen, {}, 'none', {})

call <sid>hi('Identifier', s:cdLightBlue, {}, 'none', {})
call <sid>hi('Function', s:cdYellow, {}, 'none', {})

call <sid>hi('Statement', s:cdPink, {}, 'none', {})
call <sid>hi('Conditional', s:cdPink, {}, 'none', {})
call <sid>hi('Repeat', s:cdPink, {}, 'none', {})
call <sid>hi('Label', s:cdPink, {}, 'none', {})
call <sid>hi('Operator', s:cdFront, {}, 'none', {})
call <sid>hi('Keyword', s:cdPink, {}, 'none', {})
call <sid>hi('pythonOperator', s:cdPink, {}, 'none', {})
call <sid>hi('Exception', s:cdPink, {}, 'none', {})

call <sid>hi('PreProc', s:cdPink, {}, 'none', {})
call <sid>hi('Include', s:cdPink, {}, 'none', {})
call <sid>hi('Define', s:cdPink, {}, 'none', {})
call <sid>hi('Macro', s:cdPink, {}, 'none', {})
call <sid>hi('PreCondit', s:cdPink, {}, 'none', {})

call <sid>hi('Type', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('StorageClass', s:cdBlue, {}, 'none', {})
call <sid>hi('Structure', s:cdBlue, {}, 'none', {})
call <sid>hi('Typedef', s:cdBlue, {}, 'none', {})

call <sid>hi('Special', s:cdFront, {}, 'none', {})
call <sid>hi('SpecialChar', s:cdFront, {}, 'none', {})
call <sid>hi('Tag', s:cdFront, {}, 'none', {})
call <sid>hi('Delimiter', s:cdFront, {}, 'none', {})
call <sid>hi('SpecialComment', s:cdGreen, {}, 'none', {})
call <sid>hi('Debug', s:cdFront, {}, 'none', {})

call <sid>hi('Underlined', s:cdNone, {}, 'underline', {})
call <sid>hi("Conceal", s:cdFront, s:cdBack, 'none', {})

call <sid>hi('Ignore', s:cdFront, {}, 'none', {})

call <sid>hi('Error', s:cdRed, {}, 'undercurl', s:cdRed)

call <sid>hi('Todo', s:cdNone, s:cdLeftMid, 'none', {})

" HTML:
call <sid>hi('htmlTag', s:cdGray, {}, 'none', {})
call <sid>hi('htmlEndTag', s:cdGray, {}, 'none', {})
call <sid>hi('htmlTagName', s:cdBlue, {}, 'none', {})
call <sid>hi('htmlSpecialTagName', s:cdBlue, {}, 'none', {})
call <sid>hi('htmlArg', s:cdLightBlue, {}, 'none', {})

" CSS:
call <sid>hi('cssBraces', s:cdFront, {}, 'none', {})
call <sid>hi('cssInclude', s:cdPink, {}, 'none', {})
call <sid>hi('cssTagName', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('cssClassName', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('cssPseudoClass', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('cssPseudoClassId', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('cssPseudoClassLang', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('cssIdentifier', s:cdYellowOrange, {}, 'none', {})
call <sid>hi('cssProp', s:cdLightBlue, {}, 'none', {})
call <sid>hi('cssDefinition', s:cdLightBlue, {}, 'none', {})
call <sid>hi('cssAttr', s:cdOrange, {}, 'none', {})
call <sid>hi('cssAttrRegion', s:cdOrange, {}, 'none', {})
call <sid>hi('cssColor', s:cdOrange, {}, 'none', {})
call <sid>hi('cssFunction', s:cdOrange, {}, 'none', {})
call <sid>hi('cssFunctionName', s:cdOrange, {}, 'none', {})
call <sid>hi('cssVendor', s:cdOrange, {}, 'none', {})
call <sid>hi('cssValueNumber', s:cdOrange, {}, 'none', {})
call <sid>hi('cssValueLength', s:cdOrange, {}, 'none', {})
call <sid>hi('cssUnitDecorators', s:cdOrange, {}, 'none', {})

" JavaScript:
call <sid>hi('jsVariableDef', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsFuncArgs', s:cdLightBlue, {}, 'none', {})
call <sid>hi('jsRegexpString', s:cdLightRed, {}, 'none', {})
call <sid>hi('jsThis', s:cdBlue, {}, 'none', {})

" Ruby:
call <sid>hi('rubyClassNameTag', s:cdBlueGreen, {}, 'none', {})

" Golang:
call <sid>hi('goPackage', s:cdBlue, {}, 'none', {})
call <sid>hi('goImport', s:cdBlue, {}, 'none', {})
call <sid>hi('goVar', s:cdBlue, {}, 'none', {})
call <sid>hi('goConst', s:cdBlue, {}, 'none', {})
call <sid>hi('goStatement', s:cdPink, {}, 'none', {})
call <sid>hi('goType', s:cdBlue, {}, 'none', {})
call <sid>hi('goSignedInts', s:cdBlue, {}, 'none', {})
call <sid>hi('goUnsignedInts', s:cdBlue, {}, 'none', {})
call <sid>hi('goFloats', s:cdBlue, {}, 'none', {})
call <sid>hi('goComplexes', s:cdBlue, {}, 'none', {})
call <sid>hi('goBuiltins', s:cdYellow, {}, 'none', {})
call <sid>hi('goBoolean', s:cdBlue, {}, 'none', {})
call <sid>hi('goPredefinedIdentifiers', s:cdBlue, {}, 'none', {})
call <sid>hi('goTodo', s:cdGreen, {}, 'none', {})
call <sid>hi('goDeclaration', s:cdBlue, {}, 'none', {})
call <sid>hi('goDeclType', s:cdBlue, {}, 'none', {})
call <sid>hi('goTypeDecl', s:cdBlue, {}, 'none', {})
call <sid>hi('goTypeName', s:cdBlueGreen, {}, 'none', {})
call <sid>hi('goVarAssign', s:cdLightBlue, {}, 'none', {})
call <sid>hi('goVarDefs', s:cdLightBlue, {}, 'none', {})
call <sid>hi('goReceiver', s:cdFront, {}, 'none', {})
call <sid>hi('goReceiverType', s:cdDarkBlue, {}, 'none', {})
call <sid>hi('goFunctionCall', s:cdYellow, {}, 'none', {})
call <sid>hi('goMethodCall', s:cdYellow, {}, 'none', {})
call <sid>hi('goSingleDecl', s:cdLightBlue, {}, 'none', {})

highlight MatchParen cterm=none ctermbg=gray ctermfg=Black
highlight DiffAdd guibg=#006400
highlight DiffText guibg=#666600
highlight DiffChange guibg=#1E1E1E
highlight Pmenu ctermfg=black ctermbg=gray
highlight PmenuSel ctermfg=black ctermbg=yellow
highlight CursorLine cterm=NONE ctermbg=black ctermfg=yellow guibg=black guifg=yellow
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=yellow guibg=black guifg=yellow
