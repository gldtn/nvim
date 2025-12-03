local M = {}

local p = require("catppuccin.palettes").get_palette("mocha")

local t = { bg = p.base }

local function static_components()
  return {
    b = { fg = p.sky, bg = t.bg, gui = "bold" }, -- Git branch
    c = { fg = p.rosewater, bg = t.bg, gui = "bold" }, -- Filename
    x = { fg = p.blue, bg = t.bg }, -- LSP provider
    y = { fg = p.mauve, bg = t.bg, gui = "bold" }, -- Cursor location
    z = { fg = p.red, bg = t.bg, gui = "bold" }, -- Scroll progress
  }
end

M.theme = {
  normal = vim.tbl_deep_extend("force", {
    a = { fg = p.peach, bg = t.bg, gui = "bold" }, -- VI modes
  }, static_components()),

  insert = vim.tbl_deep_extend("force", {
    a = { fg = p.green, bg = t.bg, gui = "bold" },
  }, static_components()),

  visual = vim.tbl_deep_extend("force", {
    a = { fg = p.mauve, bg = t.bg, gui = "bold" },
  }, static_components()),

  replace = vim.tbl_deep_extend("force", {
    a = { fg = p.red, bg = t.bg, gui = "bold" },
  }, static_components()),

  command = vim.tbl_deep_extend("force", {
    a = { fg = p.red, bg = t.bg, gui = "bold" },
  }, static_components()),

  inactive = vim.tbl_deep_extend("force", {
    c = { fg = p.flamingo, bg = t.bg },
  }, static_components()),
}

return M
