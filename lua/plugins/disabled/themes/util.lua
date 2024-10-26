-- Set color variables
local color = require("tokyonight.colors").setup()
local darken = require("tokyonight.util").darken
local default_bg = darken(color.comment, 0.3)
local default = { fg = color.blue, bg = default_bg }

local hl = function(group, attributes)
  vim.api.nvim_set_hl(0, group, attributes)
end

-- Function to apply highlights with default attributes
local function apply_default_highlights(groups)
  for _, group in ipairs(groups) do
    hl(group, default)
  end
end

-- Customization for Pmenu
hl("CmpItemMenu", { fg = color.comment, bg = "NONE", italic = true })
hl("PmenuSel", { bg = color.bg_highlight, fg = "NONE" })
hl("CmpItemAbbrMatch", { fg = color.blue, bg = "NONE", bold = true })
hl("CmpItemAbbrMatchFuzzy", { fg = color.blue, bg = "NONE", bold = true })
hl("CmpItemAbbrDeprecated", { fg = darken(color.fg, 0.5), bg = "NONE", strikethrough = true })

-- Set defaults to "CmpItemKind*"
apply_default_highlights(vim.fn.getcompletion("CmpItemKind*", "highlight"))

-- Define kind_groups and their respective foreground colors
local kind_groups = {
  { "CmpItemKindText",          color.green },
  { "CmpItemKindSnippet",       color.yellow },
  { "CmpItemKindCopilot",       color.green1 },
  { "CmpItemKindKeyword",       color.purple },
  { "CmpItemKindOperator",      color.blue5 },
  { "CmpItemKindConstant",      color.orange },
  { "CmpItemKindFunction",      color.magenta },
  { "CmpItemKindTypeParameter", color.green },
}

-- Apply default background color and individual foreground colors to kind_groups
for _, group_color in ipairs(kind_groups) do
  local group, fg_color = group_color[1], group_color[2]
  hl(group, { fg = fg_color, bg = default_bg })
end
