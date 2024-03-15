-- plugin settings
vim.g["delimitMate_expand_cr"] = 1
vim.g["delimitMate_expand_space"] = 1
vim.g["airline_powerline_fonts"] = 1
vim.g["airline_theme"] = 'minimalist'
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'
vim.g["mapleader"] = ' '

-- load plugins
vim.cmd([[
    call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-commentary'
    Plug 'sheerun/vim-polyglot'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'Mofiqul/vscode.nvim'
    Plug 'Raimondi/delimitMate'
    Plug 'ervandew/supertab'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'BurntSushi/ripgrep'
    Plug 'vim-test/vim-test'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    call plug#end()
    let NERDTreeMinimalUI=1
    nnoremap <c-p> :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ preview_cutoff = 60 }))<cr>
    nnoremap <c-g> :lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({ preview_cutoff = 60 }))<cr>
    " Let's save undo info!
    if !isdirectory($HOME."/.vim")
        call mkdir($HOME."/.vim", "", 0770)
    endif
    if !isdirectory($HOME."/.vim/undo-dir")
        call mkdir($HOME."/.vim/undo-dir", "", 0700)
    endif
    set undodir=~/.vim/undo-dir
    set undofile
    nnoremap <leader>e :NERDTreeFind<cr>zz
    " Start NERDTree and put the cursor back in the other window.
    autocmd VimEnter * NERDTree | wincmd p
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
]])

-- autosave and preserve last position autocommand
vim.cmd([[
    augroup autosave
    autocmd!
        autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
        autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 && &buftype != 'prompt' && &buftype != 'nofile' | silent write | endif
    augroup END
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
]])

-- setting options
vim.o.background = 'dark'
vim.o.hidden = true
vim.o.showmode = false
vim.o.shell = "/bin/zsh"
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.timeoutlen = 1000
vim.o.ttimeoutlen = 1
vim.o.laststatus = 3
vim.o.mouse = 'a'

-- custom keybindings

-- use buffers as tabs
vim.api.nvim_set_keymap("n", "gt", ":bn<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "gT", ":bp<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "g0", ":bf<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "g$", ":bl<cr>", { noremap = true })

-- run test
vim.api.nvim_set_keymap("n", "<leader>l", ":TestLast<cr>", { noremap = true })

-- run test
vim.api.nvim_set_keymap("n", "<leader>m", ":TestFile<cr>", { noremap = true })

-- trim trailing whitespace
vim.api.nvim_set_keymap("n", "<leader>t", ":%s/\\s\\+$//<cr>:noh<cr>", { noremap = true })

-- open markdown preview
vim.api.nvim_set_keymap("n", "<leader>h", ":MarkdownPreviewToggle<cr>", { noremap = true })

-- syntax highlighting
local treesitter = require('nvim-treesitter.configs')
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = false
    }
}

-- vscode plugin
local c = require('vscode.colors')
require('vscode').setup({
    transparent = true,
    italic_comments = true,
    disable_nvimtree_bg = true,
    color_overrides = {
        vscLineNumber = '#FFFFFF',
    },
    group_overrides = {
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
})
