--
--  sudo pacman -S haskell-language-server
--

require 'lsp'
require'lspconfig'.hls.setup{ 
  on_attach = on_attach,
  root_dir = function() return vim.loop.cwd() end      -- run lsp for haskell in any directory
}
