local util = require("pyramid.util")
local theme = require("pyramid.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
