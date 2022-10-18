local feline_ok, feline = pcall(require, "feline")
if not feline_ok then
  return
end

local tokyonight = {
  fg = "#c8d3f5",
  bg = "#1e2030",
  bg_dark = "#222436",
  green = "#c3e88d",
  yellow = "#ffc777",
  purple = "#fca7ea",
  orange = "#d19a66",
  fg_dark = "#a9b1d6",
  red = "#ff757f",
  blue = "#82aaff",
  dark_red = "#c53b53",
}

local provide = function(provider, fg_color, bg_color, style, left_sep, right_sep, enabled)
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

local left = {
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
  provide " ",
  provide("git_diff_added", "green"),
  provide("git_diff_removed", "red"),
  provide("git_diff_changed", "fg"),
  provide(" ", "fg", "bg", "NONE", "block", "block"),
  provide("diagnostic_errors", "dark_red"),
  provide("diagnostic_warnings", "yellow"),
  provide("diagnostic_hints", "blue"),
  provide "diagnostic_info",
}

local right = {
  provide("lsp_client_names", "fg_dark", "bg", "NONE", "block", "block"),
  provide("position", "green", "bg", "NONE", "block", "block"),
  provide("line_percentage", "orange", "bg", "NONE", "block", "block"),
  provide(" ", "blue", "blue"),
}

local left_inactive = {
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

local right_inactive = {
  provide("position", "green", "bg", "NONE", "block", "block"),
  provide("line_percentage", "orange", "bg", "NONE", "block", "block"),
  provide(" ", "blue", "blue"),
}

local components = {
  active = {
    left,
    right,
  },
  inactive = {
    left_inactive,
    right_inactive,
  },
}

local components_winbar = {
  active = {
    {
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
        require("nvim-navic").is_available
      ),
      provide(
        require("nvim-navic").get_location,
        "fg",
        "bg_dark",
        "NONE",
        "block",
        { str = "", hl = { fg = "bg_dark", bg = "bg_dark" } },
        require("nvim-navic").is_available
      ),
    },
  },
  inactive = {
    {
      provide(
        { name = "file_info", opts = { type = "relative" } },
        "blue",
        "bg_dark",
        "NONE",
        "",
        { str = "", hl = { fg = "bg_dark", bg = "bg_dark" } }
      ),
    },
  },
}

feline.setup {
  components = components,
  theme = tokyonight,
}

feline.winbar.setup { components = components_winbar }

