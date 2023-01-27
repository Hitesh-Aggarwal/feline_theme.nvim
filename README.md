# feline_theme.nvim

This is a feline opinionated feline config designed to be used as a plugin. It automatically picks colors from applied colorscheme.

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

### Packer:

```
use {
  "Hitesh-Aggarwal/feline_theme.nvim",
  -- after = [Applied colorscheme here]
  config = function()
    require("feline_theme").setup() -- for statusline
    require("feline_theme").setup_winbar() -- for winbar
  end
}
```

### vim-plug:

```
Plug 'Hitesh-Aggarwal/feline_theme.nvim'

" Anywhere in your config:
lua << EOF
  config = function()
    require("feline_theme").setup() -- for statusline
    require("feline_theme").setup_winbar() -- for winbar
  end
EOF
```

### Lazy:

```
return {
  "Hitesh-Aggarwal/feline_theme.nvim",
  -- dependencies = {
  --   [[ Applied colorscheme here ]]
  -- }
  config = function()
    require("feline_theme").setup() -- for statusline
    require("feline_theme").setup_winbar() -- for winbar
  end
}
```

## Contribute

**Please consider raising a pull request for improvements**
