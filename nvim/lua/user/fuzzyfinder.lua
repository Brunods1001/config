local map = vim.api.nvim_set_keymap
options = { noremap = true }

map("n", "<leader>fg", ":GFiles<CR>", options)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", options)
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", options)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", options)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", options)

