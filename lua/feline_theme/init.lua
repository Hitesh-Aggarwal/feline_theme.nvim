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

local giv_foreground = function(group)
  local col = get_hl(group)
  if col then
    if col.foreground == nil then
      return false
    else
      return format(col.foreground)
    end
  else
    return false
  end
end

local giv_background = function(group)
  local col = get_hl(group)
  if col then
    if col.background == nil then
      return false
    else
      return format(col.background)
    end
  else
    return false
  end
end

local used_theme = {
  fg = giv_foreground("Normal") or "#ffffff",
  bg = giv_background("CursorLine") or "#333333",
  bg_dark = giv_background("Normal") or "#111111",
  green = giv_foreground("DiffAdded") or "#00ff00",
  yellow = giv_foreground("WarningMsg") or "#ffff00",
  purple = giv_foreground("Special") or "#a020f0",
  orange = giv_foreground("Number") or "#ffa500",
  red = giv_foreground("Error") or "#ff0000",
  blue = giv_foreground("Title") or "#0000ff",
}

M.setup = function(opts)
  used_theme = vim.tbl_deep_extend("force", {}, used_theme, opts or {})
  feline.setup({
    components = components,
    theme = used_theme,
  })
end

return M
