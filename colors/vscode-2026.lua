-- Port of the MIT-licensed VS Code Dark 2026 theme (Microsoft).
-- Source: Visual Studio Code.app/Contents/Resources/app/extensions/theme-defaults/themes/2026-dark.json
-- TextMate scopes are mapped to Vim, Tree-sitter, and LSP highlight groups.
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "vscode-2026"

local c = {
  bg = "#121314",
  panel = "#191A1B",
  popup = "#202122",
  line = "#242526",
  border = "#2A2B2C",
  fg = "#BBBEBF",
  ui = "#bfbfbf",
  muted = "#8C8C8C",
  line_number = "#858889",
  comment = "#8b949e",
  variable = "#c9d1d9",
  blue = "#79c0ff",
  string = "#a5d6ff",
  keyword = "#ff7b72",
  purple = "#d2a8ff",
  orange = "#ffa657",
  green = "#7ee787",
  accent = "#3994BC",
  button = "#297AA0",
  added = "#72C892",
  deleted = "#F28772",
  modified = "#0078D4", -- Inherited from dark_modern.json.
  error = "#f48771",
  warning = "#e5ba7d",
}

-- Neovim needs opaque colors; composite VS Code's RGBA colors over the surface.
local function blend(rgba, background)
  local alpha = tonumber(rgba:sub(8, 9), 16) / 255
  local rgb = {}
  for i = 2, 6, 2 do
    local fg = tonumber(rgba:sub(i, i + 1), 16)
    local bg = tonumber(background:sub(i, i + 1), 16)
    rgb[#rgb + 1] = math.floor(fg * alpha + bg * (1 - alpha) + 0.5)
  end
  return string.format("#%02x%02x%02x", unpack(rgb))
end

local groups = {
  Normal = { fg = c.fg, bg = c.bg },
  NormalNC = { fg = c.fg, bg = c.bg },
  NormalFloat = { fg = c.ui, bg = c.popup },
  FloatBorder = { fg = c.border, bg = c.popup },
  FloatTitle = { fg = c.ui, bg = c.popup, bold = true },
  WinSeparator = { fg = c.border },
  ColorColumn = { bg = c.line },
  Cursor = { fg = c.bg, bg = c.fg },
  CursorLine = { bg = c.line },
  CursorColumn = { bg = c.line },
  LineNr = { fg = c.line_number },
  CursorLineNr = { fg = c.fg },
  SignColumn = { bg = c.bg },
  FoldColumn = { fg = c.muted, bg = c.bg },
  Folded = { fg = c.muted, bg = c.line },
  NonText = { fg = c.border },
  EndOfBuffer = { fg = c.bg },
  Whitespace = { fg = blend("#8C8C8C4D", c.bg) },
  Visual = { bg = blend("#276782dd", c.bg) },
  VisualNOS = { bg = blend("#27678260", c.bg) },
  Search = { bg = blend("#27678280", c.bg) },
  IncSearch = { bg = blend("#27678290", c.bg), bold = true },
  MatchParen = { bg = blend("#3994BC55", c.bg), bold = true },
  Pmenu = { fg = c.ui, bg = c.popup },
  PmenuSel = { fg = c.ui, bg = blend("#FFFFFF26", c.popup) },
  PmenuSbar = { bg = c.line },
  PmenuThumb = { bg = c.muted },
  PmenuMatch = { fg = c.blue, bold = true },
  StatusLine = { fg = c.muted, bg = c.panel },
  StatusLineNC = { fg = c.muted, bg = c.bg },
  WinBar = { fg = c.muted, bg = c.bg },
  WinBarNC = { fg = c.muted, bg = c.bg },
  TabLine = { fg = c.muted, bg = c.popup },
  TabLineFill = { bg = c.popup },
  TabLineSel = { fg = c.ui, bg = c.bg, bold = true },
  Directory = { fg = c.blue },
  Title = { fg = c.blue, bold = true },
  MoreMsg = { fg = c.green },
  ModeMsg = { fg = c.ui },
  Question = { fg = c.blue },
  WarningMsg = { fg = c.warning },
  ErrorMsg = { fg = c.error },
  Conceal = { fg = c.muted },
  SpecialKey = { fg = c.muted },
  QuickFixLine = { bg = c.line },
  Comment = { fg = c.comment },
  Constant = { fg = c.blue },
  String = { fg = c.string },
  Character = { fg = c.keyword },
  Number = { fg = c.blue },
  Boolean = { fg = c.blue },
  Float = { fg = c.blue },
  Identifier = { fg = c.variable },
  Function = { fg = c.purple },
  Statement = { fg = c.keyword },
  Operator = { fg = c.keyword },
  Keyword = { fg = c.keyword },
  PreProc = { fg = c.keyword },
  Type = { fg = c.orange },
  StorageClass = { fg = c.keyword },
  Structure = { fg = c.keyword },
  Typedef = { fg = c.keyword },
  Special = { fg = c.keyword },
  Delimiter = { fg = c.fg },
  Underlined = { fg = c.string, underline = true },
  Ignore = { fg = c.muted },
  Error = { fg = "#ffa198", italic = true },
  Todo = { fg = c.blue, bold = true },
  Added = { fg = c.green },
  Changed = { fg = c.orange },
  Removed = { fg = "#ffa198" },
  DiffAdd = { bg = blend("#347d3926", c.bg) },
  DiffChange = { bg = blend("#3994BC26", c.bg) },
  DiffText = { bg = blend("#57ab5a4d", c.bg) },
  DiffDelete = { bg = blend("#c93c3726", c.bg) },
  GitSignsAdd = { fg = c.added },
  GitSignsChange = { fg = c.modified },
  GitSignsDelete = { fg = c.deleted },
  SnacksIndent = { fg = blend("#8384854D", c.bg) },
  SnacksIndentScope = { fg = "#838485" },
  SnacksPickerDir = { fg = c.muted },
  SnacksPickerMatch = { fg = "#48A0C7", bold = true },
  SnacksPickerListCursorLine = { fg = "#FFFFFF", bg = c.button },
  SnacksPickerSelected = { fg = c.green },
  SnacksDashboardHeader = { fg = c.accent },
  SnacksDashboardFooter = { fg = c.comment },
  WhichKey = { fg = c.blue },
  WhichKeyGroup = { fg = c.purple },
  WhichKeyDesc = { fg = c.ui },
  FlashLabel = { fg = c.bg, bg = c.orange, bold = true },
  BlinkCmpKind = { fg = c.blue },
  BlinkCmpLabelMatch = { fg = c.blue, bold = true },
  BlinkCmpGhostText = { fg = c.muted },
  ["@variable"] = { fg = c.variable },
  ["@variable.builtin"] = { fg = c.blue },
  ["@variable.parameter"] = { fg = c.variable },
  ["@variable.member"] = { fg = c.variable },
  ["@property"] = { fg = c.blue },
  ["@type.builtin"] = { fg = c.blue },
  ["@module"] = { fg = c.orange },
  ["@tag"] = { fg = c.green },
  ["@tag.builtin"] = { fg = c.green },
  ["@tag.attribute"] = { fg = c.variable },
  ["@tag.delimiter"] = { fg = c.fg },
  ["@string.special.symbol"] = { fg = c.string },
  ["@string.special.url"] = { fg = c.string, underline = true },
  ["@string.special.path"] = { fg = c.string },
  ["@string.escape"] = { fg = c.keyword },
  ["@string.special.regex"] = { fg = c.string },
  ["@punctuation.special"] = { fg = c.keyword },
  ["@markup.heading"] = { fg = c.blue, bold = true },
  ["@markup.quote"] = { fg = c.green },
  ["@markup.raw"] = { fg = c.blue },
  ["@markup.list"] = { fg = c.orange },
  ["@markup.strong"] = { fg = c.variable, bold = true },
  ["@markup.italic"] = { fg = c.variable, italic = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.link.label"] = { fg = c.string },
  ["@property.json"] = { fg = c.green },
  ["@label.json"] = { fg = c.green },
  ["@lsp.type.enumMember"] = { fg = c.blue },
  ["@lsp.mod.deprecated"] = { strikethrough = true },
}

local links = {
  lCursor = "Cursor", CursorIM = "Cursor", CurSearch = "IncSearch",
  PmenuMatchSel = "PmenuMatch", MsgArea = "Normal",
  ["@constant"] = "Constant", ["@constant.builtin"] = "Constant",
  ["@constant.macro"] = "Constant", ["@string"] = "String",
  ["@character"] = "Character", ["@number"] = "Number", ["@boolean"] = "Boolean",
  ["@function"] = "Function", ["@function.builtin"] = "Function",
  ["@function.call"] = "Function", ["@function.method"] = "Function",
  ["@function.method.call"] = "Function", ["@constructor"] = "Type",
  ["@type"] = "Type", ["@attribute"] = "PreProc", ["@keyword"] = "Keyword",
  ["@operator"] = "Operator", ["@punctuation.bracket"] = "Delimiter",
  ["@punctuation.delimiter"] = "Delimiter", ["@comment"] = "Comment",
  ["@markup.link.url"] = "Underlined",
  ["@lsp.type.variable"] = "@variable", ["@lsp.type.parameter"] = "@variable.parameter",
  ["@lsp.type.property"] = "@property", ["@lsp.type.function"] = "Function",
  ["@lsp.type.method"] = "Function", ["@lsp.type.class"] = "Type",
  ["@lsp.type.interface"] = "Type", ["@lsp.type.struct"] = "Type",
  ["@lsp.type.enum"] = "Type", ["@lsp.type.type"] = "Type",
  ["@lsp.type.typeParameter"] = "Type", ["@lsp.type.namespace"] = "@module",
  LspReferenceText = "VisualNOS", LspReferenceRead = "VisualNOS",
  LspReferenceWrite = "VisualNOS", LspInlayHint = "Comment", LspCodeLens = "Comment",
  SnacksNormal = "NormalFloat", SnacksNormalNC = "NormalFloat",
  SnacksPickerBorder = "FloatBorder", SnacksPickerTitle = "FloatTitle",
  SnacksPickerInput = "NormalFloat", SnacksPickerNormal = "NormalFloat",
  BlinkCmpMenu = "Pmenu", BlinkCmpMenuBorder = "FloatBorder",
  BlinkCmpMenuSelection = "PmenuSel", BlinkCmpDoc = "NormalFloat",
  BlinkCmpDocBorder = "FloatBorder", BlinkCmpLabel = "NormalFloat",
  WhichKeyNormal = "NormalFloat", WhichKeyBorder = "FloatBorder",
  TroubleNormal = "NormalFloat", TroubleNormalNC = "NormalFloat",
  NoiceCmdlinePopup = "NormalFloat", NoiceCmdlinePopupBorder = "FloatBorder",
  BufferLineFill = "TabLineFill", BufferLineBackground = "TabLine",
  BufferLineBufferSelected = "TabLineSel", BufferLineBufferVisible = "TabLine",
  BufferLineIndicatorSelected = "Directory",
}

for name, color in pairs({ Error = c.error, Warn = c.warning, Info = c.accent, Hint = c.muted, Ok = c.added }) do
  groups["Diagnostic" .. name] = { fg = color }
  groups["DiagnosticVirtualText" .. name] = { fg = color }
  groups["DiagnosticUnderline" .. name] = { sp = color, undercurl = true }
end
for name, color in pairs({ Bad = c.error, Cap = c.warning, Local = c.accent, Rare = c.purple }) do
  groups["Spell" .. name] = { sp = color, undercurl = true }
end
for name, opts in pairs(groups) do
  vim.api.nvim_set_hl(0, name, opts)
end
for name, target in pairs(links) do
  vim.api.nvim_set_hl(0, name, { link = target })
end

-- VS Code's default dark ANSI palette; Dark 2026 inherits these colors.
local terminal = {
  "#000000", "#cd3131", "#0dbc79", "#e5e510", "#2472c8", "#bc3fbc", "#11a8cd", "#e5e5e5",
  "#666666", "#f14c4c", "#23d18b", "#f5f543", "#3b8eea", "#d670d6", "#29b8db", "#e5e5e5",
}
for i, color in ipairs(terminal) do
  vim.g["terminal_color_" .. (i - 1)] = color
end
