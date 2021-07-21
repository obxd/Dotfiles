--
-- npm install -g typescript typescript-language-server
--
require'lspconfig'.tsserver.setup{
 root_dir = function() return vim.loop.cwd() end      -- run lsp for javascript in any directory
}
