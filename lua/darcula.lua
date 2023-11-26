---@class Config
---@field opt string Your config option
local config = {}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {})
	if vim.g.colors_name ~= nil then vim.cmd "highlight clear" end

	-- neovim version should be higher than 0.8.3
	if vim.fn.has "nvim-0.8.3" == 0 then
		vim.cmd "echohl WarningMsg | echo 'Your neovim version is lower than 0.8.3, some features may not work correctly!' | echohl None"
	end

	vim.g.colors_name = "afodarcula"
	vim.o.termguicolors = true
	M.configure_highlights()
end

M.configure_highlights = function()
	-- colors
	-- Highlight groups
	local hi = vim.api.nvim_set_hl

	hi(0, "@attribute", { link = "TSAttribute" })
	hi(0, "@boolean", { link = "TSBoolean" })
	hi(0, "@character", { link = "TSCharacter" })
	hi(0, "@character.special", { link = "SpecialChar" })
	hi(0, "@class", { link = "TSType" })
	hi(0, "@comment", { link = "TSComment" })
	hi(0, "@conditional", { link = "TSConditional" })
	hi(0, "@constant", { link = "TSConstant" })
	hi(0, "@constant.builtin", { link = "TSConstantBuiltin" })
	hi(0, "@constant.macro", { link = "TSConstant" })
	hi(0, "@constructor", { link = "TSConstructor" })
	hi(0, "@decorator", { link = "Identifier" })
	hi(0, "@enum", { link = "TSType" })
	hi(0, "@enumMember", { link = "Constant" })
	hi(0, "@error", { link = "TSError" })
	hi(0, "@event", { link = "Identifier" })
	hi(0, "@exception", { link = "TSException" })
	hi(0, "@field", { link = "TSField" })
	hi(0, "@float", { link = "TSFloat" })
	hi(0, "@function", { link = "TSFunction" })
	hi(0, "@function.builtin", { link = "TSFuncBuiltin" })
	hi(0, "@function.call", { link = "TSFunctionCall" })
	hi(0, "@function.macro", { link = "TSFuncMacro" })
	hi(0, "@include", { link = "TSInclude" })
	hi(0, "@interface", { link = "Structure" })
	hi(0, "@keyword", { link = "TSKeyword" })
	hi(0, "@keyword.function", { link = "TSKeywordFunction" })
	hi(0, "@keyword.operator", { link = "TSKeywordOperator" })
	hi(0, "@keyword.return", { link = "TSKeyword" })
	hi(0, "@label", { link = "TSLabel" })
	hi(0, "@method", { link = "TSMethod" })
	hi(0, "@method.call", { link = "TSMethodCall" })
	hi(0, "@modifier", { link = "Identifier" })
	hi(0, "@namespace", { link = "TSNamespace" })
	hi(0, "@none", { link = "TSNone" })
	hi(0, "@number", { link = "TSNumber" })
	hi(0, "@operator", { link = "TSOperator" })
	hi(0, "@parameter", { link = "TSParameter" })
	hi(0, "@property", { link = "TSVariable" })
	hi(0, "@punctuation.bracket", { link = "TSPunctBracket" })
	hi(0, "@punctuation.delimiter", { link = "TSPunctDelimiter" })
	hi(0, "@punctuation.special", { link = "TSPunctSpecial" })
	hi(0, "@regexp", { link = "TSStringRegex" })
	hi(0, "@repeat", { link = "TSRepeat" })
	hi(0, "@string", { link = "TSString" })
	hi(0, "@string.escape", { link = "TSStringEscape" })
	hi(0, "@string.regex", { link = "TSStringRegex" })
	hi(0, "@string.special", { link = "SpecialChar" })
	hi(0, "@struct", { link = "TSType" })
	hi(0, "@symbol", { link = "TSSymbol" })
	hi(0, "@tag", { link = "TSTag" })
	hi(0, "@tag.attribute", { link = "TSAttribute" })
	hi(0, "@tag.delimiter", { link = "TSTagDelimiter" })
	hi(0, "@text", { link = "TSText" })
	hi(0, "@text.danger", { link = "DiagnosticError" })
	hi(0, "@text.emphasis", { link = "TSEmphasis" })
	hi(0, "@text.environment", { link = "Macro" })
	hi(0, "@text.environment.name", { link = "Type" })
	hi(0, "@text.literal", { link = "TSLiteral" })
	hi(0, "@text.math", { link = "Number" })
	hi(0, "@text.note", { link = "Tag" })
	hi(0, "@text.reference", { link = "TSParameterReference" })
	hi(0, "@text.strike", { link = "TSStrike" })
	hi(0, "@text.strong", { link = "TSStrong" })
	hi(0, "@text.title", { link = "TSTitle" })
	hi(0, "@text.todo", { link = "Todo" })
	hi(0, "@text.underline", { link = "TSUnderline" })
	hi(0, "@text.uri", { link = "TSURI" })
	hi(0, "@text.warning", { link = "DiagnosticWarn" })
	hi(0, "@type", { link = "TSType" })
	hi(0, "@type.builtin", { link = "TSTypeBuiltin" })
	hi(0, "@type.definition", { link = "TSTypeDefinition" })
	hi(0, "@type.qualifier", { link = "TSType" })
	hi(0, "@typeParameter", { link = "Type" })
	hi(0, "@variable", { link = "TSVariable" })
	hi(0, "@variable.builtin", { link = "TSVariableBuiltin" })
	hi(0, "@lsp.type.namespace", { link = "TSNamespace" })
	hi(0, "@lsp.type.variable", { link = "TSVariable" })
	hi(0, "@lsp.type.parameter", { link = "TSVariable" })
	hi(0, "@lsp.typemod.variable.readonly", { link = "TSConstant" })
	hi(0, "@lsp.type.type", { link = "TSType" })
	hi(0, "@lsp.type.function", {})
	hi(0, "@lsp.type.method", {})
	hi(0, "@lsp.type.comment", {})
	hi(0, "@lsp.typemod.variable.defaultLibrary", { link = "TSKeyword" })
	hi(0, "@lsp.mod.defaultLibrary.go", { link = "TSKeyword" })
	hi(0, "@lsp.type.property", { link = "TSField" })
	hi(0, "Bold", { bold = true })
	hi(0, "Boolean", { fg = "#9976a8" })
	hi(0, "BufferDefaultCurrent", { ctermfg = 255, fg = "#C9D0D3" })
	hi(0, "BufferDefaultCurrentERROR", { ctermfg = 15, fg = "#f43753" })
	hi(0, "BufferDefaultCurrentHINT", { ctermfg = 168, fg = "#d5508f" })
	hi(0, "BufferDefaultCurrentINFO", { ctermfg = 217, fg = "#ffb7b7" })
	hi(0, "BufferDefaultCurrentIndex", { ctermfg = 224, fg = "#73cef4" })
	hi(0, "BufferDefaultCurrentMod", { ctermfg = 224, fg = "#f43753" })
	hi(0, "BufferDefaultCurrentSign", { ctermfg = 224, fg = "#73cef4" })
	hi(0, "BufferDefaultCurrentTarget", { bold = true, ctermfg = 9, fg = "#ff0000" })
	hi(0, "BufferDefaultCurrentWARN", { ctermfg = 224, fg = "#f43753" })
	hi(0, "BufferDefaultInactive", { bg = "#383838", ctermfg = 102, fg = "#4c4c4c" })
	hi(0, "BufferDefaultInactiveERROR", { bg = "#383838", ctermfg = 15, fg = "#f43753" })
	hi(0, "BufferDefaultInactiveHINT", { bg = "#383838", ctermfg = 168, fg = "#d5508f" })
	hi(0, "BufferDefaultInactiveINFO", { bg = "#383838", ctermfg = 217, fg = "#ffb7b7" })
	hi(0, "BufferDefaultInactiveIndex", { bg = "#383838", ctermfg = 12, fg = "#4c4c4c" })
	hi(0, "BufferDefaultInactiveMod", { bg = "#383838", ctermfg = 224, fg = "#f43753" })
	hi(0, "BufferDefaultInactiveSign", { bg = "#383838", ctermfg = 12, fg = "#4c4c4c" })
	hi(
		0,
		"BufferDefaultInactiveTarget",
		{ bg = "#383838", bold = true, ctermfg = 9, fg = "#ff0000" }
	)
	hi(0, "BufferDefaultInactiveWARN", { bg = "#383838", ctermfg = 224, fg = "#f43753" })
	hi(0, "BufferDefaultTabpageFill", { bg = "#383838", ctermfg = 102, fg = "#4c4c4c" })
	hi(
		0,
		"BufferDefaultTabpages",
		{ bg = "#383838", bold = true, ctermfg = 224, fg = "#73cef4" }
	)
	hi(0, "BufferDefaultVisible", { bg = "#383838", ctermfg = 255, fg = "#c9d05c" })
	hi(0, "BufferDefaultVisibleERROR", { bg = "#383838", ctermfg = 15, fg = "#f43753" })
	hi(0, "BufferDefaultVisibleHINT", { bg = "#383838", ctermfg = 168, fg = "#d5508f" })
	hi(0, "BufferDefaultVisibleINFO", { bg = "#383838", ctermfg = 217, fg = "#ffb7b7" })
	hi(0, "BufferDefaultVisibleIndex", { bg = "#383838", ctermfg = 255, fg = "#c9d05c" })
	hi(0, "BufferDefaultVisibleMod", { bg = "#383838", ctermfg = 224, fg = "#f43753" })
	hi(0, "BufferDefaultVisibleSign", { bg = "#383838", ctermfg = 255, fg = "#c9d05c" })
	hi(
		0,
		"BufferDefaultVisibleTarget",
		{ bg = "#383838", bold = true, ctermfg = 9, fg = "#ff0000" }
	)
	hi(0, "BufferDefaultVisibleWARN", { bg = "#383838", ctermfg = 224, fg = "#f43753" })
	hi(0, "Character", { fg = "#c9d05c" })
	hi(0, "Pmenu", { bg = "#3C3F40", ctermbg = 13, ctermfg = 0 })
	hi(0, "PmenuSel", { bg = "#4B4E4F", ctermbg = 0, ctermfg = 242 })
	hi(0, "CmpDocumentation", { fg = "#C9D0D3" })
	hi(0, "CmpDocumentationBorder", { fg = "#C9D0D3" })
	hi(0, "CmpItemAbbr", { bg = "#383838", fg = "#C9D0D3" })
	hi(0, "CmpItemAbbrDefault", { fg = "#C9D0D3" })
	hi(0, "CmpItemAbbrDeprecated", { fg = "#4c4c4c", strikethrough = true })
	hi(0, "CmpItemAbbrDeprecatedDefault", { fg = "#4c4c4c" })
	hi(0, "CmpItemAbbrMatch", { fg = "#b3deef" })
	hi(0, "CmpItemAbbrMatchDefault", { fg = "#C9D0D3" })
	hi(0, "CmpItemAbbrMatchFuzzy", { fg = "#b3deef" })
	hi(0, "CmpItemAbbrMatchFuzzyDefault", { fg = "#C9D0D3" })
	hi(0, "CmpItemKindClass", { fg = "#ffc24b" })
	hi(0, "CmpItemKindClassDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindColorDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindConstant", { fg = "#dc9656" })
	hi(0, "CmpItemKindConstantDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindConstructor", { fg = "#b3deef" })
	hi(0, "CmpItemKindConstructorDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindDefault", { fg = "#73cef4" })
	hi(0, "CmpItemKindEnum", { fg = "#ffc24b" })
	hi(0, "CmpItemKindEnumDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindEnumMember", { fg = "#ffc24b" })
	hi(0, "CmpItemKindEnumMemberDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindEvent", { fg = "#ffc24b" })
	hi(0, "CmpItemKindEventDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindField", { fg = "#f43753" })
	hi(0, "CmpItemKindFieldDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindFileDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindFolderDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindFunction", { fg = "#b3deef" })
	hi(0, "CmpItemKindFunctionDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindInterface", { fg = "#ffc24b" })
	hi(0, "CmpItemKindInterfaceDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindKeyword", { fg = "#d3b987" })
	hi(0, "CmpItemKindKeywordDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindMethod", { fg = "#b3deef" })
	hi(0, "CmpItemKindMethodDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindModule", { fg = "#C9D0D3" })
	hi(0, "CmpItemKindModuleDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindOperator", { fg = "#C9D0D3" })
	hi(0, "CmpItemKindOperatorDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindProperty", { fg = "#f43753" })
	hi(0, "CmpItemKindPropertyDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindReference", { fg = "#f43753" })
	hi(0, "CmpItemKindReferenceDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindSnippet", { fg = "#b8b8b8" })
	hi(0, "CmpItemKindSnippetDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindStruct", { fg = "#ffc24b" })
	hi(0, "CmpItemKindStructDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindTextDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindTypeParameter", { fg = "#ffc24b" })
	hi(0, "CmpItemKindTypeParameterDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindUnit", { fg = "#ffc24b" })
	hi(0, "CmpItemKindUnitDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindValue", { fg = "#dc9656" })
	hi(0, "CmpItemKindValueDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemKindVariable", { fg = "#f43753" })
	hi(0, "CmpItemKindVariableDefault", { link = "CmpItemKind" })
	hi(0, "CmpItemMenu", { fg = "#b8b8b8" })
	hi(0, "CmpItemMenuDefault", { fg = "#C9D0D3" })
	hi(0, "ColorColumn", { bg = "#383838", ctermbg = 1 })
	hi(0, "Comment", { ctermfg = 14, fg = "#4c4c4c" })
	hi(0, "Conceal", { ctermbg = 242, ctermfg = 7, fg = "#b3deef" })
	hi(0, "Conditional", { fg = "#d3b987" })
	hi(0, "ConflictMarkerBegin", { bg = "#2f7366" })
	hi(0, "ConflictMarkerCommonAncestorsHunk", { bg = "#754a81" })
	hi(0, "ConflictMarkerEnd", { bg = "#2f628e" })
	hi(0, "ConflictMarkerOurs", { bg = "#2e5049" })
	hi(0, "ConflictMarkerTheirs", { bg = "#344f69" })
	hi(0, "Constant", { ctermfg = 13, fg = "#9976a8" })
	hi(0, "CopilotSuggestion", { ctermfg = 244, fg = "#808080" })
	hi(0, "Cursor", { bg = "#eeeeee", fg = "#2B2B2B" })
	hi(0, "CursorColumn", { bg = "#383838", ctermbg = 242 })
	hi(0, "CursorLine", { bg = "#383838" })
	hi(0, "CursorLineNr", { bg = "#383838", bold = true, ctermfg = 11, fg = "#b8b8b8" })
	hi(0, "DapUIBreakpointsCurrentLine", { bold = true, fg = "#a9ff68" })
	hi(0, "DapUIBreakpointsDisabledLine", { fg = "#424242" })
	hi(0, "DapUIBreakpointsInfo", { fg = "#a9ff68" })
	hi(0, "DapUIBreakpointsPath", { fg = "#00f1f5" })
	hi(0, "DapUIDecoration", { fg = "#00f1f5" })
	hi(0, "DapUIFloatBorder", { fg = "#00f1f5" })
	hi(0, "DapUILineNumber", { fg = "#00f1f5" })
	hi(0, "DapUIModifiedValue", { bold = true, fg = "#00f1f5" })
	hi(0, "DapUIPlayPause", { fg = "#a9ff68" })
	hi(0, "DapUIPlayPauseNC", { fg = "#a9ff68" })
	hi(0, "DapUIRestart", { fg = "#a9ff68" })
	hi(0, "DapUIRestartNC", { fg = "#a9ff68" })
	hi(0, "DapUIScope", { fg = "#00f1f5" })
	hi(0, "DapUISource", { fg = "#d484ff" })
	hi(0, "DapUIStepBack", { fg = "#00f1f5" })
	hi(0, "DapUIStepBackNC", { fg = "#00f1f5" })
	hi(0, "DapUIStepInto", { fg = "#00f1f5" })
	hi(0, "DapUIStepIntoNC", { fg = "#00f1f5" })
	hi(0, "DapUIStepOut", { fg = "#00f1f5" })
	hi(0, "DapUIStepOutNC", { fg = "#00f1f5" })
	hi(0, "DapUIStepOver", { fg = "#00f1f5" })
	hi(0, "DapUIStepOverNC", { fg = "#00f1f5" })
	hi(0, "DapUIStop", { fg = "#f70067" })
	hi(0, "DapUIStopNC", { fg = "#f70067" })
	hi(0, "DapUIStoppedThread", { fg = "#00f1f5" })
	hi(0, "DapUIThread", { fg = "#a9ff68" })
	hi(0, "DapUIType", { fg = "#d484ff" })
	hi(0, "DapUIUnavailable", { fg = "#424242" })
	hi(0, "DapUIUnavailableNC", { fg = "#424242" })
	hi(0, "DapUIWatchesEmpty", { fg = "#f70067" })
	hi(0, "DapUIWatchesError", { fg = "#f70067" })
	hi(0, "DapUIWatchesValue", { fg = "#a9ff68" })
	hi(0, "Debug", { fg = "#f43753" })
	hi(0, "Define", { fg = "#d3b987" })
	hi(0, "DefinitionArrow", { fg = "#ad475f" })
	hi(0, "DefinitionBorder", { fg = "#b3deef" })
	hi(0, "DefinitionFile", { bg = "#151838" })
	hi(0, "Definitions", { bold = true, fg = "#cba6f7" })
	hi(0, "DefinitionsIcon", { fg = "#e3e346" })
	hi(0, "Delimiter", { fg = "#a16946" })
	hi(0, "DiagnosticError", { ctermfg = 1, fg = "#f43753" })
	hi(0, "DiagnosticHint", { ctermfg = 7, fg = "#73cef4" })
	hi(0, "DiagnosticInfo", { ctermfg = 4, fg = "#C9D0D3" })
	hi(0, "DiagnosticLineCol", { fg = "#73797e" })
	hi(0, "DiagnosticMap", { fg = "#cf80ce" })
	hi(0, "DiagnosticQuickFix", { bold = true, fg = "#4dd158" })
	hi(0, "DiagnosticUnderlineError", { sp = "#f43753", undercurl = true })
	hi(0, "DiagnosticUnderlineHint", { sp = "#73cef4", undercurl = true })
	hi(0, "DiagnosticUnderlineInformation", { sp = "#a16946", undercurl = true })
	hi(0, "DiagnosticUnderlineWarn", { sp = "#d3b987", undercurl = true })
	hi(0, "DiagnosticUnderlineWarning", { sp = "#d3b987", undercurl = true })
	hi(0, "DiagnosticWarn", { ctermfg = 3, fg = "#d3b987" })
	hi(0, "DiffAdd", { ctermbg = 4, fg = "#c9d05c" })
	hi(0, "DiffAdded", { fg = "#c9d05c" })
	hi(0, "DiffChange", { ctermbg = 5, fg = "#4c4c4c" })
	hi(0, "DiffDelete", { bold = true, ctermbg = 6, ctermfg = 12, fg = "#f43753" })
	hi(0, "DiffFile", { fg = "#f43753" })
	hi(0, "DiffLine", { fg = "#b3deef" })
	hi(0, "DiffNewFile", { fg = "#c9d05c" })
	hi(0, "DiffRemoved", { fg = "#f43753" })
	hi(0, "DiffText", { bold = true, ctermbg = 9, fg = "#b3deef" })
	hi(0, "Directory", { ctermfg = 159, fg = "#b3deef" })
	hi(0, "Error", { bg = "#f43753", ctermbg = 9, ctermfg = 15, fg = "#2B2B2B" })
	hi(0, "ErrorMsg", { ctermbg = 1, ctermfg = 15, fg = "#f43753" })
	hi(0, "Exception", { fg = "#f43753" })
	hi(0, "EyelinerDimmed", { fg = "#4c4c4c" })
	hi(0, "EyelinerPrimary", { fg = "#dc9656" })
	hi(0, "EyelinerSecondary", { fg = "#d3b987" })
	hi(0, "FinderParam", { bg = "#392a52", bold = true, fg = "#cba6f7" })
	hi(0, "FinderSpinner", { bold = true, fg = "#b33076" })
	hi(0, "FinderSpinnerBorder", { fg = "#51afef" })
	hi(0, "FinderSpinnerTitle", { bold = true, fg = "#b33076" })
	hi(0, "FinderVirtText", { fg = "#c95942" })
	hi(0, "Float", { fg = "#dc9656" })
	hi(0, "FloatBorder", { fg = "#C9D0D3" })
	hi(0, "FocusedSymbol", { bg = "#383838", fg = "#c9d05c" })
	hi(0, "FoldColumn", { ctermbg = 242, ctermfg = 14, fg = "#73cef4" })
	hi(0, "Folded", { bg = "#383838", ctermbg = 242, ctermfg = 14, fg = "#4c4c4c" })
	hi(0, "Function", { fg = "#b3deef" })
	hi(0, "GitGutterAdd", { bg = "#2B2B2B", fg = "#c9d05c" })
	hi(0, "GitGutterChange", { bg = "#2B2B2B", fg = "#b3deef" })
	hi(0, "GitGutterChangeDelete", { bg = "#2B2B2B", fg = "#d3b987" })
	hi(0, "GitGutterDelete", { bg = "#2B2B2B", fg = "#f43753" })
	hi(0, "GitSignsStagedAdd", { bg = "#2B2B2B", fg = "#64682e" })
	hi(0, "GitSignsStagedAddLn", { bg = "#2B2B2B", fg = "#64682e" })
	hi(0, "GitSignsStagedAddNr", { bg = "#2B2B2B", fg = "#64682e" })
	hi(0, "GitSignsStagedChange", { bg = "#2B2B2B", fg = "#596f77" })
	hi(0, "GitSignsStagedChangeLn", { bg = "#2B2B2B", fg = "#262626" })
	hi(0, "GitSignsStagedChangeNr", { bg = "#2B2B2B", fg = "#596f77" })
	hi(0, "GitSignsStagedChangedelete", { bg = "#2B2B2B", fg = "#596f77" })
	hi(0, "GitSignsStagedChangedeleteLn", { bg = "#2B2B2B", fg = "#262626" })
	hi(0, "GitSignsStagedChangedeleteNr", { bg = "#2B2B2B", fg = "#596f77" })
	hi(0, "GitSignsStagedDelete", { bg = "#2B2B2B", fg = "#7a1b29" })
	hi(0, "GitSignsStagedDeleteNr", { bg = "#2B2B2B", fg = "#7a1b29" })
	hi(0, "GitSignsStagedTopdelete", { bg = "#2B2B2B", fg = "#7a1b29" })
	hi(0, "GitSignsStagedTopdeleteNr", { bg = "#2B2B2B", fg = "#7a1b29" })
	hi(0, "HopNextKey", { bold = true, ctermfg = 198, fg = "#ff007c" })
	hi(0, "HopNextKey1", { bold = true, ctermfg = 45, fg = "#00dfff" })
	hi(0, "HopNextKey2", { ctermfg = 33, fg = "#2b8db3" })
	hi(0, "HopPreview", { link = "IncSearch" })
	hi(0, "HopUnmatched", { ctermfg = 242, fg = "#666666", sp = "#666666" })
	hi(0, "Identifier", { ctermfg = 14, fg = "#f43753" })
	hi(0, "Ignore", { ctermfg = 0, fg = "#2B2B2B" })
	hi(0, "IlluminatedWordRead", { sp = "#b8b8b8", underline = true })
	hi(0, "IlluminatedWordText", { sp = "#b8b8b8", underline = true })
	hi(0, "IlluminatedWordWrite", { sp = "#b8b8b8", underline = true })
	hi(0, "Implements", { bold = true, fg = "#cba6f7" })
	hi(0, "ImplementsIcon", { fg = "#e3e346" })
	hi(0, "IncSearch", { bg = "#dc9656", fg = "#383838" })
	hi(0, "Include", { fg = "#C07C41" })
	hi(0, "IndentBlanklineChar", { fg = "#484848", nocombine = true })
	hi(0, "IndentBlanklineContextChar", { fg = "#b8b8b8", nocombine = true })
	hi(0, "IndentBlanklineContextStart", { sp = "#ffc24b", underline = true })
	hi(0, "IndentBlanklineSpaceChar", { ctermfg = 12, fg = "#4c4c4c", nocombine = true })
	hi(
		0,
		"IndentBlanklineSpaceCharBlankline",
		{ ctermfg = 12, fg = "#4c4c4c", nocombine = true }
	)
	hi(0, "Keyword", { fg = "#d3b987" })
	hi(0, "LSOutlinePreviewBorder", { fg = "#52ad70" })
	hi(0, "Label", { fg = "#ffc24b" })
	hi(0, "LineNr", { ctermfg = 11, fg = "#b8b8b8" })
	hi(0, "LspDiagnosticsDefaultError", { link = "DiagnosticError" })
	hi(0, "LspDiagnosticsDefaultHint", { link = "DiagnosticHint" })
	hi(0, "LspDiagnosticsDefaultInformation", { link = "DiagnosticInfo" })
	hi(0, "LspDiagnosticsDefaultWarning", { link = "DiagnosticWarn" })
	hi(0, "LspDiagnosticsUnderlineError", { link = "DiagnosticUnderlineError" })
	hi(0, "LspDiagnosticsUnderlineHint", { link = "DiagnosticUnderlineHint" })
	hi(
		0,
		"LspDiagnosticsUnderlineInformation",
		{ link = "DiagnosticUnderlineInformation" }
	)
	hi(0, "LspDiagnosticsUnderlineWarning", { link = "DiagnosticUnderlineWarning" })
	hi(0, "LspReferenceRead", { sp = "#b8b8b8", underline = true })
	hi(0, "LspReferenceText", { sp = "#b8b8b8", underline = true })
	hi(0, "LspReferenceWrite", { sp = "#b8b8b8", underline = true })
	hi(0, "LspSagaAutoPreview", { fg = "#51afef" })
	hi(0, "LspSagaCodeActionBorder", { fg = "#cba6f7" })
	hi(0, "LspSagaCodeActionContent", { bold = true, fg = "#98be65" })
	hi(0, "LspSagaCodeActionTitle", { bold = true, fg = "#da8548" })
	hi(0, "LspSagaDiagnosticBorder", { fg = "#cba6f7" })
	hi(0, "LspSagaDiagnosticHeader", { fg = "#afd700" })
	hi(0, "LspSagaFinderSelection", { bold = true, fg = "#89d957" })
	hi(0, "LspSagaHoverBorder", { fg = "#f7bb3b" })
	hi(0, "LspSagaLspFinderBorder", { fg = "#51afef" })
	hi(0, "LspSagaRenameBorder", { fg = "#3bb6c4" })
	hi(0, "LspSagaSignatureHelpBorder", { fg = "#98be65" })
	hi(0, "Macro", { fg = "#4dace4" })
	hi(0, "MatchParen", { bg = "#4c4c4c", ctermbg = 6 })
	hi(0, "ModeMsg", { bold = true, fg = "#c9d05c" })
	hi(0, "MoreMsg", { bold = true, ctermfg = 121, fg = "#c9d05c" })
	hi(0, "NERDTreeFile", { fg = "#C9D0D3" })
	hi(0, "NERDTreeCWD", { fg = "#C9D0D3" })
	hi(0, "NERDTreeGitStatusIgnored", { ctermfg = 81, fg = "#4c4c4c" })
	hi(0, "NERDTreeGitStatusModified", { ctermfg = 224, fg = "#73cef4" })
	hi(0, "NERDTreeGitStatusRenamed", { ctermfg = 225, fg = "#b3deef" })
	hi(0, "NERDTreeGitStatusUntracked", { ctermfg = 14, fg = "#4c4c4c" })
	hi(0, "NonText", { bold = true, ctermfg = 12, fg = "#4c4c4c" })
	hi(0, "Normal", { bg = "#2B2B2B", fg = "#C9D0D3" })
	hi(0, "NormalFloat", { fg = "#C9D0D3" })
	hi(0, "NormalNC", { fg = "#C9D0D3" })
	hi(0, "NotifyDEBUGBody", { link = "Normal" })
	hi(0, "NotifyDEBUGBorder", { fg = "#73cef4" })
	hi(0, "NotifyDEBUGIcon", { fg = "#73cef4" })
	hi(0, "NotifyDEBUGTitle", { fg = "#73cef4" })
	hi(0, "NotifyERRORBody", { link = "Normal" })
	hi(0, "NotifyERRORBorder", { fg = "#f43753" })
	hi(0, "NotifyERRORIcon", { fg = "#f43753" })
	hi(0, "NotifyERRORTitle", { fg = "#f43753" })
	hi(0, "NotifyINFOBody", { link = "Normal" })
	hi(0, "NotifyINFOBorder", { fg = "#C9D0D3" })
	hi(0, "NotifyINFOIcon", { fg = "#C9D0D3" })
	hi(0, "NotifyINFOTitle", { fg = "#C9D0D3" })
	hi(0, "NotifyTRACEBody", { link = "Normal" })
	hi(0, "NotifyTRACEBorder", { fg = "#73cef4" })
	hi(0, "NotifyTRACEIcon", { fg = "#73cef4" })
	hi(0, "NotifyTRACETitle", { fg = "#73cef4" })
	hi(0, "NotifyWARNBody", { link = "Normal" })
	hi(0, "NotifyWARNBorder", { fg = "#d3b987" })
	hi(0, "NotifyWARNIcon", { fg = "#d3b987" })
	hi(0, "NotifyWARNTitle", { fg = "#d3b987" })
	hi(0, "Number", { fg = "#dc9656" })
	hi(
		0,
		"NvimInternalError",
		{ bg = "#f43753", ctermbg = 9, ctermfg = 9, fg = "#2B2B2B" }
	)
	hi(0, "Operator", { fg = "#C9D0D3" })
	hi(0, "OutlineDetail", { fg = "#73797e" })
	hi(0, "OutlineFoldPrefix", { fg = "#bf4537" })
	hi(0, "OutlineIndentEvn", { fg = "#c955ae" })
	hi(0, "OutlineIndentOdd", { fg = "#b8733e" })
	hi(0, "PreProc", { ctermfg = 81, fg = "#ffc24b" })
	hi(0, "Question", { bold = true, ctermfg = 121, fg = "#b3deef" })
	hi(0, "QuickFixLine", { bg = "#383838" })
	hi(0, "References", { bold = true, fg = "#cba6f7" })
	hi(0, "ReferencesIcon", { fg = "#e3e346" })
	hi(0, "Repeat", { fg = "#ffc24b" })
	hi(0, "SagaShadow", { fg = "#000000" })
	hi(0, "ScrollbarCursor", { ctermfg = 0, fg = "#C9D0D3" })
	hi(
		0,
		"ScrollbarCursorHandle",
		{ bg = "#383838", ctermbg = 15, ctermfg = 0, fg = "#C9D0D3" }
	)
	hi(0, "ScrollbarError", { ctermfg = 0, fg = "#f43753" })
	hi(
		0,
		"ScrollbarErrorHandle",
		{ bg = "#383838", ctermbg = 15, ctermfg = 0, fg = "#f43753" }
	)
	hi(0, "ScrollbarGitAdd", { ctermfg = 0, fg = "#008000" })
	hi(
		0,
		"ScrollbarGitAddHandle",
		{ bg = "#383838", ctermbg = 15, ctermfg = 0, fg = "#008000" }
	)
	hi(0, "ScrollbarGitChange", { ctermfg = 0, fg = "#ffff00" })
	hi(
		0,
		"ScrollbarGitChangeHandle",
		{ bg = "#383838", ctermbg = 15, ctermfg = 0, fg = "#ffff00" }
	)
	hi(0, "ScrollbarGitDelete", { ctermfg = 0, fg = "#ff0000" })
	hi(
		0,
		"ScrollbarGitDeleteHandle",
		{ bg = "#383838", ctermbg = 15, ctermfg = 0, fg = "#ff0000" }
	)
	hi(0, "ScrollbarHandle", { bg = "#383838", ctermbg = 15 })
	hi(0, "ScrollbarHint", { ctermfg = 0, fg = "#73cef4" })
	hi(
		0,
		"ScrollbarHintHandle",
		{ bg = "#383838", ctermbg = 15, ctermfg = 0, fg = "#73cef4" }
	)
	hi(0, "ScrollbarInfo", { ctermfg = 0, fg = "#C9D0D3" })
	hi(
		0,
		"ScrollbarInfoHandle",
		{ bg = "#383838", ctermbg = 15, ctermfg = 0, fg = "#C9D0D3" }
	)
	hi(0, "ScrollbarMisc", { ctermfg = 0, fg = "#C9D0D3" })
	hi(
		0,
		"ScrollbarMiscHandle",
		{ bg = "#383838", ctermbg = 15, ctermfg = 0, fg = "#C9D0D3" }
	)
	hi(0, "ScrollbarSearch", { ctermfg = 0, fg = "#383838" })
	hi(
		0,
		"ScrollbarSearchHandle",
		{ bg = "#383838", ctermbg = 15, ctermfg = 0, fg = "#383838" }
	)
	hi(0, "ScrollbarWarn", { ctermfg = 0, fg = "#d3b987" })
	hi(
		0,
		"ScrollbarWarnHandle",
		{ bg = "#383838", ctermbg = 15, ctermfg = 0, fg = "#d3b987" }
	)
	hi(0, "Search", { bg = "#ffc24b", ctermbg = 11, ctermfg = 0, fg = "#383838" })
	hi(0, "SignColumn", { ctermbg = 242, ctermfg = 14, fg = "#b8b8b8" })
	hi(0, "SniprunFloatingWinErr", { ctermfg = 1, fg = "#881515" })
	hi(0, "SniprunFloatingWinOk", { ctermfg = 14, fg = "#66eeff" })
	hi(0, "SniprunVirtualTextErr", { bg = "#881515", ctermbg = 1, fg = "#000000" })
	hi(0, "SniprunVirtualTextOk", { bg = "#66eeff", ctermbg = 14, fg = "#000000" })
	hi(0, "Special", { ctermfg = 224, fg = "#73cef4" })
	hi(0, "SpecialChar", { fg = "#a16946" })
	hi(0, "SpecialKey", { ctermfg = 81, fg = "#4c4c4c" })
	hi(0, "SpellBad", { ctermbg = 9, sp = "#f43753", undercurl = true })
	hi(0, "SpellCap", { ctermbg = 12, sp = "#b3deef", undercurl = true })
	hi(0, "SpellLocal", { ctermbg = 14, sp = "#73cef4", undercurl = true })
	hi(0, "SpellRare", { ctermbg = 13, sp = "#d3b987", undercurl = true })
	hi(0, "Statement", { bold = true, ctermfg = 11, fg = "#f43753" })
	hi(0, "StatusLine", { bg = "#484848", fg = "#C9D0D3" })
	hi(0, "StatusLineNC", { bg = "#383838", fg = "#b8b8b8" })
	hi(0, "StorageClass", { fg = "#ffc24b" })
	hi(0, "String", { fg = "#c9d05c" })
	hi(0, "Structure", { fg = "#d3b987" })
	hi(0, "Substitute", { bg = "#ffc24b", fg = "#383838" })
	hi(0, "SymbolsOutlineConnector", { fg = "#4c4c4c" })
	hi(0, "TSAnnotation", { fg = "#a16946" })
	hi(0, "TSAttribute", { fg = "#ffc24b" })
	hi(0, "TSBoolean", { fg = "#9976a8" })
	hi(0, "TSCharacter", { fg = "#c9d05c" })
	hi(0, "TSComment", { fg = "#808080", italic = true })
	hi(0, "GitSignsCurrentLineBlame", { fg = "#808080", italic = true })
	hi(0, "TSConditional", { fg = "#C07C42" })
	hi(0, "TSConstBuiltin", { fg = "#9976a8", italic = true })
	hi(0, "TSMethodCall", { fg = "#AD9E7D" })
	hi(0, "TSFunctionCall", { fg = "#AD9E7D" })
	hi(0, "TSConstMacro", { fg = "#4dace4" })
	hi(0, "TSConstant", { fg = "#9976a8" })
	hi(0, "TSConstructor", { fg = "#b3deef" })
	hi(0, "TSCurrentScope", { bold = true })
	hi(0, "TSDefinition", { sp = "#b8b8b8", underline = true })
	hi(0, "TSDefinitionUsage", { sp = "#b8b8b8", underline = true })
	hi(0, "TSEmphasis", { fg = "#dc9656", italic = true })
	hi(0, "TSError", { fg = "#f43753" })
	hi(0, "TSException", { fg = "#f43753" })
	hi(0, "TSField", { fg = "#9976a8" })
	hi(0, "TSFloat", { fg = "#dc9656" })
	hi(0, "TSFuncBuiltin", { fg = "#CC7832", italic = true })
	hi(0, "TSFuncMacro", { fg = "#4dace4" })
	hi(0, "TSFunction", { fg = "#FFC66D" })
	hi(0, "TSInclude", { fg = "#C07C41" })
	hi(0, "TSKeyword", { fg = "#CC7832" })
	hi(0, "TSKeywordFunction", { fg = "#CB7932" })
	hi(0, "TSKeywordOperator", { fg = "#d3b987" })
	hi(0, "TSLabel", { fg = "#9377A7" })
	hi(0, "TSLiteral", { fg = "#dc9656" })
	hi(0, "TSMethod", { fg = "#F6C87B" })
	hi(0, "TSNamespace", { fg = "#AFBF7E" })
	hi(0, "TSNone", { fg = "#C9D0D3" })
	hi(0, "TSNumber", { fg = "#6897BB" })
	hi(0, "TSConstantBuiltin", { fg = "#C07C41" })
	hi(0, "TSOperator", { fg = "#C9D0D3" })
	hi(0, "TSParameter", { fg = "#71aebd" })
	hi(0, "TSParameterReference", { fg = "#4dace4" })
	hi(0, "TSProperty", { fg = "#F6C87B" })
	hi(0, "TSPunctBracket", { fg = "#C9D0D3" })
	hi(0, "TSPunctDelimiter", { fg = "#a16946" })
	hi(0, "TSPunctSpecial", { fg = "#C9D0D3" })
	hi(0, "TSRepeat", { fg = "#d3b987" })
	hi(0, "TSStrike", { fg = "#2B2B2B", strikethrough = true })
	hi(0, "TSString", { fg = "#6A8759" })
	hi(0, "TSStringEscape", { fg = "#73cef4" })
	hi(0, "TSStringRegex", { fg = "#73cef4" })
	hi(0, "TSStrong", { bold = true })
	hi(0, "TSSymbol", { fg = "#c9d05c" })
	hi(0, "TSTag", { fg = "#ffc24b" })
	hi(0, "TSTagDelimiter", { fg = "#a16946" })
	hi(0, "TSText", { fg = "#C9D0D3" })
	hi(0, "TSTitle", { fg = "#b3deef" })
	hi(0, "TSType", { fg = "#b09d7a" })

	hi(0, "TSTypeDefinition", { fg = "#b3deef" })
	hi(0, "TSTypeBuiltin", { fg = "#dc9656", italic = true })
	hi(0, "TSURI", { fg = "#dc9656", underline = true })
	hi(0, "TSUnderline", { fg = "#2B2B2B", underline = true })
	hi(0, "TSVariable", { fg = "#C9D0D3" })
	hi(0, "TSVariableBuiltin", { fg = "#CC7832", italic = true })
	hi(0, "TabLine", { bg = "#383838", ctermbg = 242, ctermfg = 15, fg = "#4c4c4c" })
	hi(0, "TabLineFill", { bg = "#383838", fg = "#4c4c4c" })
	hi(0, "TabLineSel", { bg = "#383838", fg = "#c9d05c" })
	hi(0, "Tag", { fg = "#ffc24b" })
	hi(0, "TargetFileName", { fg = "#d1d4cf" })
	-- hi(0, "TelescopeBorder", { bg = "#242424", fg = "#242424" })
	-- hi(0, "TelescopeNormal", { bg = "#242424" })
	-- hi(0, "TelescopePreviewLine", { bg = "#383838" })
	-- hi(0, "TelescopePreviewTitle", { bg = "#c9d05c", fg = "#323232" })
	-- hi(0, "TelescopePromptBorder", { bg = "#404040", fg = "#404040" })
	-- hi(0, "TelescopePromptNormal", { bg = "#404040", fg = "#C9D0D3" })
	-- hi(0, "TelescopePromptPrefix", { bg = "#404040", fg = "#f43753" })
	-- hi(0, "TelescopePromptTitle", { bg = "#f43753", fg = "#323232" })
	-- hi(0, "TelescopeResultsTitle", { bg = "#242424", fg = "#242424" })
	-- hi(0, "TelescopeSelection", { bg = "#404040" })
	hi(0, "TermCursor", { bg = "#eeeeee", fg = "#2B2B2B" })
	hi(0, "TermCursorNC", { bg = "#eeeeee", fg = "#2B2B2B" })
	hi(0, "Title", { ctermfg = 225, fg = "#b3deef" })
	hi(0, "Todo", { bg = "#383838", ctermbg = 11, ctermfg = 0, fg = "#ffc24b" })
	hi(0, "TooLong", { fg = "#f43753" })
	hi(0, "TreesitterContext", { bg = "#383838", italic = true })
	hi(0, "Type", { ctermfg = 121, fg = "#b3deef" })
	hi(0, "Typedef", { fg = "#b3deef" })
	hi(0, "Underlined", { ctermfg = 81, fg = "#f43753", underline = true })
	hi(0, "User1", { bg = "#484848", fg = "#f43753" })
	hi(0, "User2", { bg = "#484848", fg = "#d3b987" })
	hi(0, "User3", { bg = "#484848", fg = "#C9D0D3" })
	hi(0, "User4", { bg = "#484848", fg = "#73cef4" })
	hi(0, "User5", { bg = "#484848", fg = "#C9D0D3" })
	hi(0, "User6", { bg = "#383838", fg = "#C9D0D3" })
	hi(0, "User7", { bg = "#484848", fg = "#C9D0D3" })
	hi(0, "User8", { bg = "#484848", fg = "#2B2B2B" })
	hi(0, "User9", { bg = "#484848", fg = "#2B2B2B" })
	hi(0, "VertSplit", { fg = "#C9D0D3" })
	hi(0, "Visual", { bg = "#484848", ctermbg = 242 })
	hi(0, "VisualNOS", { fg = "#f43753" })
	hi(0, "WarningMsg", { ctermfg = 224, fg = "#f43753" })
	hi(0, "WildMenu", { bg = "#ffc24b", ctermbg = 11, ctermfg = 0, fg = "#f43753" })
	hi(0, "WinBar", { fg = "#C9D0D3" })
	hi(0, "WinBarNC", { fg = "#b8b8b8" })
	hi(0, "gitcommitBranch", { bold = true, fg = "#dc9656" })
	hi(0, "gitcommitComment", { fg = "#4c4c4c" })
	hi(0, "gitcommitDiscarded", { fg = "#4c4c4c" })
	hi(0, "gitcommitDiscardedFile", { bold = true, fg = "#f43753" })
	hi(0, "gitcommitDiscardedType", { fg = "#b3deef" })
	hi(0, "gitcommitHeader", { fg = "#d3b987" })
	hi(0, "gitcommitOverflow", { fg = "#f43753" })
	hi(0, "gitcommitSelected", { fg = "#4c4c4c" })
	hi(0, "gitcommitSelectedFile", { bold = true, fg = "#c9d05c" })
	hi(0, "gitcommitSelectedType", { fg = "#b3deef" })
	hi(0, "gitcommitSummary", { fg = "#c9d05c" })
	hi(0, "gitcommitUnmergedFile", { bold = true, fg = "#f43753" })
	hi(0, "gitcommitUnmergedType", { fg = "#b3deef" })
	hi(0, "gitcommitUntracked", { fg = "#4c4c4c" })
	hi(0, "gitcommitUntrackedFile", { fg = "#ffc24b" })
	hi(0, "iCursor", { bg = "#4682b4", fg = "#ffffff" })
	hi(0, "lCursor", { bg = "#eeeeee", fg = "#2B2B2B" })
	hi(0, "lualine_a_command", { bg = "#98be65", bold = true, fg = "#000000" })
	hi(0, "lualine_a_inactive", { bg = "#abb2bf", bold = true, fg = "#000000" })
	hi(0, "lualine_a_insert", { bg = "#98be65", bold = true, fg = "#000000" })
	hi(0, "lualine_a_normal", { bg = "#98be65", bold = true, fg = "#000000" })
	hi(0, "lualine_a_replace", { bg = "#98be65", bold = true, fg = "#000000" })
	hi(0, "lualine_a_visual", { bg = "#98be65", bold = true, fg = "#000000" })
	hi(0, "lualine_b_command", { bg = "#98be65", fg = "#000000" })
	hi(0, "lualine_b_diagnostics_error_command", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diagnostics_error_inactive", { bg = "#abb2bf", fg = "#f43753" })
	hi(0, "lualine_b_diagnostics_error_insert", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diagnostics_error_normal", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diagnostics_error_replace", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diagnostics_error_terminal", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diagnostics_error_visual", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diagnostics_hint_command", { bg = "#98be65", fg = "#73cef4" })
	hi(0, "lualine_b_diagnostics_hint_inactive", { bg = "#abb2bf", fg = "#73cef4" })
	hi(0, "lualine_b_diagnostics_hint_insert", { bg = "#98be65", fg = "#73cef4" })
	hi(0, "lualine_b_diagnostics_hint_normal", { bg = "#98be65", fg = "#73cef4" })
	hi(0, "lualine_b_diagnostics_hint_replace", { bg = "#98be65", fg = "#73cef4" })
	hi(0, "lualine_b_diagnostics_hint_terminal", { bg = "#98be65", fg = "#73cef4" })
	hi(0, "lualine_b_diagnostics_hint_visual", { bg = "#98be65", fg = "#73cef4" })
	hi(0, "lualine_b_diagnostics_info_command", { bg = "#98be65", fg = "#C9D0D3" })
	hi(0, "lualine_b_diagnostics_info_inactive", { bg = "#abb2bf", fg = "#C9D0D3" })
	hi(0, "lualine_b_diagnostics_info_insert", { bg = "#98be65", fg = "#C9D0D3" })
	hi(0, "lualine_b_diagnostics_info_normal", { bg = "#98be65", fg = "#C9D0D3" })
	hi(0, "lualine_b_diagnostics_info_replace", { bg = "#98be65", fg = "#C9D0D3" })
	hi(0, "lualine_b_diagnostics_info_terminal", { bg = "#98be65", fg = "#C9D0D3" })
	hi(0, "lualine_b_diagnostics_info_visual", { bg = "#98be65", fg = "#C9D0D3" })
	hi(0, "lualine_b_diagnostics_warn_command", { bg = "#98be65", fg = "#d3b987" })
	hi(0, "lualine_b_diagnostics_warn_inactive", { bg = "#abb2bf", fg = "#d3b987" })
	hi(0, "lualine_b_diagnostics_warn_insert", { bg = "#98be65", fg = "#d3b987" })
	hi(0, "lualine_b_diagnostics_warn_normal", { bg = "#98be65", fg = "#d3b987" })
	hi(0, "lualine_b_diagnostics_warn_replace", { bg = "#98be65", fg = "#d3b987" })
	hi(0, "lualine_b_diagnostics_warn_terminal", { bg = "#98be65", fg = "#d3b987" })
	hi(0, "lualine_b_diagnostics_warn_visual", { bg = "#98be65", fg = "#d3b987" })
	hi(0, "lualine_b_diff_added_command", { bg = "#98be65", fg = "#c9d05c" })
	hi(0, "lualine_b_diff_added_inactive", { bg = "#abb2bf", fg = "#c9d05c" })
	hi(0, "lualine_b_diff_added_insert", { bg = "#98be65", fg = "#c9d05c" })
	hi(0, "lualine_b_diff_added_normal", { bg = "#98be65", fg = "#c9d05c" })
	hi(0, "lualine_b_diff_added_replace", { bg = "#98be65", fg = "#c9d05c" })
	hi(0, "lualine_b_diff_added_terminal", { bg = "#98be65", fg = "#c9d05c" })
	hi(0, "lualine_b_diff_added_visual", { bg = "#98be65", fg = "#c9d05c" })
	hi(0, "lualine_b_diff_modified_command", { bg = "#98be65", fg = "#b3deef" })
	hi(0, "lualine_b_diff_modified_inactive", { bg = "#abb2bf", fg = "#b3deef" })
	hi(0, "lualine_b_diff_modified_insert", { bg = "#98be65", fg = "#b3deef" })
	hi(0, "lualine_b_diff_modified_normal", { bg = "#98be65", fg = "#b3deef" })
	hi(0, "lualine_b_diff_modified_replace", { bg = "#98be65", fg = "#b3deef" })
	hi(0, "lualine_b_diff_modified_terminal", { bg = "#98be65", fg = "#b3deef" })
	hi(0, "lualine_b_diff_modified_visual", { bg = "#98be65", fg = "#b3deef" })
	hi(0, "lualine_b_diff_removed_command", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diff_removed_inactive", { bg = "#abb2bf", fg = "#f43753" })
	hi(0, "lualine_b_diff_removed_insert", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diff_removed_normal", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diff_removed_replace", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diff_removed_terminal", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_diff_removed_visual", { bg = "#98be65", fg = "#f43753" })
	hi(0, "lualine_b_inactive", { bg = "#abb2bf", fg = "#000000" })
	hi(0, "lualine_b_insert", { bg = "#98be65", fg = "#000000" })
	hi(0, "lualine_b_normal", { bg = "#98be65", fg = "#000000" })
	hi(0, "lualine_b_replace", { bg = "#98be65", fg = "#000000" })
	hi(0, "lualine_b_visual", { bg = "#98be65", fg = "#000000" })
	hi(0, "lualine_c_command", { bg = "#98be65", fg = "#000000" })
	hi(0, "lualine_c_inactive", { bg = "#abb2bf", fg = "#000000" })
	hi(0, "lualine_c_insert", { bg = "#98be65", fg = "#000000" })
	hi(0, "lualine_c_normal", { bg = "#98be65", fg = "#000000" })
	hi(0, "lualine_c_replace", { bg = "#98be65", fg = "#000000" })
	hi(0, "lualine_c_visual", { bg = "#98be65", fg = "#000000" })
	hi(0, "lualine_x_2_command", { bg = "#98be65", fg = "#ff9e64" })
	hi(0, "lualine_x_2_inactive", { bg = "#abb2bf", fg = "#ff9e64" })
	hi(0, "lualine_x_2_insert", { bg = "#98be65", fg = "#ff9e64" })
	hi(0, "lualine_x_2_normal", { bg = "#98be65", fg = "#ff9e64" })
	hi(0, "lualine_x_2_replace", { bg = "#98be65", fg = "#ff9e64" })
	hi(0, "lualine_x_2_terminal", { bg = "#98be65", fg = "#ff9e64" })
	hi(0, "lualine_x_2_visual", { bg = "#98be65", fg = "#ff9e64" })
	hi(0, "lualine_x_filetype_DevIconDefault_command", { bg = "#98be65", fg = "#6d8086" })
	hi(
		0,
		"lualine_x_filetype_DevIconDefault_inactive",
		{ bg = "#abb2bf", fg = "#6d8086" }
	)
	hi(0, "lualine_x_filetype_DevIconDefault_insert", { bg = "#98be65", fg = "#6d8086" })
	hi(0, "lualine_x_filetype_DevIconDefault_normal", { bg = "#98be65", fg = "#6d8086" })
	hi(0, "lualine_x_filetype_DevIconDefault_replace", { bg = "#98be65", fg = "#6d8086" })
	hi(
		0,
		"lualine_x_filetype_DevIconDefault_terminal",
		{ bg = "#98be65", fg = "#6d8086" }
	)
	hi(0, "lualine_x_filetype_DevIconDefault_visual", { bg = "#98be65", fg = "#6d8086" })
	hi(0, "rainbowcol1", { fg = "#e8e8e8" })
	hi(0, "rainbowcol2", { fg = "#dc9656" })
	hi(0, "rainbowcol3", { fg = "#ffc24b" })
	hi(0, "rainbowcol4", { fg = "#feffff" })
	hi(0, "rainbowcol5", { fg = "#73cef4" })
	hi(0, "rainbowcol6", { fg = "#b3deef" })
	hi(0, "rainbowcol7", { fg = "#d3b987" })

	hi(0, "@lsp.type.keyword.go", { link = "TSKeyword" })
	hi(0, "@lsp.type.string.go", { link = "TSString" })
	hi(0, "Statement", { link = "TSKeyword" })
	hi(0, "Comment", { link = "TSComment" })
	hi(0, "Number", { link = "TSNumber" })
	hi(0, "String", { link = "TSString" })
	hi(0, "goImportString", { link = "TSString" })
	hi(0, "@lsp.type.function", { link = "TSMethodCall" })
	hi(0, "@lsp.typemod.function.definition", { link = "TSFunction" })
	hi(0, "@lsp.type.method", { link = "TSMethod" })
	hi(0, "goBlock", { link = "TSVariable" })
	hi(0, "Identifier", { link = "TSKeyword" })
	-- Terminal colors
	local g = vim.g

	g.terminal_color_0 = "#2B2B2B"
	g.terminal_color_1 = "#f43753"
	g.terminal_color_2 = "#c9d05c"
	g.terminal_color_3 = "#ffc24b"
	g.terminal_color_4 = "#b3deef"
	g.terminal_color_5 = "#d3b987"
	g.terminal_color_6 = "#73cef4"
	g.terminal_color_7 = "#eeeeee"
	g.terminal_color_8 = "#4c4c4c"
	g.terminal_color_9 = "#f43753"
	g.terminal_color_10 = "#c9d05c"
	g.terminal_color_11 = "#ffc24b"
	g.terminal_color_12 = "#b3deef"
	g.terminal_color_13 = "#d3b987"
	g.terminal_color_14 = "#73cef4"
	g.terminal_color_15 = "#feffff"
end

return M
