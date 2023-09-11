local mason = require('mason')

mason.setup({
    ensure_installed = {
        'clangd',
        'pyright',
        'black',
        'codelldb',
    }
})

require("mason-nvim-dap").setup({
    ensure_installed = {
        'codelldb',
    }
})
