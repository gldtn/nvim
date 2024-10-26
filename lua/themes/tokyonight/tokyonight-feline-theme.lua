local p = require("tokyonight.colors").setup()

local theme = {
	-- accent colors
	red = p.red,
	blue = p.blue,
	cyan = p.cyan,
	green = p.green,
	yellow = p.yellow,
	orange = p.orange,
	purple = p.purple,
	magenta = p.magenta,
	highlight = p.bg_highlight,
	-- base colors
	fg = p.fg,
	bg = p.bg,
	fg_alt = p.fg_dark,
	bg_alt = p.bg_dark,
	component_fg = p.fg_dark,
	component_bg = p.bg,
	-- mode
	mode_bg = p.bg,
	-- branch
	branch_bg = p.bg,
	branch_icon = p.cyan,
	branch_text = p.cyan,
	-- fileinfo
	fileinfo_bg = p.bg,
	fileinfo_text = p.fg_dark,
	-- position
	position_bg = p.bg,
	position_icon = p.purple,
	position_text = p.purple,
	-- scrollbar
	scrollbar_bg = p.bg,
	scrollbar_icon = p.magenta,
	scrollbar_text = p.magenta,
	-- git changes
	git_add_fg = p.green,
	git_add_bg = p.bg,
	git_delete_fg = p.red,
	git_delete_bg = p.bg,
	git_change_fg = p.orange,
	git_change_bg = p.bg,
	-- diagnostics
	info_fg = p.blue,
	info_bg = p.bg,
	errors_fg = p.red,
	errors_bg = p.bg,
	hints_fg = p.green,
	hints_bg = p.bg,
	warnings_fg = p.orange,
	warnings_bg = p.bg,
	-- lsp
	lsp_fg = p.comment,
	lsp_bg = p.bg,
	-- lazy
	lazy_fg = p.green,
	lazy_bg = p.bg,
}

-- mode-specific colors
local mode_theme = {
	["NORMAL"] = "orange",
	["INSERT"] = "green",
	["REPLACE"] = "red",
	["VISUAL"] = "purple",
	["V-LINE"] = "purple",
	["V-BLOCK"] = "purple",
	["COMMAND"] = "red",
	["SELECT"] = "orange",
	["S-LINE"] = "orange",
	["S-BLOCK"] = "orange",
	["TERMINAL"] = "red",
}

return {
	theme = theme,
	mode_theme = mode_theme,
}
