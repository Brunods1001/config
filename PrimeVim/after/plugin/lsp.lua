local lsp = require("lsp-zero")
local ih = require('inlay-hints')
local lspconfig = require('lspconfig')

lspconfig.sourcekit.setup {
    cmd = { '/usr/bin/sourcekit-lsp' }
}

ih.setup()

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'pyright',
    'rust_analyzer',
    'julials'
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    },
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.skip_server_setup({ 'rust_analyzer', 'julials' })

-- Julia for Genie
function InitializeJuliaLSP()
    local bootstrap_path = vim.fn.getcwd() .. "/bootstrap.jl"

    if vim.fn.filereadable(bootstrap_path) == 1 then
        print("Bootstrap path found at " .. bootstrap_path)
        lsp.julials.setup({
            cmd = {
                "julia",
                "--project=" .. vim.fn.getcwd(),
                "-e", [[
                    open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                        println(io, "Which Julia: ", Base.julia_exename());
                    end
                    # Write hello to a log file at vim.fn.getcwd()
                    open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                        println(io, "Hello from Julia Language Server")
                    end
                    using LanguageServer; using Pkg; import StaticLint; import SymbolServer;
                    open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                        println(io, "Loaded packages")
                    end
                    include("]] .. bootstrap_path .. [[");
                    open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                        println(io, "Included bootstrap path");
                    end
                    env_path = dirname(Pkg.Types.Context().env.project_file);
                    server = LanguageServer.LanguageServerInstance(stdin, stdout, false, env_path, "");
                    server.runlinter = true;
                    open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                        println(io, "Server created: ", server);
                    end
                    run(server);
                ]]
            },
        })
    end
end

local bootstrap_path = vim.fn.getcwd() .. "/bootstrap.jl"
if vim.fn.filereadable(bootstrap_path) == 2 then
    print("Found bootstrap path at " .. bootstrap_path)
    lspconfig.julials.setup {
        cmd = {
            "julia",
            "--project=" .. vim.fn.getcwd(),
            "--startup-file=no",
            "--history-file=no",
            "-e", [[
        try
            open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                println(io, "Which Julia: ", Base.julia_exename());
            end
            # Write hello to a log file at vim.fn.getcwd()
            open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                println(io, "Hello from Julia Language Server");
            end
            using LanguageServer; using Pkg; import StaticLint; import SymbolServer;
            open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                println(io, "Loaded packages");
            end
            # include("]] .. bootstrap_path .. [[");
            open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                println(io, "Included bootstrap path");
            end
            env_path = dirname(Pkg.Types.Context().env.project_file);
            server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
            server.runlinter = true;
            open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                println(io, "Server created: ", stdin, stdout, env_path);
                println(io, "running backend");
            end
            using Backend;
            Backend.main();
            open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                println(io, "Backend module: ", Backend);
            end
            run(server, Backend);
        catch e
            open("]] .. vim.fn.getcwd() .. [[/hello.txt", "a") do io
                println(io, "Error: ", e, "\nType: ", typeof(e), "\nAt: ", stacktrace());
            end
        end
    ]]
        }
    }
else
    print("Did not find bootstrap path at " .. bootstrap_path)
    lspconfig.julials.setup {}
end

lsp.setup()

local rust_tools = require('rust-tools')

rust_tools.setup({
    tools = {
        on_initialized = function()
            ih.set_all()
        end,
        inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            only_current_line = false,
            parameter_hints_prefix = " <- ",
            other_hints_prefix = " => ",
            max_len_align = true,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",

        },
        hover_actions = {
            auto_focus = false,
        },

    },
    server = {
        on_attach = function(client, bufnr)
            ih.on_attach(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end
    }
})
