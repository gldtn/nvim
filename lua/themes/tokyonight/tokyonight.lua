-- tokyonight/tokyonight.lua
local M = {}
local highlights = require("themes.tokyonight.tokyonight-highlights")

M.setup = function()
  require("tokyonight").setup({
    style = "night", -- night, moon, storm, or day
    light_style = "moon",
    cache = true,
    transparent = false,
    day_brightness = 0.3,
    dim_inactive = false,
    lualine_bold = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { italic = true },
      sidebars = "dark", -- style for sidebars
      floats = "dark", -- style for floating windows
    },
    ---@diagnostic disable-next-line: unused-local
    on_colors = function(colors) end,
    on_highlights = highlights.on_highlights,
    plugins = { auto = true },
  })
end

return M
