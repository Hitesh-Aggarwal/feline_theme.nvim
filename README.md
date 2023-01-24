# feline_theme.nvim

This is a feline configuration that supports various themes. Default theme is [tokyonight](https://github.com/folke/tokyonight.nvim)

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

### Packer:

```
use {
  "Hitesh-Aggarwal/feline_theme.nvim"
  config = function()
    require("feline_theme").setup() -- for tokyonight
    -- require("feline_theme").setup("gruvbox") -- for any other colorscheme
    require("feline_theme").setup_winbar() -- for the winbar
  end
}
```

### vim-plug:

```
Plug 'Hitesh-Aggarwal/feline_theme.nvim'

" Anywhere in your config:
lua << EOF
  config = function()
    require("feline_theme").setup() -- for tokyonight
    -- require("feline_theme").setup("gruvbox") -- for any other colorscheme
    require("feline_theme").setup_winbar() -- for the winbar
  end
EOF
```

### Lazy:
```
return {
  "Hitesh-Aggarwal/feline_theme.nvim",
  config = function()
    require("feline_theme").setup() -- for tokyonight
    -- require("feline_theme").setup("gruvbox") -- for any other colorscheme
    require("feline_theme").setup_winbar() -- for the winbar
  end
}
```

### Contribute

**Please consider raising a pull request for improvements, and help me add more colorschemes.**
