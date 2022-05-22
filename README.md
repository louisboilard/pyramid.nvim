# 🛕 Pyramid 🛕

The pyramid color scheme for neovim.

*A pyramid scheme with transparency in mind*

Pyramid is a neovim theme with full support for treesitter. Integrations with
telescope, lualine, nvim-cmp and more.


###  Eye Candy ⚱️⚱️

#### Transparent Background

##### Rust/Telescope
![Rust w/Telescope](https://user-images.githubusercontent.com/39924874/169719891-3386570b-bbbc-4308-9358-87e933cae90b.png)

##### Rust/nvim-cmp
![Rust w/Cmp](https://user-images.githubusercontent.com/39924874/169719954-e5325047-fa68-4742-b4ac-1b6b72aed980.png)

Terminal: Alacritty (background opacity 0.9, hence the transparency).

Font: Ubuntu Mono

---
#### Dark Background

##### C++/LspReferences
![C++ w/Lsp](https://user-images.githubusercontent.com/39924874/169720026-366d7864-0aac-4e99-8507-ee0fadc85519.png)

##### Go/liveGrep
![Go w/liveGrep](https://user-images.githubusercontent.com/39924874/169720102-793afeb1-7f4f-4c7c-b73c-87f7ee670a4b.png)

Font: Ubuntu Mono

---

## ✍ Motivation

A lot of themes I enjoy either don't have full treesitter support or don't have good contrast when
using no background with a transparent terminal. Pyramid is specifically designed to be easy to read when using
no background with reduced opacity for maximum aesthethics and comfort.


## Requirements:
Neovim >=0.5.0 (ideally 0.7+)

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
set termguicolors

" Comment out or omit if you prefer the default dark background.
let g:pyramid_transparant_mode = 1

" Set to 0 if you don't want to override telescope highlight groups.
let g:telescope_theme = 1

" variable style (defaults to NONE), can change to italic/bold.
let g:variable_style = "bold"

" function style (defaults to bold), can change to italic/NONE.
let g:function_style = "NONE"

" Set this after the previous lines so they take effect.
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

## Acknowledgments

- Diep for the colors <3
- Onenord https://github.com/rmehri01/onenord.nvim
- Treesitter https://github.com/nvim-treesitter/nvim-treesitter
- Lualine https://github.com/nvim-lualine/lualine.nvim
- Cmp https://github.com/hrsh7th/nvim-cmp
- Telescope https://github.com/nvim-telescope/telescope.nvim
