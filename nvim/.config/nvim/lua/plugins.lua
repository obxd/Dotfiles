local execute = vim.api.nvim_command
local fn = vim.fn

-- {{{ uncomment to install packer.nvim
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
--   execute 'packadd packer.nvim'
-- end
-- }}}

-- TODO find and add more plugins 
return require('packer').startup(function()
  -- Packer
  use 'wbthomason/packer.nvim'
   
  -- Completions + LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'folke/trouble.nvim' -- TODO change icons
  use 'hrsh7th/vim-vsnip'  -- TODO  play with vim-vsnip config
 
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
 
  -- Colors
  use 'norcalli/nvim-colorizer.lua' 
 
  -- File tree
  use 'kyazdani42/nvim-tree.lua'
  
  -- Status Line and Bufferline
  use 'glepnir/galaxyline.nvim'
  use 'romgrk/barbar.nvim'
  
  -- Comments
  use "terrortylor/nvim-comment"
  
  -- Coloschemes
  use 'sainnhe/gruvbox-material'
  use 'glepnir/zephyr-nvim'

  --  highlight for a unique character 
  use 'unblevable/quick-scope' 

  -- Tree Shitter related
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"} -- TODO play treeshitter 
                                                             -- add treeshitter playground plugin too
  -- better %
  use 'andymass/vim-matchup'  -- TODO  play with vim-matchup config

  -- autopair
  use "windwp/nvim-autopairs"  -- TODO play with autopairs config

  -- auto taging
  use "windwp/nvim-ts-autotag"  -- TODO play with autotag config

  -- Latex preview
  use "xuhdev/vim-latex-live-preview"

  -- Markdown preview with Glow
  use "npxbr/glow.nvim"

  -- FireNvim
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  -- Telescope TODO play with Telescoping Jonson
end)

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
