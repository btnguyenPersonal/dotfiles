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
set clipboard^=unnamed,unnamedplus
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
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
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
autocmd filetype sql iab add                      ADD
autocmd filetype sql iab all                      ALL
autocmd filetype sql iab alter                    ALTER
autocmd filetype sql iab and                      AND
autocmd filetype sql iab any                      ANY
autocmd filetype sql iab as                       AS
autocmd filetype sql iab asc                      ASC
autocmd filetype sql iab authorization            AUTHORIZATION
autocmd filetype sql iab backup                   BACKUP
autocmd filetype sql iab begin                    BEGIN
autocmd filetype sql iab between                  BETWEEN
autocmd filetype sql iab break                    BREAK
autocmd filetype sql iab browse                   BROWSE
autocmd filetype sql iab bulk                     BULK
autocmd filetype sql iab by                       BY
autocmd filetype sql iab cascade                  CASCADE
autocmd filetype sql iab case                     CASE
autocmd filetype sql iab check                    CHECK
autocmd filetype sql iab checkpoint               CHECKPOINT
autocmd filetype sql iab close                    CLOSE
autocmd filetype sql iab clustered                CLUSTERED
autocmd filetype sql iab coalesce                 COALESCE
autocmd filetype sql iab collate                  COLLATE
autocmd filetype sql iab column                   COLUMN
autocmd filetype sql iab commit                   COMMIT
autocmd filetype sql iab compute                  COMPUTE
autocmd filetype sql iab constraint               CONSTRAINT
autocmd filetype sql iab contains                 CONTAINS
autocmd filetype sql iab containstable            CONTAINSTABLE
autocmd filetype sql iab continue                 CONTINUE
autocmd filetype sql iab convert                  CONVERT
autocmd filetype sql iab create                   CREATE
autocmd filetype sql iab cross                    CROSS
autocmd filetype sql iab current                  CURRENT
autocmd filetype sql iab current_date             CURRENT_DATE
autocmd filetype sql iab current_time             CURRENT_TIME
autocmd filetype sql iab current_timestamp        CURRENT_TIMESTAMP
autocmd filetype sql iab current_user             CURRENT_USER
autocmd filetype sql iab cursor                   CURSOR
autocmd filetype sql iab database                 DATABASE
autocmd filetype sql iab dbcc                     DBCC
autocmd filetype sql iab deallocate               DEALLOCATE
autocmd filetype sql iab declare                  DECLARE
autocmd filetype sql iab default                  DEFAULT
autocmd filetype sql iab delete                   DELETE
autocmd filetype sql iab deny                     DENY
autocmd filetype sql iab desc                     DESC
autocmd filetype sql iab disk                     DISK
autocmd filetype sql iab distinct                 DISTINCT
autocmd filetype sql iab distributed              DISTRIBUTED
autocmd filetype sql iab double                   DOUBLE
autocmd filetype sql iab drop                     DROP
autocmd filetype sql iab dummy                    DUMMY
autocmd filetype sql iab dump                     DUMP
autocmd filetype sql iab else                     ELSE
autocmd filetype sql iab end                      END
autocmd filetype sql iab errlvl                   ERRLVL
autocmd filetype sql iab escape                   ESCAPE
autocmd filetype sql iab except                   EXCEPT
autocmd filetype sql iab exec                     EXEC
autocmd filetype sql iab execute                  EXECUTE
autocmd filetype sql iab exists                   EXISTS
autocmd filetype sql iab exit                     EXIT
autocmd filetype sql iab fetch                    FETCH
autocmd filetype sql iab file                     FILE
autocmd filetype sql iab fillfactor               FILLFACTOR
autocmd filetype sql iab for                      FOR
autocmd filetype sql iab foreign                  FOREIGN
autocmd filetype sql iab freetext                 FREETEXT
autocmd filetype sql iab freetexttable            FREETEXTTABLE
autocmd filetype sql iab from                     FROM
autocmd filetype sql iab full                     FULL
autocmd filetype sql iab function                 FUNCTION
autocmd filetype sql iab goto                     GOTO
autocmd filetype sql iab grant                    GRANT
autocmd filetype sql iab group                    GROUP
autocmd filetype sql iab having                   HAVING
autocmd filetype sql iab holdlock                 HOLDLOCK
autocmd filetype sql iab identity                 IDENTITY
autocmd filetype sql iab identity_insert          IDENTITY_INSERT
autocmd filetype sql iab identitycol              IDENTITYCOL
autocmd filetype sql iab if                       IF
autocmd filetype sql iab in                       IN
autocmd filetype sql iab index                    INDEX
autocmd filetype sql iab inner                    INNER
autocmd filetype sql iab insert                   INSERT
autocmd filetype sql iab intersect                INTERSECT
autocmd filetype sql iab into                     INTO
autocmd filetype sql iab is                       IS
autocmd filetype sql iab join                     JOIN
autocmd filetype sql iab key                      KEY
autocmd filetype sql iab kill                     KILL
autocmd filetype sql iab left                     LEFT
autocmd filetype sql iab like                     LIKE
autocmd filetype sql iab lineno                   LINENO
autocmd filetype sql iab load                     LOAD
autocmd filetype sql iab national                 NATIONAL
autocmd filetype sql iab nocheck                  NOCHECK
autocmd filetype sql iab nonclustered             NONCLUSTERED
autocmd filetype sql iab not                      NOT
autocmd filetype sql iab null                     NULL
autocmd filetype sql iab nullif                   NULLIF
autocmd filetype sql iab of                       OF
autocmd filetype sql iab off                      OFF
autocmd filetype sql iab offsets                  OFFSETS
autocmd filetype sql iab on                       ON
autocmd filetype sql iab open                     OPEN
autocmd filetype sql iab opendatasource           OPENDATASOURCE
autocmd filetype sql iab openquery                OPENQUERY
autocmd filetype sql iab openrowset               OPENROWSET
autocmd filetype sql iab openxml                  OPENXML
autocmd filetype sql iab option                   OPTION
autocmd filetype sql iab or                       OR
autocmd filetype sql iab order                    ORDER
autocmd filetype sql iab outer                    OUTER
autocmd filetype sql iab over                     OVER
autocmd filetype sql iab percent                  PERCENT
autocmd filetype sql iab plan                     PLAN
autocmd filetype sql iab precision                PRECISION
autocmd filetype sql iab primary                  PRIMARY
autocmd filetype sql iab print                    PRINT
autocmd filetype sql iab proc                     PROC
autocmd filetype sql iab procedure                PROCEDURE
autocmd filetype sql iab public                   PUBLIC
autocmd filetype sql iab raiserror                RAISERROR
autocmd filetype sql iab read                     READ
autocmd filetype sql iab readtext                 READTEXT
autocmd filetype sql iab reconfigure              RECONFIGURE
autocmd filetype sql iab references               REFERENCES
autocmd filetype sql iab replication              REPLICATION
autocmd filetype sql iab restore                  RESTORE
autocmd filetype sql iab restrict                 RESTRICT
autocmd filetype sql iab return                   RETURN
autocmd filetype sql iab revoke                   REVOKE
autocmd filetype sql iab right                    RIGHT
autocmd filetype sql iab rollback                 ROLLBACK
autocmd filetype sql iab rowcount                 ROWCOUNT
autocmd filetype sql iab rowguidcol               ROWGUIDCOL
autocmd filetype sql iab rule                     RULE
autocmd filetype sql iab save                     SAVE
autocmd filetype sql iab schema                   SCHEMA
autocmd filetype sql iab select                   SELECT
autocmd filetype sql iab session_user             SESSION_USER
autocmd filetype sql iab set                      SET
autocmd filetype sql iab setuser                  SETUSER
autocmd filetype sql iab shutdown                 SHUTDOWN
autocmd filetype sql iab some                     SOME
autocmd filetype sql iab statistics               STATISTICS
autocmd filetype sql iab system_user              SYSTEM_USER
autocmd filetype sql iab table                    TABLE
autocmd filetype sql iab textsize                 TEXTSIZE
autocmd filetype sql iab then                     THEN
autocmd filetype sql iab to                       TO
autocmd filetype sql iab top                      TOP
autocmd filetype sql iab tran                     TRAN
autocmd filetype sql iab transaction              TRANSACTION
autocmd filetype sql iab trigger                  TRIGGER
autocmd filetype sql iab truncate                 TRUNCATE
autocmd filetype sql iab tsequal                  TSEQUAL
autocmd filetype sql iab union                    UNION
autocmd filetype sql iab unique                   UNIQUE
autocmd filetype sql iab update                   UPDATE
autocmd filetype sql iab updatetext               UPDATETEXT
autocmd filetype sql iab use                      USE
autocmd filetype sql iab user                     USER
autocmd filetype sql iab values                   VALUES
autocmd filetype sql iab varying                  VARYING
autocmd filetype sql iab view                     VIEW
autocmd filetype sql iab waitfor                  WAITFOR
autocmd filetype sql iab when                     WHEN
autocmd filetype sql iab where                    WHERE
autocmd filetype sql iab while                    WHILE
autocmd filetype sql iab with                     WITH
autocmd filetype sql iab writetext                WRITETEXT
