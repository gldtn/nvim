-- tokyonight/tokyonight.lua
local M = {}
local highlights = require("themes.tokyonight.tokyonight-highlights")

M.setup = function()
	require("tokyonight").setup({
		style = "night", -- night, moon, storm, or day
		cache = true,
		transparent = false,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { italic = true },
			sidebars = "dark", -- style for sidebars
			floats = "dark", -- style for floating windows
		},
		---@diagnostic disable-next-line: unused-local
		on_colors = function(colors) end,
		on_highlights = highlights.on_highlights,
	})
end

return M
