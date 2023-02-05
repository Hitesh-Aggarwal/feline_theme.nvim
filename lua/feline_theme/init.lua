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

local M = {}

local giv_color = require("feline_theme.utils").giv_color

local used_theme = {
  fg = giv_color("Normal") or "#ffffff",
  bg = giv_color("CursorLine","background") or "#333333",
  green = giv_color("GitSignsAdd") or giv_color("diffAdded") or "#00ff00",
  yellow = giv_color("WarningMsg") or "#ffff00",
  purple = giv_color("Special") or "#a020f0",
  orange = giv_color("Number") or "#ffa500",
  red = giv_color("Error") or "#ff0000",
  blue = giv_color("Title") or "#0000ff",
}

M.setup = function(opts)
  used_theme = vim.tbl_deep_extend("force", {}, used_theme, opts or {})
  feline.setup({
    components = components,
    theme = used_theme,
  })
end

return M
