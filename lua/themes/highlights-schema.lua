local M = {}

M.get_highlights = function(accent, neutral, primary, title)
	return {
		-- float defaults
		FloatTitle = title.float,
		PreviewTitle = title.preview,
		LazyBackdrop = { bg = primary.color1 },
		MasonBackdrop = { bg = primary.color1 },
		FloatBorder = { fg = primary.color2, bg = primary.color2 },

		-- fzf-lua titles
		FzfLuaTitle = { link = "FloatTitle" },
		FzfLuaPreviewTitle = { link = "PreviewTitle" },

		-- fzf-lua headers
		FzfLuaHeaderBind = { fg = accent.ff3 },
		FzfLuaFzfHeader = { fg = neutral.color3 },
		FzfLuaHeaderText = { fg = neutral.color3 },

		-- fzf-lua prompt details
		FzfLuaFzfQuery = { fg = neutral.color1 },

		-- fzf-lua results
		FzfLuaMarker = { fg = accent.ff1 },
		FzfLuaFzfMatch = { fg = accent.ff1 },
		FzfLuaFzfPointer = { fg = primary.color2 },

		-- fzf-lua backgrounds
		FzfLuaBackdrop = { bg = primary.color1 },
		FzfLuaNormal = { fg = neutral.color1, bg = primary.color2 },
		FzfLuaFzfPrompt = { fg = accent.ff1, bg = primary.color2 },

		-- fzf-lua borders
		FzfLuaBorder = { fg = primary.color2, bg = primary.color2 },
		FzfLuaFzfBorder = { fg = neutral.color3, bg = primary.color2 },
		FzfLuaFzfSeparator = { fg = neutral.color3, bg = primary.color2 },
		FzfLuaPreviewBorder = { fg = primary.color1, bg = primary.color2 },

		-- telescope titles
		TelescopeTitle = { fg = accent.ff1 },
		TelescopePromptTitle = { link = "FloatTitle" },
		TelescopePreviewTitle = { link = "PreviewTitle" },

		-- telescope prompt details
		TelescopePromptPrefix = { fg = accent.ff1 },
		TelescopePromptCounter = { fg = accent.ff2 },

		-- telescope prompt behaviors
		TelescopeMatching = { fg = accent.ff2 },
		TelescopeSelection = { fg = neutral.color1, bg = primary.color3 },
		TelescopeMultiSelection = { fg = accent.ff1, bg = primary.color3 },

		-- telescope backgrounds
		TelescopeNormal = { fg = neutral.color1, bg = primary.color2 },
		TelescopePromptNormal = { fg = neutral.color1, bg = primary.color3 },

		-- telescope borders
		TelescopeBorder = { fg = primary.color2, bg = primary.color2 },
		TelescopePromptBorder = { fg = primary.color3, bg = primary.color3 },
		TelescopePreviewBorder = { fg = primary.color1, bg = primary.color2 },
	}
end

M.setup = function(hl, accent, neutral, primary, title)
	-- Set the highlights using hl
	local highlights = M.get_highlights(accent, neutral, primary, title)

	-- Apply the highlights to hl (the highlight table provided by tokyonight)
	for group, settings in pairs(highlights) do
		hl[group] = settings
	end
end

return M
