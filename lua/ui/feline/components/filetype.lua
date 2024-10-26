local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")
local sep = require("ui.feline.separators")

local component = {}

-- File type component
component.file_type = {
	provider = {
		name = "file_type",
		opts = {
			filetype_icon = true,
		},
	},
	hl = {
		fg = "component_fg",
		bg = "component_bg",
	},
	left_sep = sep.left_separator,
	right_sep = sep.right_separator,
}

return component
