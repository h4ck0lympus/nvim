-- Codeforces-like LIGHT theme (closer to the actual CF editor)
-- Save as: ~/.config/nvim/colors/codeforces.lua
-- Use: vim.o.termguicolors=true; vim.o.background="light"; vim.cmd("colorscheme codeforces")

local M = {}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "light"
  vim.g.colors_name = "codeforces"

  -- Palette tuned to CF-ish highlighting
  local c = {
    bg        = "#FFFFFF",
    bg2       = "#F3F3F3",
    bg3       = "#EAEAEA",
    fg        = "#111111",
    fg2       = "#2A2A2A",
    muted     = "#6B6B6B",
    lineNr    = "#8A8A8A",

    -- CF vibes:
    preproc   = "#008000", -- green for #include/#define
    comment   = "#008000", -- green comments
    keyword   = "#0000FF", -- blue keywords
    type      = "#2B91AF", -- teal-ish types (common in CF-like themes)
    string    = "#A31515", -- red/brown strings
    number    = "#7A1FA2", -- purple numbers
    constant  = "#B54A00", -- orange-brown constants
    special   = "#AF00DB", -- magenta-ish for macros/odd stuff

    error     = "#C62828",
    warn      = "#B26A00",
    info      = "#1565C0",
    hint      = "#2E7D32",

    select    = "#CFE8FF",
    search    = "#FFE6A7",
    match     = "#D7F5D1",
    border    = "#C9C9C9",
  }

  -- UI
  hi("Normal",       { fg = c.fg, bg = c.bg })
  hi("NormalNC",     { fg = c.fg, bg = c.bg })
  hi("NormalFloat",  { fg = c.fg, bg = c.bg })
  hi("FloatBorder",  { fg = c.border, bg = c.bg })
  hi("WinSeparator", { fg = c.border, bg = c.bg })

  hi("CursorLine",   { bg = c.bg2 })
  hi("CursorColumn", { bg = c.bg2 })

  hi("LineNr",       { fg = c.lineNr, bg = c.bg })
  hi("CursorLineNr", { fg = c.fg2, bg = c.bg2, bold = true })
  hi("SignColumn",   { bg = c.bg })
  hi("Folded",       { fg = c.muted, bg = c.bg2 })
  hi("ColorColumn",  { bg = c.bg2 })

  hi("Visual",       { bg = c.select })
  hi("Search",       { bg = c.search, fg = c.fg })
  hi("IncSearch",    { bg = "#FFD37A", fg = c.fg, bold = true })
  hi("MatchParen",   { bg = c.match, fg = c.fg, bold = true })

  hi("Pmenu",        { fg = c.fg, bg = c.bg2 })
  hi("PmenuSel",     { fg = c.fg, bg = "#D6ECFF", bold = true })
  hi("PmenuSbar",    { bg = c.bg3 })
  hi("PmenuThumb",   { bg = "#BDBDBD" })

  hi("StatusLine",   { fg = c.fg, bg = c.bg2 })
  hi("StatusLineNC", { fg = c.muted, bg = c.bg2 })

  -- Diagnostics
  hi("DiagnosticError", { fg = c.error })
  hi("DiagnosticWarn",  { fg = c.warn })
  hi("DiagnosticInfo",  { fg = c.info })
  hi("DiagnosticHint",  { fg = c.hint })

  hi("DiagnosticUnderlineError", { undercurl = true, sp = c.error })
  hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.warn })
  hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.info })
  hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.hint })

  -- Classic syntax groups
  hi("Comment",    { fg = c.comment, italic = true })
  hi("String",     { fg = c.string })
  hi("Character",  { fg = c.string })
  hi("Number",     { fg = c.number })
  hi("Float",      { fg = c.number })
  hi("Boolean",    { fg = c.constant, bold = true })
  hi("Constant",   { fg = c.constant })

  hi("Identifier", { fg = c.fg })
  hi("Function",   { fg = c.fg }) -- CF editor usually keeps functions close to normal text

  hi("Keyword",    { fg = c.keyword, bold = true })
  hi("Statement",  { fg = c.keyword, bold = true })
  hi("Conditional",{ fg = c.keyword, bold = true })
  hi("Repeat",     { fg = c.keyword, bold = true })
  hi("Operator",   { fg = c.fg })

  hi("Type",       { fg = c.type })
  hi("Structure",  { fg = c.type })
  hi("Typedef",    { fg = c.type })

  hi("PreProc",    { fg = c.preproc })
  hi("Include",    { fg = c.preproc })
  hi("Define",     { fg = c.preproc })
  hi("Macro",      { fg = c.preproc })
  hi("PreCondit",  { fg = c.preproc })

  hi("Special",    { fg = c.special })
  hi("Delimiter",  { fg = c.fg2 })
  hi("Todo",       { fg = c.fg, bg = "#FFF3BF", bold = true })
  hi("Error",      { fg = c.bg, bg = c.error, bold = true })

  -- Treesitter
  hi("@comment",   { link = "Comment" })
  hi("@string",    { link = "String" })
  hi("@number",    { link = "Number" })
  hi("@boolean",   { link = "Boolean" })
  hi("@constant",  { link = "Constant" })
  hi("@function",  { link = "Function" })
  hi("@keyword",   { link = "Keyword" })
  hi("@type",      { link = "Type" })
  hi("@preproc",   { link = "PreProc" })

  hi("@variable",  { fg = c.fg })
  hi("@parameter", { fg = c.fg2 })
  hi("@operator",  { link = "Operator" })
  hi("@punctuation.delimiter", { fg = c.fg2 })
  hi("@punctuation.bracket",   { fg = c.fg2 })
end

M.setup()
return M

