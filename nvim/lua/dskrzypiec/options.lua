vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.textwidth = 119
vim.opt.wrap = true

vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.laststatus = 2

vim.opt.list = true
vim.opt.listchars = { trail = '^', tab = '| ' }
vim.opt.clipboard = "unnamed"

vim.cmd([[ hi LineNr guibg=none guifg=#ffffff ]])
vim.cmd [[colorscheme monochrome]]
