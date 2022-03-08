vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

local use = require("packer").use

require("packer").startup(
    function()
        use "wbthomason/packer.nvim"

        -- vimwiki
        use "vimwiki/vimwiki"
        use "michal-h21/vim-zettel"
        use "mattn/calendar-vim"
        use "michal-h21/vimwiki-sync"

        -- fuzzyfinder
        use "junegunn/fzf"
        use "junegunn/fzf.vim"
        use {
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} }
        }

        -- vim-airline
        use "vim-airline/vim-airline"

        -- nvim-lspconfig
        use "neovim/nvim-lspconfig"
        
        -- nvim-lsp-installer
        use "williamboman/nvim-lsp-installer"

        -- nvim-cmp
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"

        -- gruvbox
        use "morhetz/gruvbox"

    end
)

-- Configuring plugins

-- fuzzyfinder
require("plugins.fuzzyfinder")

-- vim-airline
require("plugins.vim-airline")

-- vimwiki
require("plugins.vimwiki")


-- nvim-lspconfig
require("plugins.nvim-lspconfig")

-- gruvbox
require("plugins.gruvbox")

-- nvim-cmp
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lspconfig = require("lspconfig")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "pyright", "tsserver", "julials", "rust_analyzer", "gopls", "html", "jsonls"  }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end


-- nvim-cmp setup
local cmp = require "cmp"
cmp.setup {
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = "nvim_lsp" },
  },
}

vim.cmd([[
sign define LspDiagnosticsSignError text=🔴
sign define LspDiagnosticsSignWarning text=🟠
sign define LspDiagnosticsSignInformation text=🔵
sign define LspDiagnosticsSignHint text=🟢
]])

