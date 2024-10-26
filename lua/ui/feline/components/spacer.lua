local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}

component.spacer = {
	provider = "  ",
	hl = {
		fg = "bg",
		bg = "bg",
	},
}

return component
