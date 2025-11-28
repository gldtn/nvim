local M = {}

local p = require("tokyonight.colors").setup()

local t = { bg = "NONE" }

local function static_components()
  return {
    b = { fg = p.blue, bg = t.bg, gui = "bold" }, -- Git branch
    c = { fg = p.white, bg = t.bg, gui = "bold" }, -- Filename
    x = { fg = p.comment, bg = t.bg, gui = "bold" }, -- LSP provider
    y = { fg = p.magenta, bg = t.bg, gui = "bold" }, -- Cursor location
    z = { fg = p.red, bg = t.bg, gui = "bold" }, -- Scroll progress
  }
end

M.theme = {
  normal = vim.tbl_deep_extend("force", {
    a = { fg = p.orange, bg = t.bg, gui = "bold" }, -- VI modes
  }, static_components()),

  insert = vim.tbl_deep_extend("force", {
    a = { fg = p.green, bg = t.bg, gui = "bold" },
  }, static_components()),

  visual = vim.tbl_deep_extend("force", {
    a = { fg = p.blue, bg = t.bg, gui = "bold" },
  }, static_components()),

  replace = vim.tbl_deep_extend("force", {
    a = { fg = p.red, bg = t.bg, gui = "bold" },
  }, static_components()),

  command = vim.tbl_deep_extend("force", {
    a = { fg = p.red, bg = t.bg, gui = "bold" },
  }, static_components()),

  inactive = vim.tbl_deep_extend("force", {
    c = { fg = p.purple, bg = t.bg },
  }, static_components()),
}

return M
