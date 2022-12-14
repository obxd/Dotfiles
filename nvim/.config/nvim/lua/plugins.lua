-- local execute = vim.api.nvim_command
-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
--   execute 'packadd packer.nvim'
-- end

-- TODO find and add more plugins
return require('packer').startup(function(use)
-- Packer
use 'wbthomason/packer.nvim'
-- Completions + LSP
use 'nvim-lua/plenary.nvim'
use 'neovim/nvim-lspconfig'
use 'nvim-lua/popup.nvim'
use 'hrsh7th/nvim-compe'
use 'folke/trouble.nvim'
use 'hrsh7th/vim-vsnip'  -- TODO  play with vim-vsnip config
-- Icons
use 'kyazdani42/nvim-web-devicons'
-- Colors
use 'norcalli/nvim-colorizer.lua'
use 'folke/lsp-colors.nvim'
-- Coloschemes
use 'sainnhe/gruvbox-material'
use {'srcery-colors/srcery-vim', as = 'srcery'}
--  highlight for a unique character
use 'unblevable/quick-scope'
-- File tree
use 'kyazdani42/nvim-tree.lua'
-- Undo tree
use "mbbill/undotree"
-- Bufferline
use 'glepnir/galaxyline.nvim'
use 'romgrk/barbar.nvim'
-- Zen mode
use "folke/zen-mode.nvim"
use "folke/twilight.nvim"
-- Comments
use "terrortylor/nvim-comment"
-- Tree Shitter related
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use 'andymass/vim-matchup'
-- Auto pair
use 'windwp/nvim-autopairs'
end)

