local map = vim.api.nvim_set_keymap
local options = { noremap = true }

-- map("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>w", ":w<CR>", options)
map("n", "<leader>q", ":q<CR>", options)

map("n", "<leader>h", "<C-w>h", options)
map("n", "<leader>j", "<C-w>j", options)
map("n", "<leader>k", "<C-w>k", options)
map("n", "<leader>l", "<C-w>l", options)

map("n", "<leader>s", ":split<CR>", options)
map("n", "<leader>v", ":vsplit<CR>", options)

map("n", "<LEFT>", ":bprev<CR>", options)
map("n", "<RIGHT>", ":bnext<CR>", options)
map("n", "<BACKSPACE>", ":bdelete<CR>", options)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
