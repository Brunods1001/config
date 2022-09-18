local map = vim.api.nvim_set_keymap
local options = { noremap = true }
local opts = { noremap = true, silent = true }


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

map("n", "<C-h>", ":bprev<CR>", options)
map("n", "<C-l>", ":bnext<CR>", options)
map("n", "<BACKSPACE>", ":bp|bd #<CR>", options)

vim.cmd([[
" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n><CR>
]])

-- Telescope
map(
"n",
"<tab>",
"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
opts
)
map(
  "n",
  "<s-tab>",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
  opts
)
map("n", "<leader>fg", ":GFiles<CR>", options)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", options)
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", options)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", options)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", options)

-- Nvimtree
map("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Comment
map("n", "<m-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
map("x", "<m-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)
