
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

-- Tab buff movment
vim.api.nvim_set_keymap('n', '<TAB>', '<:bnext<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<S-TAB>', '<:bprevious<CR>', {noremap=true, silent=true})

-- save
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', {noremap=true, silent=true})
