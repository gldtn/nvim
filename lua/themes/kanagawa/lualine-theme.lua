local M = {}

local p = require("kanagawa.colors").setup({ theme = "dragon" }).palette

local t = { bg = p.dragonBlack3 }

local function static_components()
  return {
    b = { fg = p.dragonTeal, bg = t.bg, gui = "bold" }, -- Git branch
    c = { fg = p.dragonGray, bg = t.bg, gui = "bold" }, -- Filename
    x = { fg = p.dragonBlue, bg = t.bg }, -- LSP provider
    y = { fg = p.dragonViolet, bg = t.bg, gui = "bold" }, -- Cursor location
    z = { fg = p.dragonRed, bg = t.bg, gui = "bold" }, -- Scroll progress
  }
end

M.theme = {
  normal = vim.tbl_deep_extend("force", {
    a = { fg = p.dragonOrange, bg = t.bg, gui = "bold" }, -- VI modes
  }, static_components()),

  insert = vim.tbl_deep_extend("force", {
    a = { fg = p.dragonGreen, bg = t.bg, gui = "bold" },
  }, static_components()),

  visual = vim.tbl_deep_extend("force", {
    a = { fg = p.dragonViolet, bg = t.bg, gui = "bold" },
  }, static_components()),

  replace = vim.tbl_deep_extend("force", {
    a = { fg = p.dragonRed, bg = t.bg, gui = "bold" },
  }, static_components()),

  command = vim.tbl_deep_extend("force", {
    a = { fg = p.dragonRed, bg = t.bg, gui = "bold" },
  }, static_components()),

  inactive = vim.tbl_deep_extend("force", {
    c = { fg = p.dragonGray, bg = t.bg },
  }, static_components()),
}

return M
