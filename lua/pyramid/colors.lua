local palette = {
  dark = "#202020",
  foreground = "#ebdbb2",
  background = "#282828",
  background_dark = "#242424",
  bg_light = "#32302f",
  medium_gray = "#504945",
  comment = "#665c54",
  gray = "#DEDEDE",
  soft_yellow = "#EEBD35",
  soft_green = "#98971a",
  bright_yellow = "#fabd2f",
  red = "#fb4934",
  error_red = "#cc241d",
  magenta = "#b16286",
  light_blue = "#7fa2ac",
  dark_gray = "#83a598",
  blue_gray = "#458588",
  forest_green = "#689d6a",
  clean_green = "#8ec07c",
  milk = "#E7D7AD",
  none = "NONE",

  new_foreground = "#eccfa7",
  new_background = "#282828",
  new_comment    = "#bab1a8",
  maraschino     = "#cc283e",
  crimson        = "#ff6961",
  peach          = "#ff9361",
  orange         = "#ee7500",
  mango          = "#ec9b3b",
  banana         = "#fab83b",
  mint           = "#48d286",
  sage           = "#8ec07c",
  sky_blue       = "#008ab5",
  louis_bleu     = "#7bbdfc",
  purple         = "#909dd7",
  frappe         = "#ff9ddc",
  pink           = "#ff98b3",
}

-- backgrounds for diffs
palette.diff = {
  add = "#26332c",
  change = "#273842",
  delete = "#572E33",
  text = "#314753",
}

local M = {}

function M.config(config)
  config = config or require("pyramid.config")
  local intensity_map = {
    ["dark"] = {
      dark = palette.dark,
      background = palette.background,
      background_dark = palette.background_dark,
    },
    ["light"] = {
      background = palette.milk,
      -- TODO: make things visible when using the light bg.
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
        background_dark = palette.none
    }
    colors = vim.tbl_extend("force", colors, { background = palette.none, background_dark = palette.none })
  end
  return colors
end

return M
