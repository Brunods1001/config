-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/L021136/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/L021136/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/L021136/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/L021136/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/L021136/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["JABS.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/JABS.nvim",
    url = "https://github.com/matbme/JABS.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\na\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\27alpha.themes.dashboard\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitlinker.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["julia-vim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/julia-vim",
    url = "https://github.com/JuliaEditorSupport/julia-vim"
  },
  ["leap.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-inlayhints.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/lsp-inlayhints.nvim",
    url = "https://github.com/lvimuser/lsp-inlayhints.nvim"
  },
  ["lsp_lines.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\nå0\0\0\6\0³\1\0é\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0024\3\0\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\r\0005\4\f\0=\4\n\3=\3\14\0025\3\15\0=\3\16\0025\3B\0005\4\18\0005\5\17\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\0045\5\30\0=\5\31\0045\5 \0=\5!\0045\5\"\0=\5#\0045\5$\0=\5%\0045\5&\0=\5'\0045\5(\0=\5)\0045\5*\0=\5+\0045\5,\0=\5-\0045\5.\0=\5/\0045\0050\0=\0051\0045\0052\0=\0053\0045\0054\0=\0055\0045\0056\0=\0057\0045\0058\0=\0059\0045\5:\0=\5;\0045\5<\0=\5=\0045\5>\0=\5?\0045\5@\0=\5A\4=\4C\0035\4E\0005\5D\0=\5F\0045\5G\0=\5H\0045\5I\0=\5J\0045\5K\0=\5L\0045\5M\0=\5N\0045\5O\0=\5P\0045\5Q\0=\5R\0045\5S\0=\5T\0045\5U\0=\5\19\0045\5V\0=\5\21\0045\5W\0=\5\23\0045\5X\0=\5\25\0045\5Y\0=\5\27\0045\5Z\0=\5\29\0045\5[\0=\5\\\0045\5]\0=\5\31\0045\5^\0=\5!\0045\5_\0=\5#\0045\5`\0=\5%\0045\5a\0=\5'\0045\5b\0=\5)\0045\5c\0=\5+\0045\5d\0=\5-\0045\5e\0=\5/\0045\5f\0=\0051\0045\5g\0=\0053\0045\5h\0=\0055\0045\5i\0=\0057\0045\5j\0=\0059\0045\5k\0=\5;\0045\5l\0=\5=\0045\5m\0=\5?\0045\5n\0=\5A\4=\4o\0035\4q\0005\5p\0=\5)\0045\5r\0=\5+\0045\5s\0=\5t\0045\5u\0=\5-\0045\5v\0=\5/\0045\5w\0=\0051\0045\5x\0=\5y\0045\5z\0=\5{\0045\5|\0=\5}\0045\5~\0=\0053\0045\5\127\0=\0055\0045\5€\0=\0057\0045\5\0=\0059\0045\5‚\0=\5;\0045\5ƒ\0=\5=\0045\5„\0=\5?\0045\5…\0=\5A\4=\4†\0035\4ˆ\0005\5‡\0=\5‰\0045\5Š\0=\5‹\0045\5Œ\0=\5\0045\5\0=\5}\4=\4\0035\4‘\0005\5\0=\5’\0045\5“\0=\5”\0045\5•\0=\5–\0045\5—\0=\5˜\0045\5™\0=\5š\0045\5›\0=\5œ\0045\5\0=\5y\0045\5\0=\5{\0045\5Ÿ\0=\5}\0045\5 \0=\5¡\4=\4¢\0035\4¤\0005\5£\0=\5¥\0045\5¦\0=\5§\0045\5¨\0=\5©\0045\5ª\0=\5«\0045\5¬\0=\5–\0045\5­\0=\5˜\0045\5®\0=\5y\0045\5¯\0=\5{\0045\5°\0=\5}\0045\5±\0=\5¡\4=\4\16\3=\3²\2B\0\2\1K\0\1\0\rmappings\1\0\2\blhs\20<leader><space>\tdesc\31toggle viewer viewed state\1\0\2\blhs\n<C-c>\tdesc\21close review tab\1\0\2\blhs\a[q\tdesc\30move to next changed file\1\0\2\blhs\a]q\tdesc\"move to previous changed file\1\0\2\blhs\14<leader>b\tdesc\"hide/show changed files panel\1\0\2\blhs\14<leader>e\tdesc%move focus to changed file panel\18refresh_files\1\0\2\blhs\6R\tdesc refresh changed files panel\17select_entry\1\0\2\blhs\t<cr>\tdesc%show selected changed file diffs\15prev_entry\1\0\2\blhs\6k\tdesc\"move to previous changed file\15next_entry\1\0\0\1\0\2\blhs\6j\tdesc\30move to next changed file\16review_diff\18toggle_viewed\1\0\2\blhs\20<leader><space>\tdesc\31toggle viewer viewed state\1\0\2\blhs\n<C-c>\tdesc\21close review tab\1\0\2\blhs\a[q\tdesc\30move to next changed file\1\0\2\blhs\a]q\tdesc\"move to previous changed file\16prev_thread\1\0\2\blhs\a[t\tdesc\28move to previous thread\16next_thread\1\0\2\blhs\a]t\tdesc\24move to next thread\17toggle_files\1\0\2\blhs\14<leader>b\tdesc\"hide/show changed files panel\16focus_files\1\0\2\blhs\14<leader>e\tdesc%move focus to changed file panel\26add_review_suggestion\1\0\2\blhs\14<space>sa\tdesc add a new review suggestion\23add_review_comment\1\0\0\1\0\2\blhs\14<space>ca\tdesc\29add a new review comment\15submit_win\1\0\2\blhs\n<C-c>\tdesc\21close review tab\20request_changes\1\0\2\blhs\n<C-r>\tdesc\27request changes review\19comment_review\1\0\2\blhs\n<C-m>\tdesc\19comment review\19approve_review\1\0\0\1\0\2\blhs\n<C-a>\tdesc\19approve review\18review_thread\1\0\2\blhs\14<space>rc\tdesc\29add/remove ğŸ˜• reaction\1\0\2\blhs\14<space>rl\tdesc\29add/remove ğŸ˜„ reaction\1\0\2\blhs\14<space>rr\tdesc\29add/remove ğŸš€ reaction\1\0\2\blhs\14<space>r-\tdesc\29add/remove ğŸ‘ reaction\1\0\2\blhs\14<space>r+\tdesc\29add/remove ğŸ‘ reaction\1\0\2\blhs\14<space>re\tdesc\29add/remove ğŸ‘€ reaction\1\0\2\blhs\14<space>rh\tdesc\31add/remove â¤ï¸ reaction\1\0\2\blhs\14<space>rp\tdesc\29add/remove ğŸ‰ reaction\21close_review_tab\1\0\2\blhs\n<C-c>\tdesc\21close review tab\22select_prev_entry\1\0\2\blhs\a[q\tdesc\30move to next changed file\22select_next_entry\1\0\2\blhs\a]q\tdesc\"move to previous changed file\1\0\2\blhs\a[c\tdesc\27go to previous comment\1\0\2\blhs\a]c\tdesc\23go to next comment\1\0\2\blhs\14<space>cd\tdesc\19delete comment\19add_suggestion\1\0\2\blhs\14<space>sa\tdesc\19add suggestion\1\0\2\blhs\14<space>ca\tdesc\16add comment\1\0\0\1\0\2\blhs\14<space>gi\tdesc#navigate to a local repo issue\17pull_request\1\0\2\blhs\14<space>rc\tdesc\29add/remove ğŸ˜• reaction\1\0\2\blhs\14<space>rl\tdesc\29add/remove ğŸ˜„ reaction\1\0\2\blhs\14<space>rr\tdesc\29add/remove ğŸš€ reaction\1\0\2\blhs\14<space>r-\tdesc\29add/remove ğŸ‘ reaction\1\0\2\blhs\14<space>r+\tdesc\29add/remove ğŸ‘ reaction\1\0\2\blhs\14<space>re\tdesc\29add/remove ğŸ‘€ reaction\1\0\2\blhs\14<space>rh\tdesc\31add/remove â¤ï¸ reaction\1\0\2\blhs\14<space>rp\tdesc\29add/remove ğŸ‰ reaction\1\0\2\blhs\a[c\tdesc\27go to previous comment\1\0\2\blhs\a]c\tdesc\23go to next comment\1\0\2\blhs\14<space>cd\tdesc\19delete comment\1\0\2\blhs\14<space>ca\tdesc\16add comment\1\0\2\blhs\14<space>gi\tdesc#navigate to a local repo issue\1\0\2\blhs\14<space>ld\tdesc\17remove label\1\0\2\blhs\14<space>la\tdesc\14add label\1\0\2\blhs\14<space>lc\tdesc\17create label\1\0\2\blhs\14<space>ad\tdesc\20remove assignee\1\0\2\blhs\14<space>aa\tdesc\17add assignee\14goto_file\1\0\2\blhs\agf\tdesc\15go to file\1\0\2\blhs\n<C-y>\tdesc!copy url to system clipboard\1\0\2\blhs\n<C-b>\tdesc\23open PR in browser\1\0\2\blhs\n<C-r>\tdesc\14reload PR\1\0\2\blhs\14<space>il\tdesc\"list open issues on same repo\1\0\2\blhs\14<space>io\tdesc\14reopen PR\1\0\2\blhs\14<space>ic\tdesc\rclose PR\20remove_reviewer\1\0\2\blhs\14<space>vd\tdesc\28remove reviewer request\17add_reviewer\1\0\2\blhs\14<space>va\tdesc\17add reviewer\17show_pr_diff\1\0\2\blhs\14<space>pd\tdesc\17show PR diff\23list_changed_files\1\0\2\blhs\14<space>pf\tdesc\26list PR changed files\17list_commits\1\0\2\blhs\14<space>pc\tdesc\20list PR commits\24squash_and_merge_pr\1\0\2\blhs\15<space>psm\tdesc\24squash and merge PR\rmerge_pr\1\0\2\blhs\14<space>pm\tdesc\20merge commit PR\16checkout_pr\1\0\0\1\0\2\blhs\14<space>po\tdesc\16checkout PR\nissue\1\0\0\19react_confused\1\0\2\blhs\14<space>rc\tdesc\29add/remove ğŸ˜• reaction\16react_laugh\1\0\2\blhs\14<space>rl\tdesc\29add/remove ğŸ˜„ reaction\17react_rocket\1\0\2\blhs\14<space>rr\tdesc\29add/remove ğŸš€ reaction\22react_thumbs_down\1\0\2\blhs\14<space>r-\tdesc\29add/remove ğŸ‘ reaction\20react_thumbs_up\1\0\2\blhs\14<space>r+\tdesc\29add/remove ğŸ‘ reaction\15react_eyes\1\0\2\blhs\14<space>re\tdesc\29add/remove ğŸ‘€ reaction\16react_heart\1\0\2\blhs\14<space>rh\tdesc\31add/remove â¤ï¸ reaction\17react_hooray\1\0\2\blhs\14<space>rp\tdesc\29add/remove ğŸ‰ reaction\17prev_comment\1\0\2\blhs\a[c\tdesc\27go to previous comment\17next_comment\1\0\2\blhs\a]c\tdesc\23go to next comment\19delete_comment\1\0\2\blhs\14<space>cd\tdesc\19delete comment\16add_comment\1\0\2\blhs\14<space>ca\tdesc\16add comment\15goto_issue\1\0\2\blhs\14<space>gi\tdesc#navigate to a local repo issue\17remove_label\1\0\2\blhs\14<space>ld\tdesc\17remove label\14add_label\1\0\2\blhs\14<space>la\tdesc\14add label\17create_label\1\0\2\blhs\14<space>lc\tdesc\17create label\20remove_assignee\1\0\2\blhs\14<space>ad\tdesc\20remove assignee\17add_assignee\1\0\2\blhs\14<space>aa\tdesc\17add assignee\rcopy_url\1\0\2\blhs\n<C-y>\tdesc!copy url to system clipboard\20open_in_browser\1\0\2\blhs\n<C-b>\tdesc\26open issue in browser\vreload\1\0\2\blhs\n<C-r>\tdesc\17reload issue\16list_issues\1\0\2\blhs\14<space>il\tdesc\"list open issues on same repo\17reopen_issue\1\0\2\blhs\14<space>io\tdesc\17reopen issue\16close_issue\1\0\0\1\0\2\blhs\14<space>ic\tdesc\16close issue\15file_panel\1\0\2\14use_icons\2\tsize\3\n\18pull_requests\1\0\1#always_select_remote_on_create\nfalse\1\0\2\nfield\15CREATED_AT\14direction\tDESC\vissues\rorder_by\1\0\0\1\0\2\nfield\15CREATED_AT\14direction\tDESC\vgh_env\16ssh_aliases\19default_remote\1\0\b\20timeline_indent\0062\20github_hostname\5\20timeline_marker\bï‘ \14user_icon\tïŠ½ \30reaction_viewer_hint_icon\bï‘„\26snippet_context_lines\3\4\26left_bubble_delimiter\bî‚¶\27right_bubble_delimiter\bî‚´\1\3\0\0\rupstream\vorigin\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\nü\1\0\0\6\0\v\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0034\4\0\0=\4\n\3>\3\1\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\3\n\15treesitter\2\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\3\fterm_bg\f#000000\nalpha\4\0€€Àş\3\rinactive\1\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["vim-boxdraw"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/vim-boxdraw",
    url = "https://github.com/gyim/vim-boxdraw"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/vim-css-color",
    url = "https://github.com/ap/vim-css-color"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gist"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/vim-gist",
    url = "https://github.com/mattn/vim-gist"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/vim-maximizer",
    url = "https://github.com/szw/vim-maximizer"
  },
  ["vim-zettel"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/vim-zettel",
    url = "https://github.com/michal-h21/vim-zettel"
  },
  vimwiki = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/webapi-vim",
    url = "https://github.com/mattn/webapi-vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nÀ\2\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\fplugins\rtwilight\1\0\1\fenabled\2\ttmux\1\0\1\fenabled\1\rgitsigns\1\0\0\1\0\1\fenabled\1\vwindow\1\0\0\foptions\1\0\a\vnumber\1\19relativenumber\1\15cursorline\1\tlist\1\15foldcolumn\0060\17cursorcolumn\1\15signcolumn\ano\1\0\3\vheight\3\1\nwidth\3x\rbackdrop\4æÌ™³\6æÌ¹ÿ\3\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/L021136/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\na\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\27alpha.themes.dashboard\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nÀ\2\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\fplugins\rtwilight\1\0\1\fenabled\2\ttmux\1\0\1\fenabled\1\rgitsigns\1\0\0\1\0\1\fenabled\1\vwindow\1\0\0\foptions\1\0\a\vnumber\1\19relativenumber\1\15cursorline\1\tlist\1\15foldcolumn\0060\17cursorcolumn\1\15signcolumn\ano\1\0\3\vheight\3\1\nwidth\3x\rbackdrop\4æÌ™³\6æÌ¹ÿ\3\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\nü\1\0\0\6\0\v\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\0035\4\b\0=\4\t\0034\4\0\0=\4\n\3>\3\1\2B\0\2\1K\0\1\0\fexclude\vexpand\1\5\0\0\rfunction\vmethod\ntable\17if_statement\fdimming\1\0\2\fcontext\3\n\15treesitter\2\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\3\fterm_bg\f#000000\nalpha\4\0€€Àş\3\rinactive\1\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\nå0\0\0\6\0³\1\0é\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\0\0=\3\6\0024\3\0\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\0025\3\r\0005\4\f\0=\4\n\3=\3\14\0025\3\15\0=\3\16\0025\3B\0005\4\18\0005\5\17\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\0045\5\30\0=\5\31\0045\5 \0=\5!\0045\5\"\0=\5#\0045\5$\0=\5%\0045\5&\0=\5'\0045\5(\0=\5)\0045\5*\0=\5+\0045\5,\0=\5-\0045\5.\0=\5/\0045\0050\0=\0051\0045\0052\0=\0053\0045\0054\0=\0055\0045\0056\0=\0057\0045\0058\0=\0059\0045\5:\0=\5;\0045\5<\0=\5=\0045\5>\0=\5?\0045\5@\0=\5A\4=\4C\0035\4E\0005\5D\0=\5F\0045\5G\0=\5H\0045\5I\0=\5J\0045\5K\0=\5L\0045\5M\0=\5N\0045\5O\0=\5P\0045\5Q\0=\5R\0045\5S\0=\5T\0045\5U\0=\5\19\0045\5V\0=\5\21\0045\5W\0=\5\23\0045\5X\0=\5\25\0045\5Y\0=\5\27\0045\5Z\0=\5\29\0045\5[\0=\5\\\0045\5]\0=\5\31\0045\5^\0=\5!\0045\5_\0=\5#\0045\5`\0=\5%\0045\5a\0=\5'\0045\5b\0=\5)\0045\5c\0=\5+\0045\5d\0=\5-\0045\5e\0=\5/\0045\5f\0=\0051\0045\5g\0=\0053\0045\5h\0=\0055\0045\5i\0=\0057\0045\5j\0=\0059\0045\5k\0=\5;\0045\5l\0=\5=\0045\5m\0=\5?\0045\5n\0=\5A\4=\4o\0035\4q\0005\5p\0=\5)\0045\5r\0=\5+\0045\5s\0=\5t\0045\5u\0=\5-\0045\5v\0=\5/\0045\5w\0=\0051\0045\5x\0=\5y\0045\5z\0=\5{\0045\5|\0=\5}\0045\5~\0=\0053\0045\5\127\0=\0055\0045\5€\0=\0057\0045\5\0=\0059\0045\5‚\0=\5;\0045\5ƒ\0=\5=\0045\5„\0=\5?\0045\5…\0=\5A\4=\4†\0035\4ˆ\0005\5‡\0=\5‰\0045\5Š\0=\5‹\0045\5Œ\0=\5\0045\5\0=\5}\4=\4\0035\4‘\0005\5\0=\5’\0045\5“\0=\5”\0045\5•\0=\5–\0045\5—\0=\5˜\0045\5™\0=\5š\0045\5›\0=\5œ\0045\5\0=\5y\0045\5\0=\5{\0045\5Ÿ\0=\5}\0045\5 \0=\5¡\4=\4¢\0035\4¤\0005\5£\0=\5¥\0045\5¦\0=\5§\0045\5¨\0=\5©\0045\5ª\0=\5«\0045\5¬\0=\5–\0045\5­\0=\5˜\0045\5®\0=\5y\0045\5¯\0=\5{\0045\5°\0=\5}\0045\5±\0=\5¡\4=\4\16\3=\3²\2B\0\2\1K\0\1\0\rmappings\1\0\2\blhs\20<leader><space>\tdesc\31toggle viewer viewed state\1\0\2\blhs\n<C-c>\tdesc\21close review tab\1\0\2\blhs\a[q\tdesc\30move to next changed file\1\0\2\blhs\a]q\tdesc\"move to previous changed file\1\0\2\blhs\14<leader>b\tdesc\"hide/show changed files panel\1\0\2\blhs\14<leader>e\tdesc%move focus to changed file panel\18refresh_files\1\0\2\blhs\6R\tdesc refresh changed files panel\17select_entry\1\0\2\blhs\t<cr>\tdesc%show selected changed file diffs\15prev_entry\1\0\2\blhs\6k\tdesc\"move to previous changed file\15next_entry\1\0\0\1\0\2\blhs\6j\tdesc\30move to next changed file\16review_diff\18toggle_viewed\1\0\2\blhs\20<leader><space>\tdesc\31toggle viewer viewed state\1\0\2\blhs\n<C-c>\tdesc\21close review tab\1\0\2\blhs\a[q\tdesc\30move to next changed file\1\0\2\blhs\a]q\tdesc\"move to previous changed file\16prev_thread\1\0\2\blhs\a[t\tdesc\28move to previous thread\16next_thread\1\0\2\blhs\a]t\tdesc\24move to next thread\17toggle_files\1\0\2\blhs\14<leader>b\tdesc\"hide/show changed files panel\16focus_files\1\0\2\blhs\14<leader>e\tdesc%move focus to changed file panel\26add_review_suggestion\1\0\2\blhs\14<space>sa\tdesc add a new review suggestion\23add_review_comment\1\0\0\1\0\2\blhs\14<space>ca\tdesc\29add a new review comment\15submit_win\1\0\2\blhs\n<C-c>\tdesc\21close review tab\20request_changes\1\0\2\blhs\n<C-r>\tdesc\27request changes review\19comment_review\1\0\2\blhs\n<C-m>\tdesc\19comment review\19approve_review\1\0\0\1\0\2\blhs\n<C-a>\tdesc\19approve review\18review_thread\1\0\2\blhs\14<space>rc\tdesc\29add/remove ğŸ˜• reaction\1\0\2\blhs\14<space>rl\tdesc\29add/remove ğŸ˜„ reaction\1\0\2\blhs\14<space>rr\tdesc\29add/remove ğŸš€ reaction\1\0\2\blhs\14<space>r-\tdesc\29add/remove ğŸ‘ reaction\1\0\2\blhs\14<space>r+\tdesc\29add/remove ğŸ‘ reaction\1\0\2\blhs\14<space>re\tdesc\29add/remove ğŸ‘€ reaction\1\0\2\blhs\14<space>rh\tdesc\31add/remove â¤ï¸ reaction\1\0\2\blhs\14<space>rp\tdesc\29add/remove ğŸ‰ reaction\21close_review_tab\1\0\2\blhs\n<C-c>\tdesc\21close review tab\22select_prev_entry\1\0\2\blhs\a[q\tdesc\30move to next changed file\22select_next_entry\1\0\2\blhs\a]q\tdesc\"move to previous changed file\1\0\2\blhs\a[c\tdesc\27go to previous comment\1\0\2\blhs\a]c\tdesc\23go to next comment\1\0\2\blhs\14<space>cd\tdesc\19delete comment\19add_suggestion\1\0\2\blhs\14<space>sa\tdesc\19add suggestion\1\0\2\blhs\14<space>ca\tdesc\16add comment\1\0\0\1\0\2\blhs\14<space>gi\tdesc#navigate to a local repo issue\17pull_request\1\0\2\blhs\14<space>rc\tdesc\29add/remove ğŸ˜• reaction\1\0\2\blhs\14<space>rl\tdesc\29add/remove ğŸ˜„ reaction\1\0\2\blhs\14<space>rr\tdesc\29add/remove ğŸš€ reaction\1\0\2\blhs\14<space>r-\tdesc\29add/remove ğŸ‘ reaction\1\0\2\blhs\14<space>r+\tdesc\29add/remove ğŸ‘ reaction\1\0\2\blhs\14<space>re\tdesc\29add/remove ğŸ‘€ reaction\1\0\2\blhs\14<space>rh\tdesc\31add/remove â¤ï¸ reaction\1\0\2\blhs\14<space>rp\tdesc\29add/remove ğŸ‰ reaction\1\0\2\blhs\a[c\tdesc\27go to previous comment\1\0\2\blhs\a]c\tdesc\23go to next comment\1\0\2\blhs\14<space>cd\tdesc\19delete comment\1\0\2\blhs\14<space>ca\tdesc\16add comment\1\0\2\blhs\14<space>gi\tdesc#navigate to a local repo issue\1\0\2\blhs\14<space>ld\tdesc\17remove label\1\0\2\blhs\14<space>la\tdesc\14add label\1\0\2\blhs\14<space>lc\tdesc\17create label\1\0\2\blhs\14<space>ad\tdesc\20remove assignee\1\0\2\blhs\14<space>aa\tdesc\17add assignee\14goto_file\1\0\2\blhs\agf\tdesc\15go to file\1\0\2\blhs\n<C-y>\tdesc!copy url to system clipboard\1\0\2\blhs\n<C-b>\tdesc\23open PR in browser\1\0\2\blhs\n<C-r>\tdesc\14reload PR\1\0\2\blhs\14<space>il\tdesc\"list open issues on same repo\1\0\2\blhs\14<space>io\tdesc\14reopen PR\1\0\2\blhs\14<space>ic\tdesc\rclose PR\20remove_reviewer\1\0\2\blhs\14<space>vd\tdesc\28remove reviewer request\17add_reviewer\1\0\2\blhs\14<space>va\tdesc\17add reviewer\17show_pr_diff\1\0\2\blhs\14<space>pd\tdesc\17show PR diff\23list_changed_files\1\0\2\blhs\14<space>pf\tdesc\26list PR changed files\17list_commits\1\0\2\blhs\14<space>pc\tdesc\20list PR commits\24squash_and_merge_pr\1\0\2\blhs\15<space>psm\tdesc\24squash and merge PR\rmerge_pr\1\0\2\blhs\14<space>pm\tdesc\20merge commit PR\16checkout_pr\1\0\0\1\0\2\blhs\14<space>po\tdesc\16checkout PR\nissue\1\0\0\19react_confused\1\0\2\blhs\14<space>rc\tdesc\29add/remove ğŸ˜• reaction\16react_laugh\1\0\2\blhs\14<space>rl\tdesc\29add/remove ğŸ˜„ reaction\17react_rocket\1\0\2\blhs\14<space>rr\tdesc\29add/remove ğŸš€ reaction\22react_thumbs_down\1\0\2\blhs\14<space>r-\tdesc\29add/remove ğŸ‘ reaction\20react_thumbs_up\1\0\2\blhs\14<space>r+\tdesc\29add/remove ğŸ‘ reaction\15react_eyes\1\0\2\blhs\14<space>re\tdesc\29add/remove ğŸ‘€ reaction\16react_heart\1\0\2\blhs\14<space>rh\tdesc\31add/remove â¤ï¸ reaction\17react_hooray\1\0\2\blhs\14<space>rp\tdesc\29add/remove ğŸ‰ reaction\17prev_comment\1\0\2\blhs\a[c\tdesc\27go to previous comment\17next_comment\1\0\2\blhs\a]c\tdesc\23go to next comment\19delete_comment\1\0\2\blhs\14<space>cd\tdesc\19delete comment\16add_comment\1\0\2\blhs\14<space>ca\tdesc\16add comment\15goto_issue\1\0\2\blhs\14<space>gi\tdesc#navigate to a local repo issue\17remove_label\1\0\2\blhs\14<space>ld\tdesc\17remove label\14add_label\1\0\2\blhs\14<space>la\tdesc\14add label\17create_label\1\0\2\blhs\14<space>lc\tdesc\17create label\20remove_assignee\1\0\2\blhs\14<space>ad\tdesc\20remove assignee\17add_assignee\1\0\2\blhs\14<space>aa\tdesc\17add assignee\rcopy_url\1\0\2\blhs\n<C-y>\tdesc!copy url to system clipboard\20open_in_browser\1\0\2\blhs\n<C-b>\tdesc\26open issue in browser\vreload\1\0\2\blhs\n<C-r>\tdesc\17reload issue\16list_issues\1\0\2\blhs\14<space>il\tdesc\"list open issues on same repo\17reopen_issue\1\0\2\blhs\14<space>io\tdesc\17reopen issue\16close_issue\1\0\0\1\0\2\blhs\14<space>ic\tdesc\16close issue\15file_panel\1\0\2\14use_icons\2\tsize\3\n\18pull_requests\1\0\1#always_select_remote_on_create\nfalse\1\0\2\nfield\15CREATED_AT\14direction\tDESC\vissues\rorder_by\1\0\0\1\0\2\nfield\15CREATED_AT\14direction\tDESC\vgh_env\16ssh_aliases\19default_remote\1\0\b\20timeline_indent\0062\20github_hostname\5\20timeline_marker\bï‘ \14user_icon\tïŠ½ \30reaction_viewer_hint_icon\bï‘„\26snippet_context_lines\3\4\26left_bubble_delimiter\bî‚¶\27right_bubble_delimiter\bî‚´\1\3\0\0\rupstream\vorigin\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
