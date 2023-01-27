local feline_ok, feline = pcall(require, "feline")
if not feline_ok then
  return
end
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

local get_hl = vim.api.nvim_get_hl_by_name

local format = function(arg)
  return "#" .. string.format("%06x", arg)
end

local giv_foreground = function(group)
  return format(get_hl(group, true).foreground)
end

local giv_background = function(group)
  return format(get_hl(group, true).background)
end

local used_theme = {
  fg = giv_foreground("Normal"),
  bg = giv_background("CursorLine"),
  bg_dark = giv_background("Normal"),
  green = giv_foreground("DiffAdded"),
  yellow = giv_foreground("WarningMsg"),
  purple = giv_foreground("Special"),
  orange = giv_foreground("Number"),
  red = giv_foreground("Error"),
  blue = giv_foreground("Title"),
}

M.setup = function(opts)
  used_theme = vim.tbl_deep_extend("force", {}, used_theme, opts or {})
  feline.setup({
    components = components,
    theme = used_theme,
  })
end

M.setup_winbar = function()
  feline.winbar.setup({ components = components_winbar })
end

return M
