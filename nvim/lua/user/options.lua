vim.o.backup = false
vim.o.wrap = true
vim.o.showcmd = true
vim.o.showmode = true
vim.o.showmatch = false

-- indent
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smarttab = true

-- search
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true

-- text
vim.o.encoding = "utf-8"
vim.o.linebreak = true
vim.o.scrolloff = 8

-- ui
vim.o.ruler = true
vim.o.wildmenu = true
vim.o.cursorline = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.errorbells = false
vim.o.mouse = "a"
vim.o.title = true
vim.opt.colorcolumn = "80"

-- code folding
vim.o.foldenable = false
vim.o.foldmethod = "indent"
vim.o.foldnestmax = 3

-- misc
vim.o.confirm = true
vim.o.hidden = true -- hides buffers (needed for toggleterm)
vim.o.swapfile = false

vim.cmd([[
syntax enable

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
]])
