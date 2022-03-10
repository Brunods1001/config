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

        -- vimtest
        use 'vim-test/vim-test'

        -- debugger
        use 'szw/vim-maximizer'
        use 'puremourning/vimspector'



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
-- require("plugins.nvim-lspconfig")

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

-- vimtest
vim.cmd([[
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>L :TestLast<CR>
let test#python#strategy = "neovim"
let test#python#runner = "pytest"
]])

-- debugger
vim.cmd([[
nnoremap <leader>m :MaximizerToggle!<CR>

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GoToWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GoToWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GoToWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GoToWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GoToWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GoToWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl :call vimspector#StepInto()<CR>
nmap <leader>dj :call vimspector#StepOver()<CR>
nmap <leader>dk :call vimspector#StepOut()<CR>
nmap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc :call vimspector#RunToCursor()<CR>
nmap <leader>dbp :call vimspector#ToggleBreakpoint()<CR>
nmap <leader>dcbp :call vimspector#ToggleConditionalBreakpoint()<CR>
]])

vim.cmd([[
sign define LspDiagnosticsSignError text=🔴
sign define LspDiagnosticsSignWarning text=🟠
sign define LspDiagnosticsSignInformation text=🔵
sign define LspDiagnosticsSignHint text=🟢
]])

