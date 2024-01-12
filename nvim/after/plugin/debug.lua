local dap = require('dap')

require('dapui').setup()



dap.adapters.rust = {
    type = 'executable',
    attach = {
        pidProperty = "pid",
        pidSelect = "ask"
    },
    command = '/Users/brunodossantos/.cargo/bin/rust-gdb',
    env = {
        RUST_BACKTRACE = 1
    },
    name = "rust-gdb"
}
dap.configurations.rust = {
    {
        type = 'rust',
        request = 'launch',
        name = "Launch file",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
    },
}


local dap_python = require('dap-python')
dap_python.test_runner = 'pytest'
dap_python.setup('/opt/homebrew/bin/python3')

require('dap-go').setup({
    on_attach = function()
    end
})


-- remaps
vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dj', '<cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dk', '<cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dh', '<cmd>lua require"dap".run_last()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>di', '<cmd>lua require"dap.ui.variables".hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>de', '<cmd>lua require"dap.ui.variables".scopes()<CR>', { noremap = true, silent = true })
