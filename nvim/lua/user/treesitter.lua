local status_ok, config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    disable = { "julia" },
    additional_vim_regex_highlighting = false,
  },
    indent = {
        enable = true,
        disable = { "julia", "python" }
    },
    autopairs = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
