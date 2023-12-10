print("Loading packer")
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- colors
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use "artanikin/vim-synthwave84"
    use "folke/tokyonight.nvim"
    use "morhetz/gruvbox"
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "svermeulen/text-to-colorscheme.nvim" }
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context")
    --
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("tpope/vim-commentary")
    -- lsp
    use { "jay-babu/mason-nvim-dap.nvim",
        requires = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        }
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    -- julia
    use 'JuliaEditorSupport/julia-vim'

    use "simrat39/inlay-hints.nvim"
    -- use "lvimuser/lsp-inlayhints.nvim"
    use "simrat39/rust-tools.nvim"
    use "nvim-lua/plenary.nvim"
    --
    use "github/copilot.vim"
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    use {
        's1n7ax/nvim-window-picker',
        tag = 'v2.*',
        config = function()
            require 'window-picker'.setup()
        end,
    }
    use {
        "vimwiki/vimwiki",
        config = function()
            vim.g.vimwiki_list = {
                {
                    path = "~/vimwiki/",
                    syntax = "markdown",
                    ext = ".md",
                    custom_wiki2html = 'vimwiki_markdown',
                },
            }
        end
    }
    use "jremmen/vim-ripgrep"
    use "michal-h21/vim-zettel"
    use "junegunn/fzf"
    use "junegunn/fzf.vim"
    use "folke/zen-mode.nvim"
    --
    -- Debugging
    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-dap-python"
    use "leoluz/nvim-dap-go"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
