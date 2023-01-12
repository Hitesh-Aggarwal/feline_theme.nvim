local M = {}

local provide = require("feline_theme.utils").provide

local isTSavailable = function()
	local ts_ok, ts = pcall(require, "nvim-treesitter.parsers")
	if not ts_ok then
		print("Treesitter is not available")
		return false
	elseif not ts.has_parser() then
		print("Treesitter parser for current buffer is not available")
		return false
	else
		return true
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
	provide("diagnostic_errors", "dark_red"),
	provide("diagnostic_warnings", "yellow"),
	provide("diagnostic_hints", "blue"),
	provide("diagnostic_info"),
}

M.right = {
	provide("綠TS", "green", "bg", "bold", "", "block", isTSavailable()),
	provide("lsp_client_names", "fg_dark", "bg", "NONE", "block", "block"),
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
