local ts = require("cyberdream.treesitter")
local config = require("cyberdream.config")
local M = {}

--- Sets the highlight group to the given table of colors.
--- @param group string
--- @param hl vim.api.keyset.highlight
function M.highlight(group, hl)
	group = ts.get(group)
	if not group then
		return
	end
	if hl.style then
		if type(hl.style) == "table" then
			hl = vim.tbl_extend("force", hl, hl.style)
		elseif hl.style:lower() ~= "none" then
			-- handle old string style definitions
			for s in string.gmatch(hl.style, "([^,]+)") do
				hl[s] = true
			end
		end
		hl.style = nil
		config = config
	end
end

return M
