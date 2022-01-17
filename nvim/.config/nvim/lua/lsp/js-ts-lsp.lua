--
-- npm install -g typescript typescript-language-server
--

require'lsp'
require'lspconfig'.tsserver.setup{
  on_attach = on_attach,
  root_dir = function() return vim.loop.cwd() end      -- run lsp for javascript in any directory
}
