--
--  npm i -g pyright
--

require 'lsp'
local PYRIGHT = os.getenv('NVM_BIN') .. "/pyright-langserver"

require'lspconfig'.pyright.setup {
  cmd = { PYRIGHT , "--stdio"},
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  }
}
