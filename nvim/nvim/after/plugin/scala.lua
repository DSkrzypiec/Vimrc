local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)


-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})


local api = vim.api
local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- global
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F"):append("c")

-- LSP mappings
map("n", "<leader>sd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>sh", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>si", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<leader>sr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<leader>sds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
map("n", "<leader>sws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
map("n", "<leader>scl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
map("n", "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>sf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<leader>sca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
