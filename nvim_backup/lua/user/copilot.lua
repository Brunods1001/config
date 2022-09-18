vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.g.copilot_filetypes = {
    ["*"] = false,
    ["r"] = true,
    ["bash"] = true,
    ["zsh"] = true,
    ["javascript"] = true,
    ["elm"] = true,
    ["typescript"] = true,
    ["lua"] = false,
    ["rust"] = true,
    ["c"] = true,
    ["c#"] = true,
    ["c++"] = true,
    ["go"] = true,
    ["python"] = true,
    ["php"] = true,
    ["html"] = true,
    ["julia"] = true,
    ["sql"] = true,
}

vim.g.copilot_assume_mapped = true
