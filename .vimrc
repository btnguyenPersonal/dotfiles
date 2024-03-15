let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:conflict_marker_highlight_group = ''
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'
let g:python_highlight_space_errors = 0
let g:ale_hover_cursor = 0
let g:ale_hover_to_floating_preview = 1
let g:ale_virtualtext_cursor=0
let g:ale_completion_enabled = 1
let g:ale_linters = {'javascript': ['tsserver']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
highlight Pmenu guibg=#111111 guifg=white
highlight PmenuSel guibg=#222222 guifg=white
highlight ConflictMarkerBegin guibg=red
highlight ConflictMarkerEnd guibg=red
highlight ConflictMarkerSeparator guibg=red
highlight ConflictMarkerOurs guibg=darkblue guifg=white
highlight ConflictMarkerTheirs guibg=darkgreen guifg=white
call plug#begin()
Plug 'dense-analysis/ale'
Plug 'https://github.com/rhysd/conflict-marker.vim'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/tpope/vim-commentary'
call plug#end()
au InsertEnter *.py match goSpaceError /\s\+\%#\@<!$/
au InsertLeave *.py match goSpaceError /\s\+$/
autocmd CursorHold * silent! update
syntax on
function! SmartInsertCompletion() abort
    if pumvisible()
        return "\<C-n>"
    endif
    return "\<C-c>a\<C-n>"
endfunction
inoremap <Tab> <C-n>
inoremap <S-Tab> <C-p>
inoremap <expr> <CR> pumvisible() ? "\<C-e>\<cr>" : "\<CR>"
nnoremap gd :ALEGoToDefinition<cr>
nnoremap gs :ALEFindReferences -quickfix<cr>
nnoremap K :ALEHover<CR>
nnoremap gl :ALEFix<CR>
nnoremap gi :ALEImport<CR>
nnoremap <silent> gr :ALERename<CR>
vnoremap <silent> gr :ALERename<CR>
nnoremap <esc> :noh<cr><esc>
let g:recording_macro = 0
function! ToggleMacro()
  if g:recording_macro == 0
    let g:recording_macro = 1
    execute "normal! qa"
  else
    let g:recording_macro = 0
    execute "normal! q"
  endif
endfunction
nnoremap q :call ToggleMacro()<CR>
nnoremap @ @a
nnoremap = ==
nnoremap < <<
nnoremap > >>
nnoremap m ma
nnoremap M mb
nnoremap n nzz
nnoremap N Nzz
nnoremap z zz
nnoremap ' 'a
nnoremap " 'b
nnoremap <c-e> :next<cr>
nnoremap <c-w> :prev<cr>
nnoremap <c-s> <c-w>
nnoremap <space> :call AddToArgs()<CR>
nnoremap <c-l> <c-^>
function! AddToArgs()
  let current_file = expand('%')
  silent! execute 'argdelete ' . current_file
  execute '$argadd ' . current_file
  execute 'last'
endfunction
nnoremap <c-z> :argd %<cr>
nnoremap <c-x> :argd %<cr>:bd<cr>
nnoremap } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>
vnoremap P "_dP
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
nnoremap <c-f> :%s/<c-r>///g<left><left>
vnoremap <c-f> :%s/<c-r>///g<left><left>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap # :vimgrep '<c-r>/' `git ls-files`<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <c-g> :vimgrep '' `git ls-files`<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <c-k> :cp<cr>zz
nnoremap <c-j> :cn<cr>zz
set guicursor=i:block
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
set title
set wrap
set number
set ruler
set clipboard=unnamed,unnamedplus
set scrolloff=8
set mouse=a
set signcolumn=yes
set termguicolors
set omnifunc=ale#completion#OmniFunc
set completeopt-=preview
set laststatus=3
highlight StatusLineYellow guifg=yellow guibg=none
function! CondensePath(path)
  let l:parts = split(a:path, '/')
  for l:i in range(len(l:parts) - 1)
    let l:parts[l:i] = l:parts[l:i][:0]
  endfor
  return join(l:parts, '/')
endfunction
function! GetArgs()
  let l:args = argv()
  for l:i in range(len(l:args))
    let l:args[l:i] = CondensePath(l:args[l:i])
    if l:args[l:i] == CondensePath(expand('%'))
      let l:args[l:i] = '%#StatusLineYellow#' . l:args[l:i] . '%#StatusLine#'
    endif
  endfor
  return join(l:args, ' ')
endfunction
set statusline=%!GetArgs()
highlight StatusLine guibg=white guifg=black
highlight SignColumn guibg=black
highlight Comment guifg=green
highlight LineNr guifg=darkgrey
highlight ALEError gui=undercurl
highlight Search gui=reverse guifg=none guibg=none
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <c-q> :call ToggleQuickFix()<cr>
function! GetNextComment()
    let l:lnum = line('.')
    while l:lnum < line('$')
        let l:col = match(getline(l:lnum), '\S')
        if l:col != -1 && synIDattr(synIDtrans(synID(l:lnum, l:col+1, 1)), "name") == 'Comment'
            break
        endif
        execute "normal! " . "j"
        let l:lnum += 1
    endwhile
endfunction
nmap ge :call GetNextComment()<CR>gcu
