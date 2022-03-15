local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
--[[packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}--]]

return packer.startup(function(use)
	-- cmp plugins
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/cmp-nvim-lsp"
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	
	-- LSP
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"

	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- colorschemes
    use "morhetz/gruvbox"

    -- fuzzyfinder
    use "junegunn/fzf"
    use "junegunn/fzf.vim"
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- vimtest
    use 'vim-test/vim-test'

    -- debugger
    use 'szw/vim-maximizer'
    use 'puremourning/vimspector'

    -- vimwiki
    use "vimwiki/vimwiki"
    use "michal-h21/vim-zettel"
    use "mattn/calendar-vim"
    use "michal-h21/vimwiki-sync"

    -- vim airline
    use "vim-airline/vim-airline"
end
)

