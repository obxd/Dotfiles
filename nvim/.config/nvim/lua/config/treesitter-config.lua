
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "cpp", "python" },

  highlight = { enable = true },

  indent = { enable = true },

  matchup = { enable = true },
}

-- vim: set foldmethod=marker:
