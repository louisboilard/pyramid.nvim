local palette = {
    foreground  = "#eccfa7",
    background  = "#181717",
    dark        = "#181717",
    comment     = "#504945",
    gray        = "#DEDEDE",
    maraschino  = "#cc283e",
    error_red   = "#cc241d",
    crimson     = "#ff6961",
    peach       = "#ff9361",
    orange      = "#ee7500",
    mango       = "#ec9b3b",
    banana      = "#fab83b",
    mint        = "#48d286",
    sage        = "#b6d03b",
    sky_blue    = "#008ab5",
    louis_bleu  = "#7bbdfc",
    purple      = "#AD5FD8",
    frappe      = "#ff9ddc",
    pink        = "#ff98b3",
    none        = "NONE",
}

local M = {}

function M.config(config)
  config = config or require("pyramid.config")
  local intensity_map = {
    ["dark"] = {
      dark = palette.dark,
      background = palette.background,
    },
  }

  local colors = palette
  local background = config.background_color or palette.background
  if intensity_map[background] then
    colors = vim.tbl_extend("force", colors, intensity_map[background])
  end

  if config.transparent_mode then
    transparent = {
        background = palette.none,
    }
    colors = vim.tbl_extend("force", colors, { background = palette.none })
  end
  return colors
end

return M
