local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")
local icons = require("ui.feline.icons")
local sep = require("ui.feline.separators")

local component = {}

-- Scroll bar component
local function get_scroll_position()
  local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
  return " " .. tostring(math.floor(line_ratio * 100)) .. "%%"
end

local function get_scrollbar_icon()
  return icons.comp_icons.scrollbar
end

component.scroll_bar_icon = {
  provider = get_scrollbar_icon,
  hl = function()
    return {
      fg = "scrollbar_icon",
      bg = "scrollbar_bg",
    }
  end,
  left_sep = {
    str = sep.left_separator,
    hl = function()
      return {
        fg = "scrollbar_bg",
      }
    end,
  },
}

component.scroll_bar_position = {
  provider = get_scroll_position,
  hl = function()
    return {
      style = "bold",
      fg = "scrollbar_text",
      bg = "component_bg",
    }
  end,
  right_sep = {
    str = sep.left_separator,
    hl = {
      fg = "bg",
      bg = "fg",
    },
  },
}

return component
