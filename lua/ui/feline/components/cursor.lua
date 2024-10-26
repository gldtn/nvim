local icons = require("ui.feline.icons")
local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}
local left_separator = ""
local right_separator = ""

-- Cursor position component
local function cursor_position()
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	return string.format(" %d:%d", line, col)
end

component.cursor_position = {
	provider = cursor_position,
	icon = {
		str = icons.comp_icons.position,
		hl = {
			fg = "position_icon",
			bg = "position_bg",
		},
	},
	hl = {
		fg = "position_text",
		bg = "component_bg",
	},
	left_sep = {
		str = left_separator,
		hl = {
			fg = "position_bg",
		},
	},
	right_sep = right_separator,
}

return component
