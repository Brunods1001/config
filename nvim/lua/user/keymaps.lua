local map = vim.api.nvim_set_keymap
local options = { noremap = true }
local opts = { noremap = true, silent = true }


-- map("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- change directory
map("n", "<leader>cd", ":cd %:p:h<CR>", options)

map("n", "<C-w>", ":w<CR>", options)
map("n", "<C-q>", ":q<CR>", options)

map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)

map("n", "<C-s>", ":split<CR>", options)
map("n", "<C-v>", ":vsplit<CR>", options)

<<<<<<< HEAD
map("n", "<S-h>", ":bprev<CR>", options)
map("n", "<S-l>", ":bnext<CR>", options)
=======
map("n", "<leader><Left>", ":bprev<CR>", options)
map("n", "<leader><Right>", ":bnext<CR>", options)
>>>>>>> 20df3bd79d60d0b4bc8302623df4076c4275e580
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

-- Maximizer
map("n", "<C-m>", ":MaximizerToggle<CR>", opts)
-- map("i", "<C-m>", ":MaximizerToggle<CR>", opts)
-- map("v", "<C-m>", ":MaximizerToggle<CR>", opts)

-- Presentation
map("n", "<C-]>v", ":set spell! spelllang=en_us<CR>", opts)
<<<<<<< HEAD
--
-- Copilot
-- vim.g.copilot_filetypes = {
--   ["*"] = false,
-- }

vim.cmd [[
  imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]]


-- ToggleTerm
-- ToggleTermSendCurrentLine
map("n", "<leader>tl", ":ToggleTermSendCurrentLine<CR>", opts)
-- ToggleTermSendVisualSelection
map("v", "<leader>tt", ":ToggleTermSendVisualSelection<CR>", opts)
-- ToggleTermSendVisualLines
map("n", "<leader>tv", ":ToggleTermSendVisualLines<CR>", opts)
-- Select all text in file
map("n", "<leader>ta", "ggVG:ToggleTermSendVisualSelection<CR><C-o>", opts)

=======
>>>>>>> 20df3bd79d60d0b4bc8302623df4076c4275e580
