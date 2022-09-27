local status_ok, _ = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, _ = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local servers = {
  gopls = {},
  jsonls = {},
  yamlls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        }
      }
    }
  }
}

local options = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require("mason").setup()

require("mason-tool-installer").setup{
  ensure_installed = {
    'delve',
    'gopls',
    'json-lsp',
    'bicep-lsp',
    'yaml-language-server',
    'lua-language-server'
  }
}

require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers),

  automatic_installation = false,
})

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers {
  function(server_name)
      local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
      lspconfig[server_name].setup ( opts )
  end,
}
