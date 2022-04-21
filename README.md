# 🛕 Pyramid 🛕

The pyramid color scheme for neovim.

*A pyramid scheme with transparency in mind*

Pyramid is a neovim theme with full support for treesitter. Integrations with telescope, lualine and nvim-cmp.

#### TODO:

- test
- Add proper pictures

### ⚱️ ⚱️ ⚱️ ⚱️
![Rust](https://user-images.githubusercontent.com/31720261/147399558-bf00b60a-aea9-46f7-a823-fc760cda05be.png)

![telescope-theme](https://user-images.githubusercontent.com/31720261/151669762-1470aa12-b6ff-47c1-a4e9-ec9b37e0eabe.png)

Terminal: Alacritty (opacity 0.9)

Font: Ubuntu Mono

## ✍ Motivation

A lot of themes I enjoy either don't have full treesitter support or don't have good contrast when
using no background with a transparent terminal. Pyramid is specifically designed to be easy to read when using
no background with reduced opacity for maximum aesthethics and comfort.


## Requirements:
Neovim >=0.5.0

For a better experience treesitter should be installed and enabled for your preferred languages.

## Install

```
" If you are using Plug
Plug 'louisboilard/pyramid.nvim', {'branch': 'main'}
```

```
-- If you are using Packer
use 'louisboilard/pyramid.nvim'
```

## Usage
```
" Vim Script
colorscheme pyramid
```

```
-- Lua
require('pyramid').setup()
```
To enable `pyramid` theme for `Lualine`, simply specify it in your lualine settings:

```
require('lualine').setup {
    options = {
        -- ... your lualine config,
        theme = "pyramid",
        -- ... your lualine config,
    }
}
```

## 🌈 Palette

![pyramid palette](https://user-images.githubusercontent.com/31720261/147415431-13f6c6af-2f76-46c9-8448-20c71e359fc5.png)


## Acknowledgments

- Onenord https://github.com/rmehri01/onenord.nvim
- Treesitter https://github.com/nvim-treesitter/nvim-treesitter
- Lualine https://github.com/nvim-lualine/lualine.nvim
- Cmp https://github.com/hrsh7th/nvim-cmp
- Telescope https://github.com/nvim-telescope/telescope.nvim
