local component = {}

local function get_inactive()
	return " " .. string.upper(vim.bo.ft) .. " "
end

component.inactive = {
	provider = get_inactive,
	hl = {
		fg = "inactive_fg",
		bg = "inactive_bg",
	},
}

return component
