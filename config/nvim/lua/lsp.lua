local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local addFormatAutocmd = function()
  vim.api.nvim_command("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end


-- C#
require("lspconfig").csharp_ls.setup{}

-- Python
require("lspconfig").pyright.setup{}

-- SQL
require("lspconfig").sqlls.setup{}

-- CSS
require("lspconfig").stylelint_lsp.setup{
  capabilities = capabilities,
  on_attach = addFormatAutocmd,
  settings = {
    stylelintplus = {
      autoFixOnFormat = true,
    },
  },
}


-- Go
require("lspconfig").gopls.setup{
  capabilities = capabilities,
}

-- R
require("lspconfig").r_language_server.setup{
  capabilities = capabilities,
}

