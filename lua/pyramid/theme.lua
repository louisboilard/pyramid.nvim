local M = {}

function M.setup(config)
  config = config or require("pyramid.config")
  local colors = require("pyramid.colors")
  local c = colors.config(config)

  local theme = {}
  theme.defer = {}
  theme.base = {
    Normal = { fg = c.foreground, bg = c.background },
    Comment = { fg = c.comment, style = config.comment_style },
    Constant = { fg = c.sky_blue },
    String = { fg = c.purple },
    Character = { fg = c.sage },
    Number = { fg = c.frappe },
    Boolean = { fg = c.pink },
    Float = { fg = c.frappe },
    Identifier = { fg = c.peach, style = config.variable_style },
    Function = { fg = c.banana },
    Statement = { fg = c.error_red },
    Conditional = { fg = c.banana },
    Repeat = { fg = c.purple },
    Label = { fg = c.mango },
    Operator = { fg = c.foreground },
    Keyword = { fg = c.crimson, style = config.keyword_style },
    Exception = { fg = c.purple },
    PreProc = { fg = c.banana },
    Include = { fg = c.peach },
    Define = { fg = c.purple },
    Title = { fg = c.foreground },
    Macro = { fg = c.purple },
    PreCondit = { fg = c.purple },
    Type = { fg = c.louis_bleu },
    StorageClass = { fg = c.foreground },
    Structure = { fg = c.banana },
    Typedef = { fg = c.louis_bleu },
    Special = { fg = c.sky_blue, style = "italic" },
    SpecialComment = { fg = c.comment },
    MoreMsg = { fg = c.foreground },
    Error = { fg = c.error_red, style = "bold" },
    Todo = { fg = c.sky_blue, style = "bold" },
    CursorLineNr = { fg = c.comment, style = "bold" },
    debugPc = { bg = c.maraschino },
    Conceal = { fg = c.comment },
    Directory = { fg = c.sky_blue },

    -- tab pages line, not active tab page label
    TabLine = { bg = c.background, fg = c.foreground },
    -- tab pages line, where there are no labels
    TabLineFill = { bg = c.background },
    -- tab pages line, active tab page label
    TabLineSel = { fg = c.background, bg = c.none },

    DiffAdd = { bg = c.sage },
    DiffChange = { bg = c.peach },
    DiffDelete = { bg = c.maraschino },
    DiffText = { bg = c.frappe },

    ErrorMsg = { fg = c.error_red },
    VertSplit = { fg = c.comment },
    Folded = { fg = c.comment },
    IncSearch = { fg = c.sage, bg = c.comment },
    LineNr = { fg = c.comment },
    MatchParen = { bg = c.louis_bleu, style = "underline" },
    NonText = { fg = c.comment },
    Question = { fg = c.purple },
    QuickFixLine = { fg = c.background, bg = c.banana },
    Search = { fg = c.foreground, bg = c.louis_bleu },
    SpecialKey = { fg = c.comment },
    SpellBad = { fg = c.maraschino, style = "underline" },
    SpellCap = { fg = c.orange },
    SpellLocal = { fg = c.orange },
    SpellRare = { fg = c.orange },
    StatusLine = { fg = c.foreground, bg = c.comment },
    StatusLineNC = { fg = c.comment },
    StatusLineTerm = { fg = c.foreground, bg = c.comment },
    StatusLineTermNC = { fg = c.comment },
    Terminal = { fg = c.foreground, bg = c.background },
    VisualNOS = { fg = c.comment },
    WarningMsg = { fg = c.banana },
    WildMenu = { fg = c.background, bg = c.louis_bleu },
    EndOfBuffer = { fg = c.background },

    -- Tree Sitter
    TSComment = { fg = c.comment, style = config.comment_style },
    TSError = { fg = c.error_red },
    TSPunctDelimiter = { fg = c.foreground },
    TSPunctBracket = { fg = c.foreground },
    TSPunctSpecial = { fg = c.foreground },
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
    TSField = { fg = c.foreground },
    TSProperty = { fg = c.frappe },
    TSConstructor = { fg = c.banana, style = "nocombine" },
    TSConditional = { fg = c.banana },
    TSRepeat = { fg = c.banana },
    TSLabel = { fg = c.mango },
    TSKeyword = { fg = c.crimson, style = config.keyword_style },
    TSKeywordFunction = { fg = c.mint, style = config.keyword_style },
    TSKeywordOperator = { fg = c.mint },
    TSOperator = { fg = c.foreground },
    TSException = { fg = c.purple },
    TSType = { fg = c.louis_bleu },
    TSTypeBuiltin = { fg = c.louis_bleu },
    TSStructure = { fg = c.banana },
    TSVariable = { fg = c.foreground, style = config.variable_style },
    TSVariableBuiltin = { fg = c.foreground },
    TSText = { fg = c.purple },
    TSStrong = { fg = c.peach },
    TSEmphasis = { fg = c.peach },
    TSUnderline = { fg = c.peach },
    TSTitle = { fg = c.peach },
    TSLiteral = { fg = c.peach },
    TSURI = { fg = c.peach },
    TSTag = { fg = c.sage },
    TSTagDelimiter = { fg = c.comment },

    htmlArg = { fg = c.peach },
    htmlBold = { fg = c.peach, style = "bold" },
    htmlEndTag = { fg = c.foreground },
    htmlH1 = { fg = c.foreground },
    htmlH2 = { fg = c.foreground },
    htmlH3 = { fg = c.foreground },
    htmlH4 = { fg = c.foreground },
    htmlH5 = { fg = c.foreground },
    htmlH6 = { fg = c.foreground },
    htmlItalic = { fg = c.purple, style = "italic" },
    htmlLink = { fg = c.foreground, style = "underline" },
    htmlSpecialChar = { fg = c.peach },
    htmlSpecialTagName = { fg = c.louis_bleu },
    htmlTag = { fg = c.mint },
    htmlTagN = { fg = c.orange },
    htmlTagName = { fg = c.orange },
    htmlTitle = { fg = c.foreground },

    markdownBlockquote = { fg = c.comment },
    markdownBold = { fg = c.peach, style = "bold" },
    markdownCode = { fg = c.peach },
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
    markdownId = { fg = c.purple },
    markdownIdDeclaration = { fg = c.louis_bleu },
    markdownIdDelimiter = { fg = c.purple },
    markdownItalic = { fg = c.purple, style = "italic" },
    markdownLinkDelimiter = { fg = c.purple },
    markdownLinkText = { fg = c.louis_bleu },
    markdownListMarker = { fg = c.orange },
    markdownOrderedListMarker = { fg = c.orange },
    markdownRule = { fg = c.comment },
    markdownUrl = { fg = c.sage, style = "underline" },

    diffAdded = { fg = c.sage },
    diffRemoved = { fg = c.error_red },
    diffFileId = { fg = c.purple },
    diffFile = { fg = c.comment },
    diffNewFile = { fg = c.peach },
    diffOldFile = { fg = c.orange },

    ColorColumn = { bg = c.background },
    SignColumn = { bg = c.background },
    CursorColumn = { bg = c.background },
    CursorLine = { bg = c.background },
    FoldColumn = { fg = c.NONE },
    EasyMotionShade = { fg = c.NONE },
    Visual = { bg = c.comment }, --visual mode (highlighting)
    Cursor = { bg = c.louis_bleu, fg = c.background },
    NormalFloat = { fg = c.foreground, bg = c.background },
    FloatBorder = { bg = c.background },
    -- PopUp menu.
    Pmenu = { fg = c.foreground, bg = c.dark },
    PmenuSel = { fg = c.dark, bg = c.louis_bleu },
    PmenuSbar = { bg = c.comment },
    PmenuThumb = { bg = c.dark },

    -- Nvim Tree
    NvimTreeNormal = { fg = c.foreground, bg = c.background },
    NvimTreeNormalNC = { fg = c.foreground, bg = c.background },
    NvimTreeFolderIcon = { fg = c.peach },
    NvimTreeRootFolder = { fg = c.purple },
    NvimTreeExecFile = { fg = c.louis_bleu, style = "NONE" },

    NvimTreeGitDirty = { fg = c.error_red },
    NvimTreeGitStaged = { fg = c.foreground },
    NvimTreeGitMerge = { fg = c.peach },
    NvimTreeGitRenamed = { fg = c.peach },
    NvimTreeGitNew = { fg = c.sage },
    NvimTreeGitDeleted = { fg = c.error_red },

    -- Cmp
    CmpDocumentation = { fg = c.foreground, bg = c.none },
    CmpDocumentationBorder = { fg = c.foreground, bg = c.none },

    CmpItemAbbr = { fg = c.foreground, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.foreground, bg = c.none, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.louis_bleu, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.louis_bleu, bg = c.none },

    CmpItemKindDefault = { fg = c.mango, bg = c.none },
    CmpItemMenu = { fg = c.pink, bg = c.none },

    CmpItemKindKeyword = { fg = c.mango, bg = c.none },

    CmpItemKindVariable = { fg = c.purple, bg = c.none },
    CmpItemKindConstant = { fg = c.purple, bg = c.none },
    CmpItemKindReference = { fg = c.purple, bg = c.none },
    CmpItemKindValue = { fg = c.purple, bg = c.none },

    CmpItemKindFunction = { fg = c.orange, bg = c.none },
    CmpItemKindMethod = { fg = c.orange, bg = c.none },
    CmpItemKindConstructor = { fg = c.orange, bg = c.none },

    CmpItemKindClass = { fg = c.pink, bg = c.none },
    CmpItemKindInterface = { fg = c.pink, bg = c.none },
    CmpItemKindStruct = { fg = c.pink, bg = c.none },
    CmpItemKindEvent = { fg = c.pink, bg = c.none },
    CmpItemKindEnum = { fg = c.pink, bg = c.none },
    CmpItemKindUnit = { fg = c.pink, bg = c.none },

    CmpItemKindModule = { fg = c.peach, bg = c.none },

    CmpItemKindProperty = { fg = c.sage, bg = c.none },
    CmpItemKindField = { fg = c.sage, bg = c.none },
    CmpItemKindTypeParameter = { fg = c.sage, bg = c.none },
    CmpItemKindEnumMember = { fg = c.sage, bg = c.none },
    CmpItemKindOperator = { fg = c.sage, bg = c.none },
    CmpItemKindSnippet = { fg = c.mango, bg = c.none },

  }

  if config.telescope_theme then
    theme.base = vim.tbl_extend("force", theme.base, {
      -- Telescope
      TelescopeBorder = { fg = c.foreground, bg = c.none },
      TelescopePromptBorder = { fg = c.mint, bg = c.none },
      TelescopePromptNormal = { fg = c.foreground, bg = c.none },
      TelescopePromptPrefix = { fg = c.banana, bg = c.none },

      TelescopeNormal = { bg = c.background },

      TelescopePreviewTitle = { fg = c.mint, bg = c.none },
      TelescopePromptTitle = { fg = c.mint, bg = c.none },
      TelescopeResultsTitle = { fg = c.mint, bg = c.none },

      TelescopeSelection = { bg = c.comment },
    })
  end

  theme.base = vim.tbl_extend("force", theme.base, config.highlights or {})
  return theme
end

return M
