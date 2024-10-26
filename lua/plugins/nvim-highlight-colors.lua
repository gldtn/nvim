local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-colors")
return {
	"brenoprata10/nvim-highlight-colors",
	event = "BufReadPre",
	opts = {
		render = "virtual",
		virtual_symbol = "●",
		virtual_symbol_prefix = "",
		virtual_symbol_position = "eol",
		enable_named_colors = false,
		enable_tailwind = true,
		custom_colors = colors,
	},
}
