-- For copilot.vim
-- vim.g.copilot_filetypes = {
--   ["*"] = false,
-- }

vim.cmd [[
  imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]]
  -- let g:copilot_proxy="foo:bar@proxy.gtm.lilly.com:9000"
  -- let g:copilot_proxy_strict_ssl = v:false

local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

copilot.setup {
  cmp = {
    enabled = true,
    method = "getCompletionsCycling",
  },
  panel = { -- no config options yet
    enabled = true,
  },
  ft_disable = { "markdown" },
  -- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
  server_opts_overrides = {
    -- trace = "verbose",
    settings = {
      advanced = {
        -- listCount = 10, -- #completions for panel
        inlineSuggestCount = 5, -- #completions for getCompletions
      },
    },
  },
}

