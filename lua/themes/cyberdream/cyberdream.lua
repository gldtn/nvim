-- colorschemes/cyberdream/cyberdream.lua
local M = {}
local highlights = require("themes.cyberdream.cyberdream-highlights")

M.setup = function()
	-- Base setup for the cyberdream theme
	require("cyberdream").setup({
		transparent = false,
		italic_comments = true,
		borderless_telescope = { border = false, style = "flat" },
		theme = {
			variant = "auto",
			overrides = function(c)
				return highlights.setup(c)
			end,
		},
	})
end

return M
