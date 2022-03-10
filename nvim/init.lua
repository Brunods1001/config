require("settings")
require("maps")
require("plugins")

vim.cmd([[
colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark="hard"
]])

-- LSP
require("lspconfig").pyright.setup{}
require("lspconfig").julials.setup{}
require("lspconfig").elmls.setup{}
