vim.cmd('source ~/.config/nvim/old_config.vim')

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
}

require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

require("telescope").setup {
  defaults = {
    theme = 'dropdown',
    hidden = true,
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = 'top',
      height = 0.9,
      width = 0.9,
      mirror = false,
    },
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    },
    path_display = { truncate = 3 },
    file_ignore_patterns = { ".git/", ".go/" },
    vimgrep_arguments = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--ignore-case",
    }
  },
}
