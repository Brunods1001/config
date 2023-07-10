print("Setting up colors")

function ColorMyPencils(color)
    color = color or "rose-pine"
    -- color = color or "synthwave84"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

local openai_api_key = "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"
vim.o.background = "dark"
require("text-to-colorscheme").setup {
    ai = {
        gpt_model = "gpt-3.5-turbo-0613",
        openai_api_key = openai_api_key,
    },
    hex_palettes = {
        {
            name = "hacker",
            background_mode = "dark",
            background = "#000000",
            foreground = "#00d900",
            accents = {
                "#ff0000",
                "#ffff00",
                "#00ffff",
                "#ff00ff",
                "#ff9900",
                "#00d982",
                "#9900ff",
            }
        },
        {
            name = "happy hacker",
            background_mode = "dark",
            background = "#000000",
            foreground = "#ffffff",
            accents = {
                "#ff00ff",
                "#00d900",
                "#ffff00",
                "#00ffff",
                "#ff0000",
                "#00d900",
                "#0000ff",
            }
        },
        {
            name = "red and green hacker",
            background_mode = "dark",
            background = "#000000",
            foreground = "#ffffff",
            accents = {
                "#ff0000",
                "#00d900",
                "#ff8000",
                "#00ffff",
                "#ff00ff",
                "#ffff00",
                "#0080ff",
            }
        }

    }
}

vim.cmd([[colorscheme text-to-colorscheme]])
