--
-- npm i -g bash-language-server
--

require 'lsp'
local BASHLS = os.getenv('NVM_BIN') .. "/bash-language-server"

require'lspconfig'.bashls.setup {
  cmd = {BASHLS,  "start"},
  on_attach = on_attach,
  filetypes = { "sh", "zsh" }
}
