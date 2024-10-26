local p = require("cyberdream.colors").default

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
	highlight = p.bgHighlight,
	-- base colors
	bg = p.bg,
	fg = p.fg,
	fg_alt = p.fg,
	bg_alt = p.bgAlt,
	component_fg = p.grey,
	component_bg = p.bg,
	-- mode
	mode_bg = p.bg,
	-- branch
	branch_bg = p.bg,
	branch_icon = p.cyan,
	branch_text = p.cyan,
	-- fileinfo
	fileinfo_bg = p.bg,
	fileinfo_text = p.fg,
	-- git changes
	git_add_fg = p.green,
	git_add_bg = p.bg,
	git_delete_fg = p.red,
	git_delete_bg = p.bg,
	git_change_fg = p.cyan,
	git_change_bg = p.bg,
	-- position
	position_bg = p.bg,
	position_icon = p.magenta,
	position_text = p.magenta,
	-- scrollbar
	scrollbar_bg = p.bg,
	scrollbar_icon = p.red,
	scrollbar_text = p.red,
	-- diagnostics
	info_fg = p.blue,
	info_bg = p.bg,
	errors_fg = p.red,
	errors_bg = p.bg,
	hints_fg = p.yellow,
	hints_bg = p.bg,
	warnings_fg = p.orange,
	warnings_bg = p.bg,
	-- lsp
	lsp_fg = p.bgHighlight,
	lsp_bg = p.bg,
	-- lazy
	lazy_fg = p.green,
	lazy_bg = p.bg,
	-- inactive
	inactive_fg = p.orange,
	inactive_bg = p.bgAlt,
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
	["TERMINAL"] = "yellow",
}

return {
	theme = theme,
	mode_theme = mode_theme,
}
