print("Setting up colors")

function ColorMyPencils(color)
	-- color = color or "rose-pine"
	color = color or "synthwave84"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFload", { bg = "none" })
end

ColorMyPencils()
