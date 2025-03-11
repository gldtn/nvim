local get_colors = require("feline.providers.vi_mode")
local icons = require("ui.feline.icons")
local sep = require("ui.feline.separators")

local mode_map = {
  n = "NORMAL",
  i = "INSERT",
  ic = "INSERT",
  R = "REPLACE",
  v = "VISUAL",
  V = "V-LINE",
  c = "COMMAND",
  s = "SELECT",
  S = "S-LINE",
  t = "TERMINAL",
  nt = "TERMINAL",
  ["\22"] = "V-BLOCK",
  ["\19"] = "S-BLOCK",
}

setmetatable(mode_map, {
  __index = function()
    return "-"
  end,
})

local function vi_mode_provider()
  local mode = vim.fn.mode()
  local mode_name = mode_map[mode]
  return string.format("%s", mode_name)
end

local function vi_mode_icon_provider()
  local mode = vim.fn.mode()
  local mode_icon = icons.mode_icons[mode] or " "
  return string.format("%s", mode_icon)
end

local component = {}

-- vi mode names
component.vi_mode = {
  provider = vi_mode_provider,
  hl = function()
    return {
      fg = get_colors.get_mode_color(),
      bg = "mode_bg",
      style = "bold",
    }
  end,
  left_sep = sep.left_separator,
  right_sep = sep.right_separator,
}

-- vi mode icons
component.vi_mode_icon = {
  provider = vi_mode_icon_provider,
  hl = function()
    return {
      fg = get_colors.get_mode_color(),
      bg = "mode_bg",
      style = "bold",
    }
  end,
  left_sep = {
    str = sep.left_separator,
    hl = {
      fg = "bg",
      bg = "fg",
    },
  },
}

return component
