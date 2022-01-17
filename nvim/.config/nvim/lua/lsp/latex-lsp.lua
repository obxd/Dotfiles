--
-- pacman -S texlab
--

require 'lsp'
require'lspconfig'.texlab.setup{
  on_attach = on_attach,
}
