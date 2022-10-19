local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = false }
local expr_opts = { noremap = true, expr = true, silent = true }

-- leader
vim.g.mapleader = " "

-- basics
keymap("n", "<C-n>", ":tabnew<Space>", default_opts)
keymap("n", "<C-j>", ":tabprev<CR>", default_opts)
keymap("n", "<C-k>", ":tabnext<CR>", default_opts)
keymap("n", "nm", ":vertical res +10<CR>", default_opts)
keymap("n", "mn", ":vertical res -10<CR>", default_opts)
keymap("n", "rt", ":res +10<CR>", default_opts)
keymap("n", "tr", ":res -10<CR>", default_opts)

-- folds
keymap("n", "<leader>zl", "V/^$<CR>kzf<CR>", default_opts)
keymap("n", "<leader>zp", "v/(<CR>%zf<CR>", default_opts)
keymap("n", "<leader>zb", "v/{<CR>%zf<CR>", default_opts)

-- fzf
keymap("n", "<leader>l", ":Lines<CR>", default_opts)
keymap("n", "<leader>f", ":Files<CR>", default_opts)

-- toggleterm
keymap("n", "<leader>tl", ":ToggleTermSendCurrentLine<CR>", default_opts)
keymap("v", "<leader>ts", ":ToggleTermSendVisualSelection<CR>", default_opts)

-- Fugitive
keymap("n", "<leader>gs", ":Git<CR>", default_opts)
keymap("n", "<leader>gd", ":Gdiffsplit<CR>", default_opts)
keymap("n", "<leader>gb", ":Git blame<CR>", default_opts)
keymap("v", "<leader>gdp", ":diffput<CR>", default_opts)
