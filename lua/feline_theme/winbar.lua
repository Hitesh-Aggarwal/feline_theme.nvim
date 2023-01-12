local M = {}

local is_navic_available = function()
	local navic_ok, navic = pcall(require, "nvim-navic")
	if navic_ok then
		return navic.is_available
	else
    return false
	end
end

local give_navic = function()
	if not is_navic_available() then
		return ""
	else
		return require("nvim-navic").get_location
	end
end

local provide = require("feline_theme.utils").provide

M.active = {
	provide(
		{ name = "file_info", opts = { type = "relative" } },
		"blue",
		"bg_dark",
		"NONE",
		"",
		{ str = "", hl = { fg = "bg_dark", bg = "bg_dark" } }
	),
	provide(
		" ",
		"fg",
		"bg_dark",
		"NONE",
		"",
		{ str = "slant_left_thin", hl = { bg = "bg_dark" } },
		is_navic_available()
	),
	provide(
		give_navic(),
		"fg",
		"bg_dark",
		"NONE",
		"block",
		{ str = "", hl = { fg = "bg_dark", bg = "bg_dark" } },
		is_navic_available()
	),
}

M.inactive = {
	provide(
		{ name = "file_info", opts = { type = "relative" } },
		"blue",
		"bg_dark",
		"NONE",
		"",
		{ str = "", hl = { fg = "bg_dark", bg = "bg_dark" } }
	),
}

return M
