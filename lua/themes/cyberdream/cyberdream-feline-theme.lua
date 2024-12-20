local p = require("cyberdream.colors").default

local bg = "NONE"

local theme = {
  -- accent colors
  red = p.red,
  blue = p.blue,
  cyan = p.cyan,
  green = p.green,
  yellow = p.yellow,
  orange = p.orange,
  purple = p.purple,
  magenta = p.magenta,
  highlight = p.bgHighlight,
  -- base colors
  bg = bg,
  fg = p.fg,
  fg_alt = p.fg,
  bg_alt = p.bgAlt,
  spacer_bg = bg,
  component_fg = p.grey,
  component_bg = bg,
  -- mode
  mode_bg = bg,
  -- branch
  branch_bg = bg,
  branch_icon = p.cyan,
  branch_text = p.cyan,
  -- fileinfo
  fileinfo_bg = bg,
  fileinfo_text = p.fg,
  -- git changes
  git_add_fg = p.green,
  git_add_bg = bg,
  git_delete_fg = p.red,
  -- git_delete_bg = bg,
  git_change_fg = p.cyan,
  git_change_bg = bg,
  -- position
  position_bg = bg,
  position_icon = p.magenta,
  position_text = p.magenta,
  -- scrollbar
  scrollbar_bg = bg,
  scrollbar_icon = p.red,
  scrollbar_text = p.red,
  -- diagnostics
  info_fg = p.blue,
  info_bg = bg,
  errors_fg = p.red,
  errors_bg = bg,
  hints_fg = p.yellow,
  hints_bg = bg,
  warnings_fg = p.orange,
  warnings_bg = bg,
  -- lsp
  lsp_fg = p.bgHighlight,
  lsp_bg = bg,
  -- lazy
  lazy_fg = p.green,
  lazy_bg = bg,
  -- inactive
  inactive_fg = p.orange,
  inactive_bg = p.bgAlt,
}

-- mode-specific colors
local mode_theme = {
  ["NORMAL"] = "orange",
  ["INSERT"] = "green",
  ["REPLACE"] = "red",
  ["VISUAL"] = "purple",
  ["V-LINE"] = "purple",
  ["V-BLOCK"] = "purple",
  ["COMMAND"] = "red",
  ["SELECT"] = "orange",
  ["S-LINE"] = "orange",
  ["S-BLOCK"] = "orange",
  ["TERMINAL"] = "yellow",
}

return {
  theme = theme,
  mode_theme = mode_theme,
}
