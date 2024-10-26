local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}

-- Diagnostics components
component.diagnostic_errors = {
	provider = "diagnostic_errors",
	hl = {
		fg = "errors_fg",
		bg = "errors_bg",
	},
}

component.diagnostic_warnings = {
	provider = "diagnostic_warnings",
	hl = {
		fg = "warnings_fg",
		bg = "warnings_bg",
	},
}

component.diagnostic_hints = {
	provider = "diagnostic_hints",
	hl = {
		fg = "hints_fg",
		bg = "hints_bg",
	},
}

component.diagnostic_info = {
	provider = "diagnostic_info",
	hl = {
		fg = "info_fg",
		bg = "info_bg",
	},
}

return component
