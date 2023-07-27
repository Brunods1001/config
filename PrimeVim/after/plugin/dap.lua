local dap = require('dap')


dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3.11'
            end
        end
    }
}

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { '/Users/L021136/.vscode/extensions/xdebug.php-debug-1.33.0/out/phpDebug.js' }
}

-- run PHP server
dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003,
    }
}

vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp",
    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dz", "<cmd>lua require'dap'.run_last()<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.close()<CR>")

require 'dap-go'.setup({
    on_attach = function()
    end
});

require 'dap-python'.setup("python3");

require 'dapui'.setup({
    icons = {
        expanded = "▾",
        collapsed = "▸"
    },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
    },
    sidebar = {
        open_on_start = true,
        elements = {
            -- You can change the order of elements in the sidebar
            "scopes",
            "breakpoints",
            "stacks",
            "watches"
        },
        width = 40,
        position = "left" -- Can be "left" or "right"
    },
    tray = {
        open_on_start = true,
        elements = {
            "repl"
        },
        height = 10,
        position = "bottom" -- Can be "bottom" or "top"
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil   -- Floats will be treated as percentage of your screen.
    }
})
