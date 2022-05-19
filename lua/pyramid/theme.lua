local M = {}

-- local _debug = function(content)
--   local f = io.open("/home/acc/.nvim.debug.log", "a")
--   f:write(vim.inspect(content) .. "\n")
--   f.close()
-- end

function M.setup(config)
  config = config or require("pyramid.config")
  local colors = require("pyramid.colors")
  local c = colors.config(config)

  local theme = {}
  theme.defer = {}
  theme.base = {
    NormalFloat = { fg = c.new_foreground, bg = c.background },
    Normal = { fg = c.new_foreground, bg = c.background },
    Comment = { fg = c.new_comment, style = config.comment_style },
    Constant = { fg = c.sky_blue },
    String = { fg = c.purple },
    Character = { fg = c.purple },
    Number = { fg = c.sage },
    Boolean = { fg = c.pink },
    Float = { fg = c.pink },
    Identifier = { fg = c.soft_yellow, style = config.variable_style },
    Function = { fg = c.banana },
    Statement = { fg = c.red },
    Conditional = { fg = c.foreground },
    Repeat = { fg = c.magenta },
    Label = { fg = c.dark_gray },
    Operator = { fg = c.foreground },
    Keyword = { fg = c.red, style = config.keyword_style },
    Exception = { fg = c.magenta },
    PreProc = { fg = c.soft_yellow },
    Include = { fg = c.red },
    Define = { fg = c.magenta },
    Title = { fg = c.foreground },
    Macro = { fg = c.magenta },
    PreCondit = { fg = c.magenta },
    Type = { fg = c.soft_yellow },
    StorageClass = { fg = c.blue_gray },
    Structure = { fg = c.soft_yellow },
    Typedef = { fg = c.soft_yellow },
    Special = { fg = c.dark_gray, style = "italic" },
    SpecialComment = { fg = c.comment },
    MoreMsg = { fg = c.foreground },
    Error = { fg = c.red, style = "bold" },
    Todo = { fg = c.sky_blue, style = "bold" },
    CursorLineNr = { fg = c.comment, style = "bold" },
    debugPc = { bg = c.error_red },
    Conceal = { fg = c.comment },
    Directory = { fg = c.dark_gray },

    TabLine = { bg = c.dark, fg = c.foreground }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.background }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.dark, bg = c.foreground }, -- tab pages line, active tab page label

    DiffAdd = { bg = c.diff.add },
    DiffChange = { bg = c.diff.change },
    DiffDelete = { bg = c.diff.delete },
    DiffText = { bg = c.diff.text },

    ErrorMsg = { fg = c.red },
    VertSplit = { fg = c.bg_light },
    Folded = { fg = c.comment },
    IncSearch = { fg = c.forest_green, bg = c.comment },
    LineNr = { fg = c.medium_gray },
    MatchParen = { bg = c.blue_gray, style = "underline" },
    NonText = { fg = c.comment },
    Pmenu = { fg = c.foreground, bg = c.bg_light },
    PmenuSel = { fg = c.background, bg = c.louis_bleu },
    PmenuSbar = { bg = c.comment },
    PmenuThumb = { bg = c.foreground },
    Question = { fg = c.magenta },
    QuickFixLine = { fg = c.background, bg = c.soft_yellow },
    Search = { fg = c.milk, bg = c.louis_bleu },
    SpecialKey = { fg = c.comment },
    SpellBad = { fg = c.red, style = "underline" },
    SpellCap = { fg = c.bright_yellow },
    SpellLocal = { fg = c.bright_yellow },
    SpellRare = { fg = c.bright_yellow },
    StatusLine = { fg = c.foreground, bg = c.medium_gray },
    StatusLineNC = { fg = c.comment },
    StatusLineTerm = { fg = c.foreground, bg = c.medium_gray },
    StatusLineTermNC = { fg = c.medium_gray },
    Terminal = { fg = c.foreground, bg = c.background },
    VisualNOS = { fg = c.medium_gray },
    WarningMsg = { fg = c.soft_yellow },
    WildMenu = { fg = c.background, bg = c.blue_gray },
    EndOfBuffer = { fg = c.background },

    -- Tree Sitter
    TSComment = { fg = c.new_comment, style = config.comment_style },
    TSError = { fg = c.maraschino },
    TSPunctDelimiter = { fg = c.new_foreground },
    TSPunctBracket = { fg = c.new_foreground },
    TSPunctSpecial = { fg = c.new_foreground },
    TSConstant = { fg = c.louis_bleu, style = "bold" },
    TSConstBuiltin = { fg = c.louis_bleu },
    TSString = { fg = c.sage, style = "nocombine" },
    TSCharacter = { fg = c.orange },
    TSNumber = { fg = c.frappe },
    TSFuncBuiltin = { fg = c.banana },
    TSFunction = { fg = c.banana, style = config.function_style },
    TSFuncMacro = { fg = c.banana },
    TSParameter = { fg = c.crimson, style = "nocombine" },
    TSParameterReference = { fg = c.crimson },
    TSMethod = { fg = c.banana, style = config.function_style },
    TSField = { fg = c.new_foreground },
    TSProperty = { fg = c.frappe },
    TSConstructor = { fg = c.banana, style = "nocombine" },
    TSConditional = { fg = c.banana },
    TSRepeat = { fg = c.banana },
    TSLabel = { fg = c.mango },
    TSKeyword = { fg = c.crimson, style = config.keyword_style },
    TSKeywordFunction = { fg = c.mint, style = config.keyword_style },
    TSKeywordOperator = { fg = c.mint },
    TSOperator = { fg = c.new_foreground },
    TSException = { fg = c.magenta },
    TSType = { fg = c.louis_bleu },
    TSTypeBuiltin = { fg = c.louis_bleu },
    TSStructure = { fg = c.banana },
    TSVariable = { fg = c.new_foreground, style = config.variable_style },
    TSVariableBuiltin = { fg = c.new_foreground },
    TSText = { fg = c.purple },
    TSStrong = { fg = c.soft_yellow },
    TSEmphasis = { fg = c.soft_yellow },
    TSUnderline = { fg = c.soft_yellow },
    TSTitle = { fg = c.soft_yellow },
    TSLiteral = { fg = c.soft_yellow },
    TSURI = { fg = c.soft_yellow },
    TSTag = { fg = c.clean_green },
    TSTagDelimiter = { fg = c.comment },

    htmlArg = { fg = c.soft_yellow },
    htmlBold = { fg = c.bright_yellow, style = "bold" },
    htmlEndTag = { fg = c.foreground },
    htmlH1 = { fg = c.foreground },
    htmlH2 = { fg = c.foreground },
    htmlH3 = { fg = c.foreground },
    htmlH4 = { fg = c.foreground },
    htmlH5 = { fg = c.foreground },
    htmlH6 = { fg = c.foreground },
    htmlItalic = { fg = c.magenta, style = "italic" },
    htmlLink = { fg = c.foreground, style = "underline" },
    htmlSpecialChar = { fg = c.soft_yellow },
    htmlSpecialTagName = { fg = c.blue_gray },
    htmlTag = { fg = c.dark_gray },
    htmlTagN = { fg = c.orange },
    htmlTagName = { fg = c.orange },
    htmlTitle = { fg = c.foreground },

    markdownBlockquote = { fg = c.comment },
    markdownBold = { fg = c.bright_yellow, style = "bold" },
    markdownCode = { fg = c.soft_yellow },
    markdownCodeBlock = { fg = c.comment },
    markdownCodeDelimiter = { fg = c.comment },
    markdownH1 = { fg = c.foreground },
    markdownH2 = { fg = c.foreground },
    markdownH3 = { fg = c.foreground },
    markdownH4 = { fg = c.foreground },
    markdownH5 = { fg = c.foreground },
    markdownH6 = { fg = c.foreground },
    markdownHeadingDelimiter = { fg = c.orange },
    markdownHeadingRule = { fg = c.comment },
    markdownId = { fg = c.magenta },
    markdownIdDeclaration = { fg = c.blue_gray },
    markdownIdDelimiter = { fg = c.magenta },
    markdownItalic = { fg = c.magenta, style = "italic" },
    markdownLinkDelimiter = { fg = c.magenta },
    markdownLinkText = { fg = c.blue_gray },
    markdownListMarker = { fg = c.orange },
    markdownOrderedListMarker = { fg = c.orange },
    markdownRule = { fg = c.comment },
    markdownUrl = { fg = c.soft_green, style = "underline" },

    diffAdded = { fg = c.forest_green },
    diffRemoved = { fg = c.red },
    diffFileId = { fg = c.magenta },
    diffFile = { fg = c.comment },
    diffNewFile = { fg = c.soft_yellow },
    diffOldFile = { fg = c.orange },

    ColorColumn = { bg = c.background_dark },
    SignColumn = { bg = c.background },
    CursorColumn = { bg = c.bg_light },
    CursorLine = { bg = c.bg_light },
    FoldColumn = { fg = c.NONE },
    EasyMotionShade = { fg = c.NONE },
    Visual = { bg = c.medium_gray },
    Cursor = { bg = c.soft_green, fg = c.background },
    FloatBorder = { bg = c.background_dark },

    -- Nvim Tree
    NvimTreeNormal = { fg = c.foreground, bg = c.background_dark },
    NvimTreeNormalNC = { fg = c.foreground, bg = c.background_dark },
    NvimTreeFolderIcon = { fg = c.soft_yellow },
    NvimTreeRootFolder = { fg = c.magenta },
    NvimTreeExecFile = { fg = c.light_blue, style = "NONE" },

    NvimTreeGitDirty = { fg = c.red },
    NvimTreeGitStaged = { fg = c.foreground },
    NvimTreeGitMerge = { fg = c.soft_yellow },
    NvimTreeGitRenamed = { fg = c.soft_yellow },
    NvimTreeGitNew = { fg = c.soft_green },
    NvimTreeGitDeleted = { fg = c.red },

    -- indent blankline
    IndentBlanklineChar = { fg = "#313131" },
    IndentBlanklineSpaceChar = { fg = "#313131" },
    IndentBlanklineContextChar = { fg = "#365050" },

    -- Cmp
    CmpDocumentation = { fg = c.foreground, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.medium_gray, bg = c.bg_float },

    CmpItemAbbr = { fg = c.foreground, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.milk, bg = c.none, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.light_blue, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.light_blue, bg = c.none },

    CmpItemKindDefault = { fg = c.dark_gray, bg = c.none },
    CmpItemMenu = { fg = c.comment, bg = c.none },

    CmpItemKindKeyword = { fg = c.blue_gray, bg = c.none },

    CmpItemKindVariable = { fg = c.magenta, bg = c.none },
    CmpItemKindConstant = { fg = c.magenta, bg = c.none },
    CmpItemKindReference = { fg = c.magenta, bg = c.none },
    CmpItemKindValue = { fg = c.magenta, bg = c.none },

    CmpItemKindFunction = { fg = c.orange, bg = c.none },
    CmpItemKindMethod = { fg = c.orange, bg = c.none },
    CmpItemKindConstructor = { fg = c.orange, bg = c.none },

    CmpItemKindClass = { fg = c.pink, bg = c.none },
    CmpItemKindInterface = { fg = c.pink, bg = c.none },
    CmpItemKindStruct = { fg = c.pink, bg = c.none },
    CmpItemKindEvent = { fg = c.pink, bg = c.none },
    CmpItemKindEnum = { fg = c.pink, bg = c.none },
    CmpItemKindUnit = { fg = c.pink, bg = c.none },

    CmpItemKindModule = { fg = c.soft_yellow, bg = c.none },

    CmpItemKindProperty = { fg = c.forest_green, bg = c.none },
    CmpItemKindField = { fg = c.forest_green, bg = c.none },
    CmpItemKindTypeParameter = { fg = c.forest_green, bg = c.none },
    CmpItemKindEnumMember = { fg = c.forest_green, bg = c.none },
    CmpItemKindOperator = { fg = c.forest_green, bg = c.none },
    CmpItemKindSnippet = { fg = c.gray, bg = c.none },

  }

  if config.telescope_theme then
    theme.base = vim.tbl_extend("force", theme.base, {
      -- Telescope
      TelescopeBorder = { fg = c.background_dark, bg = c.background_dark },
      TelescopePromptBorder = { fg = c.medium_gray, bg = c.medium_gray },
      TelescopePromptNormal = { fg = c.milk, bg = c.medium_gray },
      TelescopePromptPrefix = { fg = c.soft_yellow, bg = c.medium_gray },

      TelescopeNormal = { bg = c.background_dark },

      TelescopePreviewTitle = { fg = c.background, bg = c.forest_green },
      TelescopePromptTitle = { fg = c.background, bg = c.soft_yellow },
      TelescopeResultsTitle = { fg = c.background_dark, bg = c.milk },

      TelescopeSelection = { bg = c.diff.change },
    })
  end

  theme.base = vim.tbl_extend("force", theme.base, config.highlights or {})
  return theme
end

return M
