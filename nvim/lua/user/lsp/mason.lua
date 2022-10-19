local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
    return
end

local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
    return
end

local servers = {
    "elmls",
    "marksman",
    "r_language_server",
    "sqlls",
    "tailwindcss",
    "gopls",
    "emmet_ls",
    "dockerls",
    "intelephense",
    "julials",
    "sumneko_lua",
    "yamlls",
    "pyright",
    "rust_analyzer",
    "cssls",
    "clangd",
    "cssmodules_ls",
    "html",
    "jsonls",
    "tsserver",
    "bashls"
}
-- "emmet_ls",
-- "jdtls",
-- "solc",
-- "solidity_ls",
-- "tflint",
-- "terraformls",
-- "taplo",
-- "zk@v0.10.1",
-- "lemminx"

local settings = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
    ensure_installed = servers,
    automatic_installation = true,
}

local opts = {}

for _, server in pairs(servers) do
    vim.notify(server)
    opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    if server == "jsonls" then
        local jsonls_opts = require "user.lsp.settings.jsonls"
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "yamlls" then
        -- local yamlls_opts = require "user.lsp.settings.yamlls"
        -- opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
    end


    if server == "sumneko_lua" then
        -- local l_status_ok, lua_dev = pcall(require, "lua-dev")
        -- if not l_status_ok then
        --   return
        -- end
        local sumneko_opts = require "user.lsp.settings.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        -- opts = vim.tbl_deep_extend("force", require("lua-dev").setup(), opts)
        -- local luadev = lua_dev.setup {
        --   --   -- add any options here, or leave empty to use the default settings
        --   -- lspconfig = opts,
        --   lspconfig = {
        --     on_attach = opts.on_attach,
        --     capabilities = opts.capabilities,
        --     --   -- settings = opts.settings,
        --   },
        -- }
        -- lspconfig.sumneko_lua.setup(luadev)
        --goto continue
    end

    if server == "tsserver" then
        -- local tsserver_opts = require "user.lsp.settings.tsserver"
        -- opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    end

    if server == "pyright" then
        --local pyright_opts = require "user.lsp.settings.pyright"
        --opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "solc" then
        -- local solc_opts = require "user.lsp.settings.solc"
        -- opts = vim.tbl_deep_extend("force", solc_opts, opts)
    end

    if server == "emmet_ls" then
        -- local emmet_ls_opts = require "user.lsp.settings.emmet_ls"
        -- opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
    end

    if server == "zk" then
        -- local zk_opts = require "user.lsp.settings.zk"
        -- opts = vim.tbl_deep_extend("force", zk_opts, opts)
    end

    if server == "jdtls" then
        -- goto continue
    end

    if server == "julials" then
        vim.notify("Loading julials")
        -- local function lsp_setup(name, config)
        --   lspconfig[name].setup(config)
        -- end
        --
        -- lsp_setup("julials", {
        --   on_attach = on_attach,
        --   capabilities = create_capabilities(),
        -- })

    end

    if server == "marksman" then
        vim.notify("Loading marksman")
    end

    if server == "rust_analyzer" then
        local rust_opts = require "user.lsp.settings.rust"
        -- opts = vim.tbl_deep_extend("force", rust_opts, opts)
        local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
        if not rust_tools_status_ok then
            return
        end

        rust_tools.setup(rust_opts)
        goto continue
    end

    ::continue::
    lspconfig[server].setup(opts)
end

-- TODO: add something to installer later
-- require("lspconfig").motoko.setup {}
-- require("lspconfig").motoko.setup {}
