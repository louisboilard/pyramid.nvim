-- Copyright (c) louisboilard
-- MIT license, see LICENSE for more details.

-- local c = require("pyramid.colors").config()

local colors = {
  pyramid1  = '#3B4252',
  pyramid2  = '#FFD6D6',
  pyramid5  = '#E5E9F0',
  pyramid6  = '#ECEFF4',
  pyramid7  = '#C0FFB6',
  pyramid8  = '#88C0D0',
  pyramid13 = '#EBCB8B',
  none   = 'NONE',
}

return {
  normal = {
    a = { fg = colors.pyramid1, bg = colors.pyramid13, gui = 'bold' },
    b = { fg = colors.pyramid5, bg = colors.none },
    c = { fg = colors.pyramid5, bg = colors.none },
  },
  insert = { a = { fg = colors.pyramid1, bg = colors.pyramid6, gui = 'bold' } },
  visual = { a = { fg = colors.pyramid1, bg = colors.pyramid2, gui = 'bold' } },
  replace = { a = { fg = colors.pyramid1, bg = colors.pyramid8, gui = 'bold' } },
  inactive = {
    a = { fg = colors.pyramid1, bg = colors.pyramid13, gui = 'bold' },
    b = { fg = colors.pyramid5, bg = colors.none },
    c = { fg = colors.pyramid5, bg = colors.none },
  },
}
