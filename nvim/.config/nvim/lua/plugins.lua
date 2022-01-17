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
use "windwp/nvim-autopairs"
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
-- Status Line and Bufferline
use 'glepnir/galaxyline.nvim'
use 'romgrk/barbar.nvim'
-- Comments
use "terrortylor/nvim-comment"
-- Tree Shitter related
use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
use 'nvim-treesitter/playground' -- TODO play with treeshitter playground plugin
-- better %
use 'andymass/vim-matchup'
-- auto taging
use "windwp/nvim-ts-autotag"
-- Latex preview
-- use "xuhdev/vim-latex-live-preview"
-- Markdown preview with Glow
-- use "npxbr/glow.nvim"
end)

-- Telescope TODO play with Telescoping Jonson
--[[ TODO more cool stuff to check
  'nvim-telescope/telescope.nvim'
  "nvim-telescope/telescope-fzy-native.nvim"
  'nvim-telescope/telescope-media-files.nvim'
  "nvim-telescope/telescope-project.nvim"
  'kevinhwang91/nvim-bqf'
  'glepnir/lspsaga.nvim'
  'kosayoda/nvim-lightbulb'
  'mfussenegger/nvim-dap'
  'mfussenegger/nvim-jdtls'
  'onsails/lspkind-nvim'
   "Pocco81/TrueZen.nvim"
  'ahmedkhalf/lsp-rooter.nvim'
  "kabouzeid/nvim-lspinstall" <-- dont think i need
  "rafamadriz/friendly-snippets"
  'airblade/vim-rooter'
  "folke/which-key.nvim",
  'f-person/git-blame.nvim'
  'lewis6991/gitsigns.nvim'
]]
