set nocompatible
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_keep_dir=0
let g:netrw_localcopydircmd='cp -r'
let g:netrw_list_hide='\v[\/](build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:ctrlp_custom_ignore='\v[\/](build|doc|tmp|node_modules)|\v(package-lock.json)$|(\v\.(class|png|jpg|tar|gz|zip|d|o|exe|so|dll)$)'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
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
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'mhartington/oceanic-next'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'spolu/dwm.vim'
call plug#end()
colorscheme OceanicNext
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
set laststatus=0
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
syntax on
highlight SpellBad cterm=underline ctermbg=NONE ctermfg=yellow
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
nmap <SPACE> <leader>
vmap <SPACE> <leader>
nnoremap <leader>w :call TrimWhitespace()<cr>
nnoremap <leader>l :call Format()<cr>
nnoremap <leader>t :silent Maketags<cr>:redraw!<cr>
nnoremap <leader>r :grep -F '' **/*.* <left><left><left><left><left><left><left><left><left>
nnoremap <leader>i :setlocal spell!<cr>
nnoremap <leader>n :MarkdownPreviewToggle<cr>
nnoremap <leader>e :Lexplore<cr>
nnoremap <leader>b :source $MYVIMRC<cr>
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
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
nnoremap [b :bp<cr>
nnoremap ]b :bn<cr>
nnoremap [B :bfirst<cr>
nnoremap ]B :blast<cr>
nnoremap [q :cp<cr>
nnoremap ]q :cn<cr>
nnoremap [Q :cfirst<cr>
nnoremap ]Q :clast<cr>
nnoremap [t :tprevious<cr>
nnoremap ]t :tnext<cr>
nnoremap [T :tfirst<cr>
nnoremap ]T :tlast<cr>
nnoremap Q <Nop>
nnoremap gh :nohls<cr><c-g>
nnoremap Y y$
nnoremap S ^C
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
autocmd filetype sql iab a                      A
autocmd filetype sql iab abort                  ABORT
autocmd filetype sql iab abs                    ABS
autocmd filetype sql iab absolute               ABSOLUTE
autocmd filetype sql iab access                 ACCESS
autocmd filetype sql iab action                 ACTION
autocmd filetype sql iab ada                    ADA
autocmd filetype sql iab add                    ADD
autocmd filetype sql iab admin                  ADMIN
autocmd filetype sql iab after                  AFTER
autocmd filetype sql iab aggregate              AGGREGATE
autocmd filetype sql iab alias                  ALIAS
autocmd filetype sql iab all                    ALL
autocmd filetype sql iab allocate               ALLOCATE
autocmd filetype sql iab also                   ALSO
autocmd filetype sql iab alter                  ALTER
autocmd filetype sql iab always                 ALWAYS
autocmd filetype sql iab analyse                ANALYSE
autocmd filetype sql iab analyze                ANALYZE
autocmd filetype sql iab and                    AND
autocmd filetype sql iab any                    ANY
autocmd filetype sql iab are                    ARE
autocmd filetype sql iab array                  ARRAY
autocmd filetype sql iab as                     AS
autocmd filetype sql iab asc                    ASC
autocmd filetype sql iab asensitive             ASENSITIVE
autocmd filetype sql iab assertion              ASSERTION
autocmd filetype sql iab assignment             ASSIGNMENT
autocmd filetype sql iab asymmetric             ASYMMETRIC
autocmd filetype sql iab at                     AT
autocmd filetype sql iab atomic                 ATOMIC
autocmd filetype sql iab attribute              ATTRIBUTE
autocmd filetype sql iab attributes             ATTRIBUTES
autocmd filetype sql iab audit                  AUDIT
autocmd filetype sql iab authorization          AUTHORIZATION
autocmd filetype sql iab auto_increment         AUTO_INCREMENT
autocmd filetype sql iab avg                    AVG
autocmd filetype sql iab avg_row_length         AVG_ROW_LENGTH
autocmd filetype sql iab backup                 BACKUP
autocmd filetype sql iab backward               BACKWARD
autocmd filetype sql iab before                 BEFORE
autocmd filetype sql iab begin                  BEGIN
autocmd filetype sql iab bernoulli              BERNOULLI
autocmd filetype sql iab between                BETWEEN
autocmd filetype sql iab bigint                 BIGINT
autocmd filetype sql iab binary                 BINARY
autocmd filetype sql iab bit                    BIT
autocmd filetype sql iab bit_length             BIT_LENGTH
autocmd filetype sql iab bitvar                 BITVAR
autocmd filetype sql iab blob                   BLOB
autocmd filetype sql iab bool                   BOOL
autocmd filetype sql iab boolean                BOOLEAN
autocmd filetype sql iab both                   BOTH
autocmd filetype sql iab breadth                BREADTH
autocmd filetype sql iab break                  BREAK
autocmd filetype sql iab browse                 BROWSE
autocmd filetype sql iab bulk                   BULK
autocmd filetype sql iab by                     BY
autocmd filetype sql iab c                      C
autocmd filetype sql iab cache                  CACHE
autocmd filetype sql iab call                   CALL
autocmd filetype sql iab called                 CALLED
autocmd filetype sql iab cardinality            CARDINALITY
autocmd filetype sql iab cascade                CASCADE
autocmd filetype sql iab cascaded               CASCADED
autocmd filetype sql iab case                   CASE
autocmd filetype sql iab cast                   CAST
autocmd filetype sql iab catalog                CATALOG
autocmd filetype sql iab catalog_name           CATALOG_NAME
autocmd filetype sql iab ceil                   CEIL
autocmd filetype sql iab ceiling                CEILING
autocmd filetype sql iab chain                  CHAIN
autocmd filetype sql iab change                 CHANGE
autocmd filetype sql iab char                   CHAR
autocmd filetype sql iab char_length            CHAR_LENGTH
autocmd filetype sql iab character              CHARACTER
autocmd filetype sql iab character_length       CHARACTER_LENGTH
autocmd filetype sql iab character_set_catalog  CHARACTER_SET_CATALOG
autocmd filetype sql iab character_set_name     CHARACTER_SET_NAME
autocmd filetype sql iab character_set_schema   CHARACTER_SET_SCHEMA
autocmd filetype sql iab characteristics        CHARACTERISTICS
autocmd filetype sql iab characters             CHARACTERS
autocmd filetype sql iab check                  CHECK
autocmd filetype sql iab checked                CHECKED
autocmd filetype sql iab checkpoint             CHECKPOINT
autocmd filetype sql iab checksum               CHECKSUM
autocmd filetype sql iab class                  CLASS
autocmd filetype sql iab class_origin           CLASS_ORIGIN
autocmd filetype sql iab clob                   CLOB
autocmd filetype sql iab close                  CLOSE
autocmd filetype sql iab cluster                CLUSTER
autocmd filetype sql iab clustered              CLUSTERED
autocmd filetype sql iab coalesce               COALESCE
autocmd filetype sql iab cobol                  COBOL
autocmd filetype sql iab collate                COLLATE
autocmd filetype sql iab collation              COLLATION
autocmd filetype sql iab collation_catalog      COLLATION_CATALOG
autocmd filetype sql iab collation_name         COLLATION_NAME
autocmd filetype sql iab collation_schema       COLLATION_SCHEMA
autocmd filetype sql iab collect                COLLECT
autocmd filetype sql iab column                 COLUMN
autocmd filetype sql iab column_name            COLUMN_NAME
autocmd filetype sql iab columns                COLUMNS
autocmd filetype sql iab command_function       COMMAND_FUNCTION
autocmd filetype sql iab command_function_code  COMMAND_FUNCTION_CODE
autocmd filetype sql iab comment                COMMENT
autocmd filetype sql iab commit                 COMMIT
autocmd filetype sql iab committed              COMMITTED
autocmd filetype sql iab completion             COMPLETION
autocmd filetype sql iab compress               COMPRESS
autocmd filetype sql iab compute                COMPUTE
autocmd filetype sql iab condition              CONDITION
autocmd filetype sql iab condition_number       CONDITION_NUMBER
autocmd filetype sql iab connect                CONNECT
autocmd filetype sql iab connection             CONNECTION
autocmd filetype sql iab connection_name        CONNECTION_NAME
autocmd filetype sql iab constraint             CONSTRAINT
autocmd filetype sql iab constraint_catalog     CONSTRAINT_CATALOG
autocmd filetype sql iab constraint_name        CONSTRAINT_NAME
autocmd filetype sql iab constraint_schema      CONSTRAINT_SCHEMA
autocmd filetype sql iab constraints            CONSTRAINTS
autocmd filetype sql iab constructor            CONSTRUCTOR
autocmd filetype sql iab contains               CONTAINS
autocmd filetype sql iab containstable          CONTAINSTABLE
autocmd filetype sql iab continue               CONTINUE
autocmd filetype sql iab conversion             CONVERSION
autocmd filetype sql iab convert                CONVERT
autocmd filetype sql iab copy                   COPY
autocmd filetype sql iab corr                   CORR
autocmd filetype sql iab corresponding          CORRESPONDING
autocmd filetype sql iab count                  COUNT
autocmd filetype sql iab covar_pop              COVAR_POP
autocmd filetype sql iab covar_samp             COVAR_SAMP
autocmd filetype sql iab create                 CREATE
autocmd filetype sql iab createdb               CREATEDB
autocmd filetype sql iab createrole             CREATEROLE
autocmd filetype sql iab createuser             CREATEUSER
autocmd filetype sql iab cross                  CROSS
autocmd filetype sql iab csv                    CSV
autocmd filetype sql iab cube                   CUBE
autocmd filetype sql iab cume_dist              CUME_DIST
autocmd filetype sql iab current                CURRENT
autocmd filetype sql iab current_date           CURRENT_DATE
autocmd filetype sql iab current_path           CURRENT_PATH
autocmd filetype sql iab current_role           CURRENT_ROLE
autocmd filetype sql iab current_time           CURRENT_TIME
autocmd filetype sql iab current_timestamp      CURRENT_TIMESTAMP
autocmd filetype sql iab current_user           CURRENT_USER
autocmd filetype sql iab cursor                 CURSOR
autocmd filetype sql iab cursor_name            CURSOR_NAME
autocmd filetype sql iab cycle                  CYCLE
autocmd filetype sql iab data                   DATA
autocmd filetype sql iab database               DATABASE
autocmd filetype sql iab databases              DATABASES
autocmd filetype sql iab date                   DATE
autocmd filetype sql iab datetime               DATETIME
autocmd filetype sql iab datetime_interval_code DATETIME_INTERVAL_CODE
autocmd filetype sql iab day                    DAY
autocmd filetype sql iab day_hour               DAY_HOUR
autocmd filetype sql iab day_microsecond        DAY_MICROSECOND
autocmd filetype sql iab day_minute             DAY_MINUTE
autocmd filetype sql iab day_second             DAY_SECOND
autocmd filetype sql iab dayofmonth             DAYOFMONTH
autocmd filetype sql iab dayofweek              DAYOFWEEK
autocmd filetype sql iab dayofyear              DAYOFYEAR
autocmd filetype sql iab dbcc                   DBCC
autocmd filetype sql iab deallocate             DEALLOCATE
autocmd filetype sql iab dec                    DEC
autocmd filetype sql iab decimal                DECIMAL
autocmd filetype sql iab declare                DECLARE
autocmd filetype sql iab default                DEFAULT
autocmd filetype sql iab defaults               DEFAULTS
autocmd filetype sql iab deferrable             DEFERRABLE
autocmd filetype sql iab deferred               DEFERRED
autocmd filetype sql iab defined                DEFINED
autocmd filetype sql iab definer                DEFINER
autocmd filetype sql iab degree                 DEGREE
autocmd filetype sql iab delay_key_write        DELAY_KEY_WRITE
autocmd filetype sql iab delayed                DELAYED
autocmd filetype sql iab delete                 DELETE
autocmd filetype sql iab delimiter              DELIMITER
autocmd filetype sql iab delimiters             DELIMITERS
autocmd filetype sql iab dense_rank             DENSE_RANK
autocmd filetype sql iab deny                   DENY
autocmd filetype sql iab depth                  DEPTH
autocmd filetype sql iab deref                  DEREF
autocmd filetype sql iab derived                DERIVED
autocmd filetype sql iab desc                   DESC
autocmd filetype sql iab describe               DESCRIBE
autocmd filetype sql iab descriptor             DESCRIPTOR
autocmd filetype sql iab destroy                DESTROY
autocmd filetype sql iab destructor             DESTRUCTOR
autocmd filetype sql iab deterministic          DETERMINISTIC
autocmd filetype sql iab diagnostics            DIAGNOSTICS
autocmd filetype sql iab dictionary             DICTIONARY
autocmd filetype sql iab disable                DISABLE
autocmd filetype sql iab disconnect             DISCONNECT
autocmd filetype sql iab disk                   DISK
autocmd filetype sql iab dispatch               DISPATCH
autocmd filetype sql iab distinct               DISTINCT
autocmd filetype sql iab distinctrow            DISTINCTROW
autocmd filetype sql iab distributed            DISTRIBUTED
autocmd filetype sql iab div                    DIV
autocmd filetype sql iab do                     DO
autocmd filetype sql iab domain                 DOMAIN
autocmd filetype sql iab double                 DOUBLE
autocmd filetype sql iab drop                   DROP
autocmd filetype sql iab dual                   DUAL
autocmd filetype sql iab dummy                  DUMMY
autocmd filetype sql iab dump                   DUMP
autocmd filetype sql iab dynamic                DYNAMIC
autocmd filetype sql iab dynamic_function       DYNAMIC_FUNCTION
autocmd filetype sql iab dynamic_function_code  DYNAMIC_FUNCTION_CODE
autocmd filetype sql iab each                   EACH
autocmd filetype sql iab element                ELEMENT
autocmd filetype sql iab else                   ELSE
autocmd filetype sql iab elseif                 ELSEIF
autocmd filetype sql iab enable                 ENABLE
autocmd filetype sql iab enclosed               ENCLOSED
autocmd filetype sql iab encoding               ENCODING
autocmd filetype sql iab encrypted              ENCRYPTED
autocmd filetype sql iab end                    END
autocmd filetype sql iab end-exec               END-EXEC
autocmd filetype sql iab enum                   ENUM
autocmd filetype sql iab equals                 EQUALS
autocmd filetype sql iab errlvl                 ERRLVL
autocmd filetype sql iab escape                 ESCAPE
autocmd filetype sql iab escaped                ESCAPED
autocmd filetype sql iab every                  EVERY
autocmd filetype sql iab except                 EXCEPT
autocmd filetype sql iab exception              EXCEPTION
autocmd filetype sql iab exclude                EXCLUDE
autocmd filetype sql iab excluding              EXCLUDING
autocmd filetype sql iab exclusive              EXCLUSIVE
autocmd filetype sql iab exec                   EXEC
autocmd filetype sql iab execute                EXECUTE
autocmd filetype sql iab existing               EXISTING
autocmd filetype sql iab exists                 EXISTS
autocmd filetype sql iab exit                   EXIT
autocmd filetype sql iab exp                    EXP
autocmd filetype sql iab explain                EXPLAIN
autocmd filetype sql iab external               EXTERNAL
autocmd filetype sql iab extract                EXTRACT
autocmd filetype sql iab false                  FALSE
autocmd filetype sql iab fetch                  FETCH
autocmd filetype sql iab fields                 FIELDS
autocmd filetype sql iab file                   FILE
autocmd filetype sql iab fillfactor             FILLFACTOR
autocmd filetype sql iab filter                 FILTER
autocmd filetype sql iab final                  FINAL
autocmd filetype sql iab first                  FIRST
autocmd filetype sql iab float                  FLOAT
autocmd filetype sql iab float4                 FLOAT4
autocmd filetype sql iab float8                 FLOAT8
autocmd filetype sql iab floor                  FLOOR
autocmd filetype sql iab flush                  FLUSH
autocmd filetype sql iab following              FOLLOWING
autocmd filetype sql iab for                    FOR
autocmd filetype sql iab force                  FORCE
autocmd filetype sql iab foreign                FOREIGN
autocmd filetype sql iab fortran                FORTRAN
autocmd filetype sql iab forward                FORWARD
autocmd filetype sql iab found                  FOUND
autocmd filetype sql iab free                   FREE
autocmd filetype sql iab freetext               FREETEXT
autocmd filetype sql iab freetexttable          FREETEXTTABLE
autocmd filetype sql iab freeze                 FREEZE
autocmd filetype sql iab from                   FROM
autocmd filetype sql iab full                   FULL
autocmd filetype sql iab fulltext               FULLTEXT
autocmd filetype sql iab function               FUNCTION
autocmd filetype sql iab fusion                 FUSION
autocmd filetype sql iab g                      G
autocmd filetype sql iab general                GENERAL
autocmd filetype sql iab generated              GENERATED
autocmd filetype sql iab get                    GET
autocmd filetype sql iab global                 GLOBAL
autocmd filetype sql iab go                     GO
autocmd filetype sql iab goto                   GOTO
autocmd filetype sql iab grant                  GRANT
autocmd filetype sql iab granted                GRANTED
autocmd filetype sql iab grants                 GRANTS
autocmd filetype sql iab greatest               GREATEST
autocmd filetype sql iab group                  GROUP
autocmd filetype sql iab grouping               GROUPING
autocmd filetype sql iab handler                HANDLER
autocmd filetype sql iab having                 HAVING
autocmd filetype sql iab header                 HEADER
autocmd filetype sql iab heap                   HEAP
autocmd filetype sql iab hierarchy              HIERARCHY
autocmd filetype sql iab high_priority          HIGH_PRIORITY
autocmd filetype sql iab hold                   HOLD
autocmd filetype sql iab holdlock               HOLDLOCK
autocmd filetype sql iab host                   HOST
autocmd filetype sql iab hosts                  HOSTS
autocmd filetype sql iab hour                   HOUR
autocmd filetype sql iab hour_microsecond       HOUR_MICROSECOND
autocmd filetype sql iab hour_minute            HOUR_MINUTE
autocmd filetype sql iab hour_second            HOUR_SECOND
autocmd filetype sql iab identified             IDENTIFIED
autocmd filetype sql iab identity               IDENTITY
autocmd filetype sql iab identity_insert        IDENTITY_INSERT
autocmd filetype sql iab identitycol            IDENTITYCOL
autocmd filetype sql iab if                     IF
autocmd filetype sql iab ignore                 IGNORE
autocmd filetype sql iab ilike                  ILIKE
autocmd filetype sql iab immediate              IMMEDIATE
autocmd filetype sql iab immutable              IMMUTABLE
autocmd filetype sql iab implementation         IMPLEMENTATION
autocmd filetype sql iab implicit               IMPLICIT
autocmd filetype sql iab in                     IN
autocmd filetype sql iab include                INCLUDE
autocmd filetype sql iab including              INCLUDING
autocmd filetype sql iab increment              INCREMENT
autocmd filetype sql iab index                  INDEX
autocmd filetype sql iab indicator              INDICATOR
autocmd filetype sql iab infile                 INFILE
autocmd filetype sql iab infix                  INFIX
autocmd filetype sql iab inherit                INHERIT
autocmd filetype sql iab inherits               INHERITS
autocmd filetype sql iab initial                INITIAL
autocmd filetype sql iab initialize             INITIALIZE
autocmd filetype sql iab initially              INITIALLY
autocmd filetype sql iab inner                  INNER
autocmd filetype sql iab inout                  INOUT
autocmd filetype sql iab input                  INPUT
autocmd filetype sql iab insensitive            INSENSITIVE
autocmd filetype sql iab insert                 INSERT
autocmd filetype sql iab insert_id              INSERT_ID
autocmd filetype sql iab instance               INSTANCE
autocmd filetype sql iab instantiable           INSTANTIABLE
autocmd filetype sql iab instead                INSTEAD
autocmd filetype sql iab int                    INT
autocmd filetype sql iab int1                   INT1
autocmd filetype sql iab int2                   INT2
autocmd filetype sql iab int3                   INT3
autocmd filetype sql iab int4                   INT4
autocmd filetype sql iab int8                   INT8
autocmd filetype sql iab integer                INTEGER
autocmd filetype sql iab intersect              INTERSECT
autocmd filetype sql iab intersection           INTERSECTION
autocmd filetype sql iab interval               INTERVAL
autocmd filetype sql iab into                   INTO
autocmd filetype sql iab invoker                INVOKER
autocmd filetype sql iab is                     IS
autocmd filetype sql iab isam                   ISAM
autocmd filetype sql iab isnull                 ISNULL
autocmd filetype sql iab isolation              ISOLATION
autocmd filetype sql iab iterate                ITERATE
autocmd filetype sql iab join                   JOIN
autocmd filetype sql iab k                      K
autocmd filetype sql iab key                    KEY
autocmd filetype sql iab key_member             KEY_MEMBER
autocmd filetype sql iab key_type               KEY_TYPE
autocmd filetype sql iab keys                   KEYS
autocmd filetype sql iab kill                   KILL
autocmd filetype sql iab lancompiler            LANCOMPILER
autocmd filetype sql iab language               LANGUAGE
autocmd filetype sql iab large                  LARGE
autocmd filetype sql iab last                   LAST
autocmd filetype sql iab last_insert_id         LAST_INSERT_ID
autocmd filetype sql iab lateral                LATERAL
autocmd filetype sql iab lead                   LEAD
autocmd filetype sql iab leading                LEADING
autocmd filetype sql iab least                  LEAST
autocmd filetype sql iab leave                  LEAVE
autocmd filetype sql iab left                   LEFT
autocmd filetype sql iab length                 LENGTH
autocmd filetype sql iab less                   LESS
autocmd filetype sql iab level                  LEVEL
autocmd filetype sql iab like                   LIKE
autocmd filetype sql iab limit                  LIMIT
autocmd filetype sql iab lineno                 LINENO
autocmd filetype sql iab lines                  LINES
autocmd filetype sql iab listen                 LISTEN
autocmd filetype sql iab ln                     LN
autocmd filetype sql iab load                   LOAD
autocmd filetype sql iab local                  LOCAL
autocmd filetype sql iab localtime              LOCALTIME
autocmd filetype sql iab localtimestamp         LOCALTIMESTAMP
autocmd filetype sql iab location               LOCATION
autocmd filetype sql iab locator                LOCATOR
autocmd filetype sql iab lock                   LOCK
autocmd filetype sql iab login                  LOGIN
autocmd filetype sql iab logs                   LOGS
autocmd filetype sql iab long                   LONG
autocmd filetype sql iab longblob               LONGBLOB
autocmd filetype sql iab longtext               LONGTEXT
autocmd filetype sql iab loop                   LOOP
autocmd filetype sql iab low_priority           LOW_PRIORITY
autocmd filetype sql iab lower                  LOWER
autocmd filetype sql iab m                      M
autocmd filetype sql iab map                    MAP
autocmd filetype sql iab match                  MATCH
autocmd filetype sql iab matched                MATCHED
autocmd filetype sql iab max                    MAX
autocmd filetype sql iab max_rows               MAX_ROWS
autocmd filetype sql iab maxextents             MAXEXTENTS
autocmd filetype sql iab maxvalue               MAXVALUE
autocmd filetype sql iab mediumblob             MEDIUMBLOB
autocmd filetype sql iab mediumint              MEDIUMINT
autocmd filetype sql iab mediumtext             MEDIUMTEXT
autocmd filetype sql iab member                 MEMBER
autocmd filetype sql iab merge                  MERGE
autocmd filetype sql iab message_length         MESSAGE_LENGTH
autocmd filetype sql iab message_octet_length   MESSAGE_OCTET_LENGTH
autocmd filetype sql iab message_text           MESSAGE_TEXT
autocmd filetype sql iab method                 METHOD
autocmd filetype sql iab middleint              MIDDLEINT
autocmd filetype sql iab min                    MIN
autocmd filetype sql iab min_rows               MIN_ROWS
autocmd filetype sql iab minus                  MINUS
autocmd filetype sql iab minute                 MINUTE
autocmd filetype sql iab minute_microsecond     MINUTE_MICROSECOND
autocmd filetype sql iab minute_second          MINUTE_SECOND
autocmd filetype sql iab minvalue               MINVALUE
autocmd filetype sql iab mlslabel               MLSLABEL
autocmd filetype sql iab mod                    MOD
autocmd filetype sql iab mode                   MODE
autocmd filetype sql iab modifies               MODIFIES
autocmd filetype sql iab modify                 MODIFY
autocmd filetype sql iab module                 MODULE
autocmd filetype sql iab month                  MONTH
autocmd filetype sql iab monthname              MONTHNAME
autocmd filetype sql iab more                   MORE
autocmd filetype sql iab move                   MOVE
autocmd filetype sql iab multiset               MULTISET
autocmd filetype sql iab mumps                  MUMPS
autocmd filetype sql iab myisam                 MYISAM
autocmd filetype sql iab name                   NAME
autocmd filetype sql iab names                  NAMES
autocmd filetype sql iab national               NATIONAL
autocmd filetype sql iab natural                NATURAL
autocmd filetype sql iab nchar                  NCHAR
autocmd filetype sql iab nclob                  NCLOB
autocmd filetype sql iab nesting                NESTING
autocmd filetype sql iab new                    NEW
autocmd filetype sql iab next                   NEXT
autocmd filetype sql iab no                     NO
autocmd filetype sql iab no_write_to_binlog     NO_WRITE_TO_BINLOG
autocmd filetype sql iab noaudit                NOAUDIT
autocmd filetype sql iab nocheck                NOCHECK
autocmd filetype sql iab nocompress             NOCOMPRESS
autocmd filetype sql iab nocreatedb             NOCREATEDB
autocmd filetype sql iab nocreaterole           NOCREATEROLE
autocmd filetype sql iab nocreateuser           NOCREATEUSER
autocmd filetype sql iab noinherit              NOINHERIT
autocmd filetype sql iab nologin                NOLOGIN
autocmd filetype sql iab nonclustered           NONCLUSTERED
autocmd filetype sql iab none                   NONE
autocmd filetype sql iab normalize              NORMALIZE
autocmd filetype sql iab normalized             NORMALIZED
autocmd filetype sql iab nosuperuser            NOSUPERUSER
autocmd filetype sql iab not                    NOT
autocmd filetype sql iab nothing                NOTHING
autocmd filetype sql iab notify                 NOTIFY
autocmd filetype sql iab notnull                NOTNULL
autocmd filetype sql iab nowait                 NOWAIT
autocmd filetype sql iab null                   NULL
autocmd filetype sql iab nullable               NULLABLE
autocmd filetype sql iab nullif                 NULLIF
autocmd filetype sql iab nulls                  NULLS
autocmd filetype sql iab number                 NUMBER
autocmd filetype sql iab numeric                NUMERIC
autocmd filetype sql iab object                 OBJECT
autocmd filetype sql iab octet_length           OCTET_LENGTH
autocmd filetype sql iab octets                 OCTETS
autocmd filetype sql iab of                     OF
autocmd filetype sql iab off                    OFF
autocmd filetype sql iab offline                OFFLINE
autocmd filetype sql iab offset                 OFFSET
autocmd filetype sql iab offsets                OFFSETS
autocmd filetype sql iab oids                   OIDS
autocmd filetype sql iab old                    OLD
autocmd filetype sql iab on                     ON
autocmd filetype sql iab online                 ONLINE
autocmd filetype sql iab only                   ONLY
autocmd filetype sql iab open                   OPEN
autocmd filetype sql iab opendatasource         OPENDATASOURCE
autocmd filetype sql iab openquery              OPENQUERY
autocmd filetype sql iab openrowset             OPENROWSET
autocmd filetype sql iab openxml                OPENXML
autocmd filetype sql iab operation              OPERATION
autocmd filetype sql iab operator               OPERATOR
autocmd filetype sql iab optimize               OPTIMIZE
autocmd filetype sql iab option                 OPTION
autocmd filetype sql iab optionally             OPTIONALLY
autocmd filetype sql iab options                OPTIONS
autocmd filetype sql iab or                     OR
autocmd filetype sql iab order                  ORDER
autocmd filetype sql iab ordering               ORDERING
autocmd filetype sql iab ordinality             ORDINALITY
autocmd filetype sql iab others                 OTHERS
autocmd filetype sql iab out                    OUT
autocmd filetype sql iab outer                  OUTER
autocmd filetype sql iab outfile                OUTFILE
autocmd filetype sql iab output                 OUTPUT
autocmd filetype sql iab over                   OVER
autocmd filetype sql iab overlaps               OVERLAPS
autocmd filetype sql iab overlay                OVERLAY
autocmd filetype sql iab overriding             OVERRIDING
autocmd filetype sql iab owner                  OWNER
autocmd filetype sql iab pack_keys              PACK_KEYS
autocmd filetype sql iab pad                    PAD
autocmd filetype sql iab parameter              PARAMETER
autocmd filetype sql iab parameter_mode         PARAMETER_MODE
autocmd filetype sql iab parameter_name         PARAMETER_NAME
autocmd filetype sql iab parameters             PARAMETERS
autocmd filetype sql iab partial                PARTIAL
autocmd filetype sql iab partition              PARTITION
autocmd filetype sql iab pascal                 PASCAL
autocmd filetype sql iab password               PASSWORD
autocmd filetype sql iab path                   PATH
autocmd filetype sql iab pctfree                PCTFREE
autocmd filetype sql iab percent                PERCENT
autocmd filetype sql iab percent_rank           PERCENT_RANK
autocmd filetype sql iab percentile_cont        PERCENTILE_CONT
autocmd filetype sql iab percentile_disc        PERCENTILE_DISC
autocmd filetype sql iab placing                PLACING
autocmd filetype sql iab plan                   PLAN
autocmd filetype sql iab pli                    PLI
autocmd filetype sql iab position               POSITION
autocmd filetype sql iab postfix                POSTFIX
autocmd filetype sql iab power                  POWER
autocmd filetype sql iab preceding              PRECEDING
autocmd filetype sql iab precision              PRECISION
autocmd filetype sql iab prefix                 PREFIX
autocmd filetype sql iab preorder               PREORDER
autocmd filetype sql iab prepare                PREPARE
autocmd filetype sql iab prepared               PREPARED
autocmd filetype sql iab preserve               PRESERVE
autocmd filetype sql iab primary                PRIMARY
autocmd filetype sql iab print                  PRINT
autocmd filetype sql iab prior                  PRIOR
autocmd filetype sql iab privileges             PRIVILEGES
autocmd filetype sql iab proc                   PROC
autocmd filetype sql iab procedural             PROCEDURAL
autocmd filetype sql iab procedure              PROCEDURE
autocmd filetype sql iab process                PROCESS
autocmd filetype sql iab processlist            PROCESSLIST
autocmd filetype sql iab public                 PUBLIC
autocmd filetype sql iab purge                  PURGE
autocmd filetype sql iab quote                  QUOTE
autocmd filetype sql iab raid0                  RAID0
autocmd filetype sql iab raiserror              RAISERROR
autocmd filetype sql iab range                  RANGE
autocmd filetype sql iab rank                   RANK
autocmd filetype sql iab raw                    RAW
autocmd filetype sql iab read                   READ
autocmd filetype sql iab reads                  READS
autocmd filetype sql iab readtext               READTEXT
autocmd filetype sql iab real                   REAL
autocmd filetype sql iab recheck                RECHECK
autocmd filetype sql iab reconfigure            RECONFIGURE
autocmd filetype sql iab recursive              RECURSIVE
autocmd filetype sql iab ref                    REF
autocmd filetype sql iab references             REFERENCES
autocmd filetype sql iab referencing            REFERENCING
autocmd filetype sql iab regexp                 REGEXP
autocmd filetype sql iab regr_avgx              REGR_AVGX
autocmd filetype sql iab regr_avgy              REGR_AVGY
autocmd filetype sql iab regr_count             REGR_COUNT
autocmd filetype sql iab regr_intercept         REGR_INTERCEPT
autocmd filetype sql iab regr_r2                REGR_R2
autocmd filetype sql iab regr_slope             REGR_SLOPE
autocmd filetype sql iab regr_sxx               REGR_SXX
autocmd filetype sql iab regr_sxy               REGR_SXY
autocmd filetype sql iab regr_syy               REGR_SYY
autocmd filetype sql iab reindex                REINDEX
autocmd filetype sql iab relative               RELATIVE
autocmd filetype sql iab release                RELEASE
autocmd filetype sql iab reload                 RELOAD
autocmd filetype sql iab rename                 RENAME
autocmd filetype sql iab repeat                 REPEAT
autocmd filetype sql iab repeatable             REPEATABLE
autocmd filetype sql iab replace                REPLACE
autocmd filetype sql iab replication            REPLICATION
autocmd filetype sql iab require                REQUIRE
autocmd filetype sql iab reset                  RESET
autocmd filetype sql iab resignal               RESIGNAL
autocmd filetype sql iab resource               RESOURCE
autocmd filetype sql iab restart                RESTART
autocmd filetype sql iab restore                RESTORE
autocmd filetype sql iab restrict               RESTRICT
autocmd filetype sql iab result                 RESULT
autocmd filetype sql iab return                 RETURN
autocmd filetype sql iab returned_cardinality   RETURNED_CARDINALITY
autocmd filetype sql iab returned_length        RETURNED_LENGTH
autocmd filetype sql iab returned_octet_length  RETURNED_OCTET_LENGTH
autocmd filetype sql iab returned_sqlstate      RETURNED_SQLSTATE
autocmd filetype sql iab returns                RETURNS
autocmd filetype sql iab revoke                 REVOKE
autocmd filetype sql iab right                  RIGHT
autocmd filetype sql iab rlike                  RLIKE
autocmd filetype sql iab role                   ROLE
autocmd filetype sql iab rollback               ROLLBACK
autocmd filetype sql iab rollup                 ROLLUP
autocmd filetype sql iab routine                ROUTINE
autocmd filetype sql iab routine_catalog        ROUTINE_CATALOG
autocmd filetype sql iab routine_name           ROUTINE_NAME
autocmd filetype sql iab routine_schema         ROUTINE_SCHEMA
autocmd filetype sql iab row                    ROW
autocmd filetype sql iab row_count              ROW_COUNT
autocmd filetype sql iab row_number             ROW_NUMBER
autocmd filetype sql iab rowcount               ROWCOUNT
autocmd filetype sql iab rowguidcol             ROWGUIDCOL
autocmd filetype sql iab rowid                  ROWID
autocmd filetype sql iab rownum                 ROWNUM
autocmd filetype sql iab rows                   ROWS
autocmd filetype sql iab rule                   RULE
autocmd filetype sql iab save                   SAVE
autocmd filetype sql iab savepoint              SAVEPOINT
autocmd filetype sql iab scale                  SCALE
autocmd filetype sql iab schema                 SCHEMA
autocmd filetype sql iab schema_name            SCHEMA_NAME
autocmd filetype sql iab schemas                SCHEMAS
autocmd filetype sql iab scope                  SCOPE
autocmd filetype sql iab scope_catalog          SCOPE_CATALOG
autocmd filetype sql iab scope_name             SCOPE_NAME
autocmd filetype sql iab scope_schema           SCOPE_SCHEMA
autocmd filetype sql iab scroll                 SCROLL
autocmd filetype sql iab search                 SEARCH
autocmd filetype sql iab second                 SECOND
autocmd filetype sql iab second_microsecond     SECOND_MICROSECOND
autocmd filetype sql iab section                SECTION
autocmd filetype sql iab security               SECURITY
autocmd filetype sql iab select                 SELECT
autocmd filetype sql iab self                   SELF
autocmd filetype sql iab sensitive              SENSITIVE
autocmd filetype sql iab separator              SEPARATOR
autocmd filetype sql iab sequence               SEQUENCE
autocmd filetype sql iab serializable           SERIALIZABLE
autocmd filetype sql iab server_name            SERVER_NAME
autocmd filetype sql iab session                SESSION
autocmd filetype sql iab session_user           SESSION_USER
autocmd filetype sql iab set                    SET
autocmd filetype sql iab setof                  SETOF
autocmd filetype sql iab sets                   SETS
autocmd filetype sql iab setuser                SETUSER
autocmd filetype sql iab share                  SHARE
autocmd filetype sql iab show                   SHOW
autocmd filetype sql iab shutdown               SHUTDOWN
autocmd filetype sql iab signal                 SIGNAL
autocmd filetype sql iab similar                SIMILAR
autocmd filetype sql iab simple                 SIMPLE
autocmd filetype sql iab size                   SIZE
autocmd filetype sql iab smallint               SMALLINT
autocmd filetype sql iab some                   SOME
autocmd filetype sql iab soname                 SONAME
autocmd filetype sql iab source                 SOURCE
autocmd filetype sql iab space                  SPACE
autocmd filetype sql iab spatial                SPATIAL
autocmd filetype sql iab specific               SPECIFIC
autocmd filetype sql iab specific_name          SPECIFIC_NAME
autocmd filetype sql iab specifictype           SPECIFICTYPE
autocmd filetype sql iab sql                    SQL
autocmd filetype sql iab sql_big_result         SQL_BIG_RESULT
autocmd filetype sql iab sql_big_selects        SQL_BIG_SELECTS
autocmd filetype sql iab sql_big_tables         SQL_BIG_TABLES
autocmd filetype sql iab sql_calc_found_rows    SQL_CALC_FOUND_ROWS
autocmd filetype sql iab sql_log_off            SQL_LOG_OFF
autocmd filetype sql iab sql_log_update         SQL_LOG_UPDATE
autocmd filetype sql iab sql_select_limit       SQL_SELECT_LIMIT
autocmd filetype sql iab sql_small_result       SQL_SMALL_RESULT
autocmd filetype sql iab sql_warnings           SQL_WARNINGS
autocmd filetype sql iab sqlca                  SQLCA
autocmd filetype sql iab sqlcode                SQLCODE
autocmd filetype sql iab sqlerror               SQLERROR
autocmd filetype sql iab sqlexception           SQLEXCEPTION
autocmd filetype sql iab sqlstate               SQLSTATE
autocmd filetype sql iab sqlwarning             SQLWARNING
autocmd filetype sql iab sqrt                   SQRT
autocmd filetype sql iab ssl                    SSL
autocmd filetype sql iab stable                 STABLE
autocmd filetype sql iab start                  START
autocmd filetype sql iab starting               STARTING
autocmd filetype sql iab state                  STATE
autocmd filetype sql iab statement              STATEMENT
autocmd filetype sql iab static                 STATIC
autocmd filetype sql iab statistics             STATISTICS
autocmd filetype sql iab status                 STATUS
autocmd filetype sql iab stddev_pop             STDDEV_POP
autocmd filetype sql iab stddev_samp            STDDEV_SAMP
autocmd filetype sql iab stdin                  STDIN
autocmd filetype sql iab stdout                 STDOUT
autocmd filetype sql iab storage                STORAGE
autocmd filetype sql iab straight_join          STRAIGHT_JOIN
autocmd filetype sql iab strict                 STRICT
autocmd filetype sql iab string                 STRING
autocmd filetype sql iab structure              STRUCTURE
autocmd filetype sql iab style                  STYLE
autocmd filetype sql iab subclass_origin        SUBCLASS_ORIGIN
autocmd filetype sql iab sublist                SUBLIST
autocmd filetype sql iab submultiset            SUBMULTISET
autocmd filetype sql iab substring              SUBSTRING
autocmd filetype sql iab successful             SUCCESSFUL
autocmd filetype sql iab sum                    SUM
autocmd filetype sql iab superuser              SUPERUSER
autocmd filetype sql iab symmetric              SYMMETRIC
autocmd filetype sql iab synonym                SYNONYM
autocmd filetype sql iab sysdate                SYSDATE
autocmd filetype sql iab sysid                  SYSID
autocmd filetype sql iab system                 SYSTEM
autocmd filetype sql iab system_user            SYSTEM_USER
autocmd filetype sql iab table                  TABLE
autocmd filetype sql iab table_name             TABLE_NAME
autocmd filetype sql iab tables                 TABLES
autocmd filetype sql iab tablesample            TABLESAMPLE
autocmd filetype sql iab tablespace             TABLESPACE
autocmd filetype sql iab temp                   TEMP
autocmd filetype sql iab template               TEMPLATE
autocmd filetype sql iab temporary              TEMPORARY
autocmd filetype sql iab terminate              TERMINATE
autocmd filetype sql iab terminated             TERMINATED
autocmd filetype sql iab text                   TEXT
autocmd filetype sql iab textsize               TEXTSIZE
autocmd filetype sql iab than                   THAN
autocmd filetype sql iab then                   THEN
autocmd filetype sql iab ties                   TIES
autocmd filetype sql iab time                   TIME
autocmd filetype sql iab timestamp              TIMESTAMP
autocmd filetype sql iab timezone_hour          TIMEZONE_HOUR
autocmd filetype sql iab timezone_minute        TIMEZONE_MINUTE
autocmd filetype sql iab tinyblob               TINYBLOB
autocmd filetype sql iab tinyint                TINYINT
autocmd filetype sql iab tinytext               TINYTEXT
autocmd filetype sql iab to                     TO
autocmd filetype sql iab toast                  TOAST
autocmd filetype sql iab top                    TOP
autocmd filetype sql iab top_level_count        TOP_LEVEL_COUNT
autocmd filetype sql iab trailing               TRAILING
autocmd filetype sql iab tran                   TRAN
autocmd filetype sql iab transaction            TRANSACTION
autocmd filetype sql iab transaction_active     TRANSACTION_ACTIVE
autocmd filetype sql iab transactions_committed TRANSACTIONS_COMMITTED
autocmd filetype sql iab transform              TRANSFORM
autocmd filetype sql iab transforms             TRANSFORMS
autocmd filetype sql iab translate              TRANSLATE
autocmd filetype sql iab translation            TRANSLATION
autocmd filetype sql iab treat                  TREAT
autocmd filetype sql iab trigger                TRIGGER
autocmd filetype sql iab trigger_catalog        TRIGGER_CATALOG
autocmd filetype sql iab trigger_name           TRIGGER_NAME
autocmd filetype sql iab trigger_schema         TRIGGER_SCHEMA
autocmd filetype sql iab trim                   TRIM
autocmd filetype sql iab true                   TRUE
autocmd filetype sql iab truncate               TRUNCATE
autocmd filetype sql iab trusted                TRUSTED
autocmd filetype sql iab tsequal                TSEQUAL
autocmd filetype sql iab type                   TYPE
autocmd filetype sql iab uescape                UESCAPE
autocmd filetype sql iab uid                    UID
autocmd filetype sql iab unbounded              UNBOUNDED
autocmd filetype sql iab uncommitted            UNCOMMITTED
autocmd filetype sql iab under                  UNDER
autocmd filetype sql iab undo                   UNDO
autocmd filetype sql iab unencrypted            UNENCRYPTED
autocmd filetype sql iab union                  UNION
autocmd filetype sql iab unique                 UNIQUE
autocmd filetype sql iab unknown                UNKNOWN
autocmd filetype sql iab unlisten               UNLISTEN
autocmd filetype sql iab unlock                 UNLOCK
autocmd filetype sql iab unnamed                UNNAMED
autocmd filetype sql iab unnest                 UNNEST
autocmd filetype sql iab unsigned               UNSIGNED
autocmd filetype sql iab until                  UNTIL
autocmd filetype sql iab update                 UPDATE
autocmd filetype sql iab updatetext             UPDATETEXT
autocmd filetype sql iab upper                  UPPER
autocmd filetype sql iab usage                  USAGE
autocmd filetype sql iab use                    USE
autocmd filetype sql iab user                   USER
autocmd filetype sql iab using                  USING
autocmd filetype sql iab utc_date               UTC_DATE
autocmd filetype sql iab utc_time               UTC_TIME
autocmd filetype sql iab utc_timestamp          UTC_TIMESTAMP
autocmd filetype sql iab vacuum                 VACUUM
autocmd filetype sql iab valid                  VALID
autocmd filetype sql iab validate               VALIDATE
autocmd filetype sql iab validator              VALIDATOR
autocmd filetype sql iab value                  VALUE
autocmd filetype sql iab values                 VALUES
autocmd filetype sql iab var_pop                VAR_POP
autocmd filetype sql iab var_samp               VAR_SAMP
autocmd filetype sql iab varbinary              VARBINARY
autocmd filetype sql iab varchar                VARCHAR
autocmd filetype sql iab varchar2               VARCHAR2
autocmd filetype sql iab varcharacter           VARCHARACTER
autocmd filetype sql iab variable               VARIABLE
autocmd filetype sql iab variables              VARIABLES
autocmd filetype sql iab varying                VARYING
autocmd filetype sql iab verbose                VERBOSE
autocmd filetype sql iab view                   VIEW
autocmd filetype sql iab volatile               VOLATILE
autocmd filetype sql iab waitfor                WAITFOR
autocmd filetype sql iab when                   WHEN
autocmd filetype sql iab whenever               WHENEVER
autocmd filetype sql iab where                  WHERE
autocmd filetype sql iab while                  WHILE
autocmd filetype sql iab width_bucket           WIDTH_BUCKET
autocmd filetype sql iab window                 WINDOW
autocmd filetype sql iab with                   WITH
autocmd filetype sql iab within                 WITHIN
autocmd filetype sql iab without                WITHOUT
autocmd filetype sql iab work                   WORK
autocmd filetype sql iab write                  WRITE
autocmd filetype sql iab writetext              WRITETEXT
autocmd filetype sql iab x509                   X509
autocmd filetype sql iab xor                    XOR
autocmd filetype sql iab year                   YEAR
autocmd filetype sql iab year_month             YEAR_MONTH
autocmd filetype sql iab zerofill               ZEROFILL
autocmd filetype sql iab zone                   ZONE
