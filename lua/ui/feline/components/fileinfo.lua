local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")
local sep = require("ui.feline.separators")

local component = {}

-- File info component
component.file_info = {
	provider = {
		name = "file_info",
		opts = { type = "relative" },
	},
	hl = { fg = "fileinfo_text", bg = "fileinfo_bg" },
	left_sep = sep.left_separator,
	right_sep = sep.right_separator,
}

return component
