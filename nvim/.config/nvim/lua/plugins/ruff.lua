return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Add any LSP-related dependencies here
  },
  config = function()
    local lspconfig = require('lspconfig')
    
    -- Ruff LSP setup
    lspconfig.ruff.setup({
      init_options = {
        settings = {
          -- Ruff language server settings go here
        }
      }
    })
    
    -- Other LSP servers can go here
  end,
}
