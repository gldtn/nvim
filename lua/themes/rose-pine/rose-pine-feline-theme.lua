local p = require("rose-pine.palette")

local bg = "NONE"

local theme = {
  -- accent colors
  love = p.love,
  gold = p.gold,
  rose = p.rose,
  pine = p.pine,
  foam = p.foam,
  iris = p.iris,
  muted = p.muted,
  subtle = p.subtle,
  -- base colors
  fg = p.base,
  bg = bg,
  fg_alt = p.subtle,
  bg_alt = p.surface,
  component_fg = p.muted,
  component_bg = bg,
  -- mode
  mode_bg = bg,
  -- branch
  branch_bg = bg,
  branch_icon = p.foam,
  branch_text = p.foam,
  -- fileinfo
  fileinfo_bg = bg,
  fileinfo_text = p.subtle,
  -- position
  position_bg = bg,
  position_icon = p.rose,
  position_text = p.rose,
  -- scrollbar
  scrollbar_bg = bg,
  scrollbar_icon = p.love,
  scrollbar_text = p.love,
  -- git changes
  git_add_fg = p.foam,
  git_add_bg = bg,
  git_delete_fg = p.love,
  git_delete_bg = bg,
  git_change_fg = p.rose,
  git_change_bg = bg,
  -- diagnostics
  info_fg = p.foam,
  info_bg = bg,
  errors_fg = p.love,
  errors_bg = bg,
  hints_fg = p.rose,
  hints_bg = bg,
  warnings_fg = p.gold,
  warnings_bg = bg,
  -- lsp
  lsp_fg = p.muted,
  lsp_bg = bg,
  -- lazy
  lazy_fg = p.foam,
  lazy_bg = bg,
  -- inactive
  inactive_fg = p.love,
  inactive_bg = p.surface,
}

-- [ modes ]
local mode_theme = {
  ["NORMAL"] = "gold",
  ["INSERT"] = "love",
  ["REPLACE"] = "love",
  ["VISUAL"] = "iris",
  ["V-LINE"] = "iris",
  ["V-BLOCK"] = "iris",
  ["COMMAND"] = "love",
  ["SELECT"] = "gold",
  ["S-LINE"] = "gold",
  ["S-BLOCK"] = "gold",
  ["TERMINAL"] = "subtle",
}

return {
  theme = theme,
  mode_theme = mode_theme,
}
