local M = {}

--- Wrapper around `vim.keymap.set` to include defaults
---@see vim.keymap.set
---
---@param modes string|string[] The keymap mode(s)
---@param lhs   string Left-hand side
---@param rhs   string|function Right-hand side
---@param opts? table Additional options (merged with defaults)
function M.map(modes, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(modes, lhs, rhs, options)
end

return M
