# feline_theme.nvim

This is a opinionated feline config designed to be used as a plugin. It automatically picks colors from applied colorscheme.

## Requirements:

- Neovim >= 0.8
- [feline.nvim](https://github.com/feline-nvim/feline.nvim)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic) (optional)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (optional)

## Screenshots:

#### Statusline

<img src="./screenshot.png">

#### Winbar

<img src="./winbar.png">

## Installation:

### Note: Make sure that you always load your colorscheme first.
#### Anoter Note: You can't use only winbar. That will not work.

### Packer:

```lua
use {
  "Hitesh-Aggarwal/feline_theme.nvim",
  -- after = [Applied colorscheme here]
  config = function()
    require("feline_theme").setup() -- for statusline
    -- require("feline_theme").setup_winbar() -- for winbar
  end
}
```

### vim-plug:

```vim
Plug 'Hitesh-Aggarwal/feline_theme.nvim'

" Anywhere in your config:
lua << EOF
  config = function()
    require("feline_theme").setup() -- for statusline
    -- require("feline_theme").setup_winbar() -- for winbar
  end
EOF
```

### Lazy:

```lua
return {
  "Hitesh-Aggarwal/feline_theme.nvim",
  -- dependencies = {
  --   [[ Applied colorscheme here ]]
  -- Or you can set the priority of your colorscheme to 1000 so that it loads first.
  -- }
  config = function()
    require("feline_theme").setup() -- for statusline
    -- require("feline_theme").setup_winbar() -- for winbar
  end
}
```

### Configuration:

```lua
require("feline_theme").setup({
-- Change any of these colors. Do no add your own. They will have no effect.
  -- fg = "#ffffff",
  -- bg = "#333333",
  -- bg_dark = "#111111",
  -- green = "#00ff00",
  -- yellow = "#ffff00",
  -- purple = "#a020f0",
  -- orange = "#ffa500",
  -- red = "#ff0000",
  -- blue = "#0000ff",
})
```

## Contribute

**Please consider raising a pull request for improvements**
