local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- add any language you use here
local servers = {
  "html", "cssls", "tsserver", "clangd", "rust_analyzer", "gopls",
  "pyright", "yamlls", "dockerls", "clojure_lsp", "cmake",
  "terraformls", "vimls"
}

for _, lsp in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == "clangd" then
    config = {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      },
    }

    config.on_attach = function (client, bufnr)
      on_attach(client, bufnr)
      require("clangd_extensions.inlay_hints").setup_autocmd()
      require("clangd_extensions.inlay_hints").set_inlay_hints()
    end

  end

  lspconfig[lsp].setup(config)
end
