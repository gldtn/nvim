-- themes/tokyonight/tokyonight.lua

local M = {}
local highlights = require("themes.tokyonight.highlights")

M.setup = function()
  require("tokyonight").setup({
    style = "night",
    light_style = "moon",
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { italic = true },
      sidebars = "dark",
      floats = "dark",
    },
    on_colors = function(colors) end,
    on_highlights = highlights.on_highlights,
    plugins = { auto = true },
  })

  -- Apply colorscheme once
  -- vim.cmd("colorscheme tokyonight")
end

return M
