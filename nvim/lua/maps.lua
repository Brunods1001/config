local map = vim.api.nvim_set_keymap
options = { noremap = true }

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
