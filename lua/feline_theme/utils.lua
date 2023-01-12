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

return M
