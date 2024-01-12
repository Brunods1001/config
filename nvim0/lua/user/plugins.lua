local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"


if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer. Close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

return require("packer").startup(function(use)

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- colorscheme
    use "sainnhe/sonokai"
    use "folke/tokyonight.nvim"

    -- leap
    use "ggandor/leap.nvim"

    -- FZF
    use "junegunn/fzf"
    use "junegunn/fzf.vim"

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"
    -- Auto pairs
    use "windwp/nvim-autopairs"
    -- Rainbow
    use "p00f/nvim-ts-rainbow"

    -- cmp plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    -- use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- LSP
    use {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- "williamboman/nvim-lsp-installer",
    }
    use "simrat39/rust-tools.nvim"
    use "lvimuser/lsp-inlayhints.nvim"
    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
    -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- LSP Signature
    use "ray-x/lsp_signature.nvim"

    -- Toggleterm
    use { "akinsho/toggleterm.nvim", tag = "*", config = function()
        require("toggleterm").setup()
    end }

    -- status line
    use "kyazdani42/nvim-web-devicons"
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- Telescope
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- Greeter
    use {
        "goolord/alpha-nvim",
        config = function()
            require "alpha".setup(require "alpha.themes.dashboard".config)
        end
    }

    -- Illuminate words
    use "RRethy/vim-illuminate"

    -- NvimTree
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly" -- optional, updated every week. (see issue #1193)
    }

    -- comments
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }
    -- use {
    --     "folke/todo-comments.nvim",
    --     requires = "nvim-lua/plenary.nvim",
    --     config = function()
    --         require("todo-comments").setup {
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --         }
    --     end
    -- }

    -- Git
    use "lewis6991/gitsigns.nvim"
    use "f-person/git-blame.nvim"
    use "ruifm/gitlinker.nvim"
    use "mattn/vim-gist"
    use "mattn/webapi-vim"

    -- statusline
    -- use {
    --     "SmiteshP/nvim-navic",
    --     requires = "neovim/nvim-lspconfig"
    -- }

    -- using packer.nvim
    use { "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" }

    -- whichkey
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- css
    use "ap/vim-css-color"

    -- Julia
    use "JuliaEditorSupport/julia-vim"

    -- Maximize panes
    use "szw/vim-maximizer"

    -- Buffers
    use "matbme/JABS.nvim"

    -- Debugging
    use "mfussenegger/nvim-dap"
    use "leoluz/nvim-dap-go"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    -- Presentations
    use "gyim/vim-boxdraw"

    -- Journal
    use "vimwiki/vimwiki"
    use "michal-h21/vim-zettel"

    -- copilot
    use "github/copilot.vim"

    -- zen mode and twilight
    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {
                {
                    dimming = {
                        alpha = 0.25, -- amount of dimming
                        -- we try to get the foreground from the highlight groups or fallback color
                        color = { "Normal", "#ffffff" },
                        term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
                        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
                    },
                    context = 10, -- amount of lines we will try to show around the current line
                    treesitter = true, -- use treesitter when available for the filetype
                    -- treesitter is used to automatically expand the visible text,
                    -- but you can further control the types of nodes that should always be fully expanded
                    expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
                        "function",
                        "method",
                        "table",
                        "if_statement",
                    },
                    exclude = {}, -- exclude these filetypes
                }
            }
        end
    }
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                window = {
                    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    width = 120, -- width of the Zen window
                    height = 1, -- height of the Zen window
                    options = {
                        signcolumn = "no", -- disable signcolumn
                        number = false, -- disable number column
                        relativenumber = false, -- disable relative numbers
                        cursorline = false, -- disable cursorline
                        cursorcolumn = false, -- disable cursor column
                        foldcolumn = "0", -- disable fold column
                        list = false, -- disable whitespace characters
                    },
                },
                plugins = {
                    gitsigns = { enabled = false }, -- disables git signs
                    tmux = { enabled = false }, -- disables the tmux statusline
                    twilight = { enabled = true }, -- enables twilight
                    -- it is recommended to disable the default twilight plugin and use this one
                    -- as it uses `winblend` which is much more efficient than the default plugin
                },
            }
        end
    }

    -- GIT

    use "tpope/vim-fugitive"

    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            require "octo".setup({
                default_remote = { "upstream", "origin" }; -- order to try remotes
                ssh_aliases = {}, -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
                reaction_viewer_hint_icon = ""; -- marker for user reactions
                user_icon = " "; -- user icon
                timeline_marker = ""; -- timeline marker
                timeline_indent = "2"; -- timeline indentation
                right_bubble_delimiter = ""; -- bubble delimiter
                left_bubble_delimiter = ""; -- bubble delimiter
                github_hostname = ""; -- GitHub Enterprise host
                snippet_context_lines = 4; -- number or lines around commented lines
                gh_env = {}, -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
                issues = {
                    order_by = { -- criteria to sort results of `Octo issue list`
                        field = "CREATED_AT", -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
                        direction = "DESC" -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
                    }
                },
                pull_requests = {
                    order_by = { -- criteria to sort the results of `Octo pr list`
                        field = "CREATED_AT", -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
                        direction = "DESC" -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
                    },
                    always_select_remote_on_create = "false" -- always give prompt to select base remote repo when creating PRs
                },
                file_panel = {
                    size = 10, -- changed files panel rows
                    use_icons = true -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
                },
                mappings = {
                    issue = {
                        close_issue = { lhs = "<space>ic", desc = "close issue" },
                        reopen_issue = { lhs = "<space>io", desc = "reopen issue" },
                        list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
                        reload = { lhs = "<C-r>", desc = "reload issue" },
                        open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
                        copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
                        add_assignee = { lhs = "<space>aa", desc = "add assignee" },
                        remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
                        create_label = { lhs = "<space>lc", desc = "create label" },
                        add_label = { lhs = "<space>la", desc = "add label" },
                        remove_label = { lhs = "<space>ld", desc = "remove label" },
                        goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
                        add_comment = { lhs = "<space>ca", desc = "add comment" },
                        delete_comment = { lhs = "<space>cd", desc = "delete comment" },
                        next_comment = { lhs = "]c", desc = "go to next comment" },
                        prev_comment = { lhs = "[c", desc = "go to previous comment" },
                        react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
                        react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
                        react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
                        react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
                        react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
                        react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
                        react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
                        react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
                    },
                    pull_request = {
                        checkout_pr = { lhs = "<space>po", desc = "checkout PR" },
                        merge_pr = { lhs = "<space>pm", desc = "merge commit PR" },
                        squash_and_merge_pr = { lhs = "<space>psm", desc = "squash and merge PR" },
                        list_commits = { lhs = "<space>pc", desc = "list PR commits" },
                        list_changed_files = { lhs = "<space>pf", desc = "list PR changed files" },
                        show_pr_diff = { lhs = "<space>pd", desc = "show PR diff" },
                        add_reviewer = { lhs = "<space>va", desc = "add reviewer" },
                        remove_reviewer = { lhs = "<space>vd", desc = "remove reviewer request" },
                        close_issue = { lhs = "<space>ic", desc = "close PR" },
                        reopen_issue = { lhs = "<space>io", desc = "reopen PR" },
                        list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
                        reload = { lhs = "<C-r>", desc = "reload PR" },
                        open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
                        copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
                        goto_file = { lhs = "gf", desc = "go to file" },
                        add_assignee = { lhs = "<space>aa", desc = "add assignee" },
                        remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
                        create_label = { lhs = "<space>lc", desc = "create label" },
                        add_label = { lhs = "<space>la", desc = "add label" },
                        remove_label = { lhs = "<space>ld", desc = "remove label" },
                        goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
                        add_comment = { lhs = "<space>ca", desc = "add comment" },
                        delete_comment = { lhs = "<space>cd", desc = "delete comment" },
                        next_comment = { lhs = "]c", desc = "go to next comment" },
                        prev_comment = { lhs = "[c", desc = "go to previous comment" },
                        react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
                        react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
                        react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
                        react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
                        react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
                        react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
                        react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
                        react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
                    },
                    review_thread = {
                        goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
                        add_comment = { lhs = "<space>ca", desc = "add comment" },
                        add_suggestion = { lhs = "<space>sa", desc = "add suggestion" },
                        delete_comment = { lhs = "<space>cd", desc = "delete comment" },
                        next_comment = { lhs = "]c", desc = "go to next comment" },
                        prev_comment = { lhs = "[c", desc = "go to previous comment" },
                        select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
                        select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
                        close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
                        react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
                        react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
                        react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
                        react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
                        react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
                        react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
                        react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
                        react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
                    },
                    submit_win = {
                        approve_review = { lhs = "<C-a>", desc = "approve review" },
                        comment_review = { lhs = "<C-m>", desc = "comment review" },
                        request_changes = { lhs = "<C-r>", desc = "request changes review" },
                        close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
                    },
                    review_diff = {
                        add_review_comment = { lhs = "<space>ca", desc = "add a new review comment" },
                        add_review_suggestion = { lhs = "<space>sa", desc = "add a new review suggestion" },
                        focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
                        toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
                        next_thread = { lhs = "]t", desc = "move to next thread" },
                        prev_thread = { lhs = "[t", desc = "move to previous thread" },
                        select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
                        select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
                        close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
                        toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
                    },
                    file_panel = {
                        next_entry = { lhs = "j", desc = "move to next changed file" },
                        prev_entry = { lhs = "k", desc = "move to previous changed file" },
                        select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
                        refresh_files = { lhs = "R", desc = "refresh changed files panel" },
                        focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
                        toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
                        select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
                        select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
                        close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
                        toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
                    }
                }
            })
        end
    }


end)
