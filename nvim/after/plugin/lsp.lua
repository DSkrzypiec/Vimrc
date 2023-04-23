local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leadaer>lq', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150,
}

-- python
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- C#
require("lspconfig")['csharp_ls'].setup{}

-- C/C++
require("lspconfig")['clangd'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- go
require('lspconfig')['gopls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = require('lspconfig/util').root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}

-- typescript
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Rust
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      ['rust-analyzer'] = {
            procMacro = { enable = true },
            diagnostics = {
                enable = true,
                disabled = {'unresolved-macro-call', 'unresolved-proc-macro'},
                enableExperimental = true,
            }
        }
    }
}

-- Zig
require('lspconfig')['zls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

