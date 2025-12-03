local M = {}

-- Fancy border characters
local border = {
  { "", "DiagnosticHint" },
  { "─", "LSPFloatBorder" },
  { "╮", "LSPFloatBorder" },
  { "│", "LSPFloatBorder" },
  { "╯", "LSPFloatBorder" },
  { "─", "LSPFloatBorder" },
  { "╰", "LSPFloatBorder" },
  { "│", "LSPFloatBorder" },
}

M.apply = function()
  -- Prevent multiple applications
  if vim.g.__lsp_floating_border_applied then
    return
  end
  vim.g.__lsp_floating_border_applied = true

  -- Keep original
  local orig_float = vim.lsp.util.open_floating_preview

  --- Override floating preview to include border
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_float(contents, syntax, opts, ...)
  end

  -- Diagnostics float border
  vim.diagnostic.config({
    float = { border = border },
  })
end

return M
