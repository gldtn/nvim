local schema = require("themes.highlights-schema")

local M = {}

M.setup = function()
	-- Define colors for rose-pine theme using plain strings
	local accent = {
		fzf1 = "gold",
		fzf2 = "foam",
		fzf3 = "rose",
	}
	local neutral = {
		color1 = "text",
		color2 = "subtle",
		color3 = "muted",
	}
	local primary = {
		color1 = "base",
		color2 = "surface",
		color3 = "overlay",
	}
	local title = {
		float = { fg = primary.color1, bg = "gold" },
		preview = { fg = primary.color1, bg = "foam" },
	}

	-- Get the schema highlights
	local schema_highlights = schema.get_highlights(accent, neutral, primary, title)

	-- Additional highlights specific to rose-pine
	local extra_highlights = {
		-- dashboard
		dashKey1 = { fg = "iris" },
		dashKey2 = { fg = "foam" },
		dashKey3 = { fg = "pine" },
		dashKey4 = { fg = "rose" },
		dashKey5 = { fg = "gold" },
		dashKey6 = { fg = "love" },
		dashIcons = { fg = "gold" },
		DashboardHeader = { fg = "subtle" },

		-- [[ notify ]] --
		NotifyINFOBody = { bg = "base" },
		NotifyWARNBody = { bg = "base" },
		NotifyERRORBody = { bg = "base" },
		NotifyDEBUGBody = { bg = "base" },
		NotifyTRACEBody = { bg = "base" },
		NotifyINFOBorder = { bg = "base" },
		NotifyWARNBorder = { bg = "base" },
		NotifyERRORBorder = { bg = "base" },
		NotifyDEBUGBorder = { bg = "base" },
		NotifyTRACEBorder = { bg = "base" },

		-- [[ Neo-tree ]] --
		NeoTreeNormal = { bg = "surface" },
		NeoTreeDirectoryIcon = { fg = "love" },
		NeotreeFloatTitle = { link = "ButtonGold" },
		NeoTreeFloatBorder = { fg = "surface", bg = "surface" },

		-- [[ Treesitter highlights ]] --
		["@boolean"] = { fg = "love", italic = true },
		["@string"] = { fg = "foam", italic = false },
		["@variable"] = { fg = "gold", italic = false },
		["@operator"] = { fg = "foam", italic = false },
		["@property"] = { fg = "text", italic = false },
		["@string.regexp"] = { fg = "text", italic = false },
		["@variable.member"] = { fg = "rose", italic = true },
	}

	-- Merge schema highlights and extra highlights
	for k, v in pairs(extra_highlights) do
		schema_highlights[k] = v
	end

	-- Return the combined highlight groups as a plain table (no function)
	return schema_highlights
end

return M
