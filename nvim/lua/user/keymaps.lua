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

map("n", "<S-h>", ":bprev<CR>", options)
map("n", "<S-l>", ":bnext<CR>", options)
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

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
