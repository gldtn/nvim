local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}

-- Lazy updates component
local function has_lazy()
	local lazy_installed, _ = pcall(require, "lazy")
	return lazy_installed
end

local function get_lazy_status()
	if has_lazy() then
		local updates = require("lazy.status").updates()
		if updates then -- Check if `updates` is not nil or false
			return " " .. updates
		end
	end
	return ""
end

component.lazy = {
	provider = get_lazy_status,
	hl = function()
		if has_lazy() and require("lazy.status").has_updates() then
			return {
				fg = "lazy_fg",
				bg = "lazy_bg",
			}
		else
			return {
				fg = "lazy_fg",
				bg = "lazy_bg",
			}
		end
	end,
}

return component
