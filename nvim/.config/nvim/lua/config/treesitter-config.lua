
require'nvim-treesitter.configs'.setup {
-- Highlight {{{
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
-- }}}
-- Incremental selection {{{
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    =  "<C-n>",
      node_incremental  =  "<CR>",
      scope_incremental =  "<C-s>",
      node_decremental  =  "<BS>",
    },
  },
-- }}}
-- Indent {{{
  indent = {
    enable = true,
  },
-- }}}
-- Playground {{{
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
  },
-- }}}
-- Query linter {{{
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
-- }}}
-- Matchup {{{
  matchup = {
    enable = true,
  },
-- }}}
-- Autotag{{{
  autotag = {
    enable = true,
  },
--}}}
}

-- vim: set foldmethod=marker:
