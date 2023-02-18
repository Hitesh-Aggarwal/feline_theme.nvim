local M = {}

local provide = require("feline_theme.utils").provide

local isTSavailable = function()
	local ts_ok, ts = pcall(require, "nvim-treesitter.parsers")
	if ts_ok then
		return ts.has_parser()
	else
		return false
	end
end

M.left = {
	provide(" ", "blue", "blue"),
	provide("git_branch", "purple", "bg", "bold", "block", "block"),
	provide(
		{ name = "file_type", opts = { filetype_icon = true, case = "titlecase" } },
		"fg",
		"bg",
		"NONE",
		"block",
		"block"
	),
	provide(" "),
	provide("git_diff_added", "green"),
	provide("git_diff_removed", "red"),
	provide("git_diff_changed", "fg"),
	provide(" ", "fg", "bg", "NONE", "block", "block"),
	provide("diagnostic_errors", "red"),
	provide("diagnostic_warnings", "yellow"),
	provide("diagnostic_hints", "blue"),
	provide("diagnostic_info"),
}

M.middle = {
  provide({name = "file_info", opts = {type = "relative"}})
}

M.right = {
	provide("綠TS", "green", "bg", "bold", "", "block", isTSavailable),
	provide("lsp_client_names", "fg", "bg", "NONE", "block", "block"),
	provide("position", "green", "bg", "NONE", "block", "block"),
	provide("line_percentage", "orange", "bg", "NONE", "block", "block"),
	provide(" ", "blue", "blue"),
}

M.left_inactive = {
	provide(" ", "blue", "blue"),
	provide(
		{ name = "file_type", opts = { filetype_icon = true, case = "titlecase" } },
		"fg",
		"bg",
		"NONE",
		"block",
		"block"
	),
}

M.right_inactive = {
	provide("position", "green", "bg", "NONE", "block", "block"),
	provide("line_percentage", "orange", "bg", "NONE", "block", "block"),
	provide(" ", "blue", "blue"),
}

return M
