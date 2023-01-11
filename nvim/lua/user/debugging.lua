local canuse = function(pkgname)
    local status, pkg = pcall(require, pkgname)
    if not status then
        vim.notify("Could not load " .. pkgname)
        return nil
    end
    return pkg
end

local dap = canuse("dap")

if dap then
    local dap_go = canuse("dap-go")
<<<<<<< HEAD
    local dap_py = canuse("dap-python")
=======
>>>>>>> 20df3bd79d60d0b4bc8302623df4076c4275e580
    local dapui = canuse("dapui")
    local icons = canuse("user.icons")

    -- dapui setup
    if dapui then
        dapui.setup {
            icons = { expanded = "▾", collapsed = "▸" },
            mappings = {
                -- Use a table to apply multiple mappings
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
            },
            -- Expand lines larger than the window
            -- Requires >= 0.7
            expand_lines = vim.fn.has "nvim-0.7",
            -- Layouts define sections of the screen to place windows.
            -- The position can be "left", "right", "top" or "bottom".
            -- The size specifies the height/width depending on position. It can be an Int
            -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
            -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
            -- Elements are the elements shown in the layout (in order).
            -- Layouts are opened in order so that earlier layouts take priority in window sizing.
            layouts = {
                {
                    elements = {
                        -- Elements can be strings or table with id and size keys.
                        { id = "scopes", size = 0.25 },
                        "breakpoints",
                        -- "stacks",
                        -- "watches",
                    },
                    size = 40, -- 40 columns
                    position = "right",
                },
                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 0.25, -- 25% of total lines
                    position = "bottom",
                },
            },
            floating = {
                max_height = nil, -- These can be integers or a float between 0 and 1.
                max_width = nil, -- Floats will be treated as percentage of your screen.
                border = "single", -- Border style. Can be "single", "double" or "rounded"
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            windows = { indent = 1 },
            render = {
                max_type_length = nil, -- Can be integer or nil.
            },
        }
    end

    -- dap go setup
    if dap_go then
        dap_go.setup({
            on_attach = function()
            end
        })
    end

<<<<<<< HEAD
    -- dap python setup
    if dap_py then
        local pyv = "/Library/Frameworks/Python.framework/Versions/3.11/bin/python3"
        dap_py.setup(pyv)
        dap_py.test_runner = 'pytest'
    end

=======
>>>>>>> 20df3bd79d60d0b4bc8302623df4076c4275e580
    -- dap setup
    vim.fn.sign_define("DapBreakpoint", { text = icons.ui.Bug, texthl = "DiagnosticSignError", linehl = "", numhl = "" })

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open {}
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close {}
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close {}
    end
end
