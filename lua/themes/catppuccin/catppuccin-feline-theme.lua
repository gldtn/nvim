local p = require("catppuccin.palettes").get_palette("mocha")

local bg = "NONE"

local theme = {
  -- accent colors
  sky = p.sky,
  red = p.red,
  lue = p.blue,
  pink = p.pink,
  peach = p.peach,
  green = p.green,
  mauve = p.mauve,
  flamingo = p.flamingo,
  lavender = p.lavender,
  rosewater = p.rosewater,
  -- base colors
  fg = p.text,
  bg = bg,
  fg_alt = p.text,
  bg_alt = p.surface0,
  component_fg = p.rosewater,
  component_bg = p.bg,
  -- mode
  mode_bg = bg,
  -- branch
  branch_bg = bg,
  branch_icon = p.sky,
  branch_text = p.sky,
  -- fileinfo
  fileinfo_bg = bg,
  fileinfo_text = p.rosewater,
  -- git changes
  git_add_fg = p.green,
  git_add_bg = bg,
  git_delete_fg = p.red,
  git_delete_bg = bg,
  git_change_fg = p.peach,
  git_change_bg = bg,
  -- position
  position_bg = bg,
  position_icon = p.mauve,
  position_text = p.mauve,
  -- scrollbar
  scrollbar_bg = bg,
  scrollbar_icon = p.pink,
  scrollbar_text = p.pink,
  -- diagnostics
  info_fg = p.blue,
  info_bg = bg,
  errors_fg = p.red,
  errors_bg = bg,
  hints_fg = p.flamingo,
  hints_bg = bg,
  warnings_fg = p.peach,
  warnings_bg = bg,
  -- lsp
  lsp_fg = p.lavender,
  lsp_bg = bg,
  -- lazy
  lazy_fg = p.green,
  lazy_bg = bg,
  -- inactive
  inactive_fg = p.flamingo,
  inactive_bg = p.crust,
}

-- mode-specific colors
local mode_theme = {
  ["NORMAL"] = "peach",
  ["INSERT"] = "green",
  ["REPLACE"] = "red",
  ["VISUAL"] = "mauve",
  ["V-LINE"] = "mauve",
  ["V-BLOCK"] = "mauve",
  ["COMMAND"] = "red",
  ["SELECT"] = "peach",
  ["S-LINE"] = "peach",
  ["S-BLOCK"] = "peach",
  ["TERMINAL"] = "lavender",
}

return {
  theme = theme,
  mode_theme = mode_theme,
}
