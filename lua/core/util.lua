local M = {}

--- Wrapper around `vim.keymap.set` to include defaults
---@see vim.keymap.set()
---
---@param modes string|table the keymap mode
---@param lhs string left hand side
---@param rhs string|function right hand side
---@param opts nil|table options
---
function M.map(modes, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(modes, lhs, rhs, options)
end

--- Set filetype for any `*rc` file as shell script
function M.set_rc_filetype()
	vim.cmd([[autocmd BufRead,BufNewFile *rc set filetype=bash]])
end

M.set_rc_filetype()

return M
