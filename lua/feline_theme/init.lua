local components = {
	active = {
		require("feline_theme.statusline").left,
		require("feline_theme.statusline").right,
	},
	inactive = {
		require("feline_theme.statusline").left_inactive,
		require("feline_theme.statusline").right_inactive,
	},
}

local components_winbar = {
	active = {
		require("feline_theme.winbar").active,
	},
	inactive = {
		require("feline_theme.winbar").inactive,
	},
}

local M = {}

M.setup = function(opts)
	local feline_ok, feline = pcall(require, "feline")
	if not feline_ok then
		return
	end
	opts = opts or "tokyonight"
	local modename = "feline_theme.colorschemes." .. opts
	local theme_ok, used_theme = pcall(require, modename)
	if not theme_ok then
		print(opts .. " theme not found")
		return
	end
	feline.setup({
		components = components,
		theme = used_theme,
	})

	feline.winbar.setup({ components = components_winbar })
end

return M
