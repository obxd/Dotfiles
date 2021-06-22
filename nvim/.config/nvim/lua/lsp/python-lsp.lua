--
--  npm i -g pyright
--

local PYRIGHT = os.getenv('NVM_BIN') .. "/pyright-langserver"

-- Add some linter and formaters: black bandit flake8 pydocstyle...
require'lspconfig'.pyright.setup {
  cmd = { PYRIGHT , "--stdio"},

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
