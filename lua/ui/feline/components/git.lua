local icons = require("ui.feline.icons")
local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")
local sep = require("ui.feline.separators")

local component = {}

-- Git branch component
component.git_branch = {
	provider = "git_branch",
	icon = {
		str = icons.comp_icons.branch,
		hl = {
			fg = "branch_icon",
			bg = "branch_bg",
		},
	},
	hl = {
		fg = "branch_text",
		bg = "branch_bg",
		style = "bold",
	},
	left_sep = {
		str = "",
		hl = {
			fg = "branch_bg",
		},
	},
	right_sep = sep.right_separator,
}

-- Git signs components
component.git_add = {
	provider = "git_diff_added",
	hl = {
		fg = "git_add_fg",
		bg = "git_add_bg",
	},
	left_sep = sep.left_separator,
	right_sep = sep.right_separator,
}

component.git_delete = {
	provider = "git_diff_removed",
	hl = {
		fg = "git_delete_fg",
		bg = "git_delete_bg",
	},
	left_sep = sep.left_separator,
	right_sep = sep.right_separator,
}

component.git_change = {
	provider = "git_diff_changed",
	hl = {
		fg = "git_change_fg",
		bg = "git_change_bg",
	},
	left_sep = sep.left_separator,
	right_sep = sep.right_separator,
}

return component
