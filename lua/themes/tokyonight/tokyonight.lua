local M = {}
local highlights = require("themes.tokyonight.highlights").custom_hl

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
    on_highlights = highlights,
    plugins = { auto = true },
  })

  -- vim.cmd("colorscheme tokyonight")
end

return M
