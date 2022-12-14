
-- set Leader
vim.api.nvim_set_keymap('n', '<space>', '<NOP>', {noremap=true, silent=true})
vim.g.mapleader = ' '

-- no hl
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hlsearch!<CR>', {noremap=true, silent=true})

-- window movment
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap=true, silent=true})

-- v indentation improved
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap=true, silent=true})

-- ESC alt
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', 'kj', '<ESC>', {noremap=true, silent=true})

-- save
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', {noremap=true, silent=true})

-- Nvim tree
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap=true, silent=true})

-- Tab buff movment
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':BufferClose<CR>', { noremap = true, silent = true })

-- Complete
vim.api.nvim_set_keymap("i", "<Tab>",   "v:lua.tab_complete()",   {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>",   "v:lua.tab_complete()",   {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap('i', '<CR>',    [[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]], {noremap=true, silent=true, expr=true})

-- UndooTree
vim.api.nvim_set_keymap('n', '<Leader>u', ':UndotreeToggle<CR>', {noremap=true, silent=true})

-- nvim comments
-- gcc
-- gc[movment]

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",                           {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",  {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",                   {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",                  {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",                    {silent = true, noremap = true})
