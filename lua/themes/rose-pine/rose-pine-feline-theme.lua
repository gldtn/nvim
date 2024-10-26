local p = require("rose-pine.palette")

local theme = {
	-- accent colors
	love = p.love,
	gold = p.gold,
	rose = p.rose,
	pine = p.pine,
	foam = p.foam,
	iris = p.iris,
	muted = p.muted,
	subtle = p.subtle,
	-- base colors
	fg = p.base,
	bg = p.base,
	fg_alt = p.subtle,
	bg_alt = p.surface,
	component_fg = p.muted,
	component_bg = p.base,
	-- mode
	mode_bg = p.bg,
	-- branch
	branch_bg = p.bg,
	branch_icon = p.foam,
	branch_text = p.foam,
	-- fileinfo
	fileinfo_bg = p.bg,
	fileinfo_text = p.subtle,
	-- position
	position_bg = p.bg,
	position_icon = p.rose,
	position_text = p.rose,
	-- scrollbar
	scrollbar_bg = p.bg,
	scrollbar_icon = p.love,
	scrollbar_text = p.love,
	-- git changes
	git_add_fg = p.foam,
	git_add_bg = p.bg,
	git_delete_fg = p.love,
	git_delete_bg = p.bg,
	git_change_fg = p.rose,
	git_change_bg = p.bg,
	-- diagnostics
	info_fg = p.foam,
	info_bg = p.bg,
	errors_fg = p.love,
	errors_bg = p.bg,
	hints_fg = p.rose,
	hints_bg = p.bg,
	warnings_fg = p.gold,
	warnings_bg = p.bg,
	-- lsp
	lsp_fg = p.muted,
	lsp_bg = p.bg,
	-- lazy
	lazy_fg = p.foam,
	lazy_bg = p.bg,
	-- inactive
	inactive_fg = p.love,
	inactive_bg = p.overlay,
}

-- [ modes ]
local mode_theme = {
	["NORMAL"] = "gold",
	["INSERT"] = "love",
	["REPLACE"] = "love",
	["VISUAL"] = "iris",
	["V-LINE"] = "iris",
	["V-BLOCK"] = "iris",
	["COMMAND"] = "love",
	["SELECT"] = "gold",
	["S-LINE"] = "gold",
	["S-BLOCK"] = "gold",
	["TERMINAL"] = "subtle",
}

return {
	theme = theme,
	mode_theme = mode_theme,
}
