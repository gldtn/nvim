local M = {}

local p = require("catppuccin.palettes").get_palette("mocha")

local t = { bg = "NONE" }

local function static_components()
  return {
    b = { fg = p.sky, bg = t.bg, gui = "bold" }, -- Git branch
    c = { fg = p.rosewater, bg = t.bg, gui = "bold" }, -- Filename
    x = { fg = p.lavender, bg = t.bg, gui = "bold" }, -- LSP provider
    y = { fg = p.mauve, bg = t.bg, gui = "bold" }, -- Cursor location
    z = { fg = p.pink, bg = t.bg, gui = "bold" }, -- Scroll progress
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

-- Custom Component Colors
-- branch = { fg = p.sky, bg = p.bg },
-- diff_add = { fg = p.green, bg = p.bg },
-- diff_change = { fg = p.peach, bg = p.bg },
-- diff_remove = { fg = p.red, bg = p.bg },
-- diagnostics_error = { fg = p.red, bg = p.bg },
-- diagnostics_warn = { fg = p.peach, bg = p.bg },
-- diagnostics_info = { fg = p.blue, bg = p.bg },
-- diagnostics_hint = { fg = p.flamingo, bg = p.bg },
-- lsp = { fg = p.lavender, bg = p.bg },
-- fileinfo = { fg = p.rosewater, bg = p.bg },
-- position = { fg = p.mauve, bg = p.bg },
-- scrollbar = { fg = p.pink, bg = p.bg },

-- 🔹 **Ensure Mode-Specific Colors Always Have Valid Values**
-- M.mode_theme = {
--   ["NORMAL"] = p.blue,
--   ["INSERT"] = p.green,
--   ["REPLACE"] = p.red,
--   ["VISUAL"] = p.mauve,
--   ["V-LINE"] = p.mauve,
--   ["V-BLOCK"] = p.mauve,
--   ["COMMAND"] = p.peach,
--   ["SELECT"] = p.peach,
--   ["S-LINE"] = p.peach,
--   ["S-BLOCK"] = p.peach,
--   ["TERMINAL"] = p.lavender,
-- }

return M
