local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "clangd", "rust_analyzer", "pyright",
  "marksman",
  "html", "cssls", "tsserver",
}

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
})

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
