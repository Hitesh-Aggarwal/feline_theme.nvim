local M = {}

M.provide = function(provider, fg_color, bg_color, style, left_sep, right_sep, enabled)
	provider = provider or " "
	fg_color = fg_color or "fg"
	bg_color = bg_color or "bg"
	style = style or "NONE"
	left_sep = left_sep or ""
	right_sep = right_sep or ""
	enabled = enabled or true
	return {
		provider = provider,
		hl = {
			fg = fg_color,
			bg = bg_color,
			style = style,
		},
		left_sep = left_sep,
		right_sep = right_sep,
		enabled = enabled,
	}
end

local get_hl = function(group)
	local status_ok, hl = pcall(vim.api.nvim_get_hl_by_name, group, true)
	if status_ok then
		return hl
	else
		return false
	end
end

local format = function(arg)
	return "#" .. string.format("%06x", arg)
end

M.giv_color = function(group, type)
	local col = get_hl(group)
	if not col then
		return false
	end
	local val = nil
	if type then
		val = col["background"]
	else
    val = col["foreground"]
	end
	if val == nil then
		return false
	else
		return format(val)
	end
end

return M
