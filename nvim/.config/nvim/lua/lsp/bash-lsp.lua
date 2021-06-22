--
-- npm i -g bash-language-server
--

local BASHLS = os.getenv('NVM_BIN') .. "/bash-language-server"

require'lspconfig'.bashls.setup {
    cmd = {BASHLS,  "start"},
    filetypes = { "sh", "zsh" }
}
