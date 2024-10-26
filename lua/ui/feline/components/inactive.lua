local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}

local function get_inactive()
	return " " .. string.upper(vim.bo.ft) .. " "
end

component.inactive = {
	provider = get_inactive,
	hl = {
		fg = "fg_alt",
		bg = "bg",
	},
}

return component
