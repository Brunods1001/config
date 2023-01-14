nvim
require "user/options";
require "user/copilot";
require "user/keymaps";
require "user/netrw";
require "user/plugins";
require "user/colors";
require "user/treesitter";
require "user/leap";
require "user/autopairs";
require "user/cmp";
require "user/lsp-inlayhints"
require "user/lsp";
require "user/toggleterm";
require "user/telescope";
require "user/illuminate";
require "user/nvimtree";
require "user/comment";
require "user/gitsigns";
-- require "user/navic";
-- require "user/winbar";
require "user/bufferline";
require "user/whichkey";
require "user/debugging";
require "user/vimwiki";

-- require "lsp_signature".setup({
--     bind = true, -- This is mandatory, otherwise border config won't get registered.
--     handler_opts = {
--       border = "rounded"
--     }
--   })
