local M = {}
local highlights = require("themes.kanagawa.highlights")

M.setup = function()
  require("kanagawa").setup({
    theme = "dragon", -- wave, lotus, dragon, all
    background = {
      light = "lotus",
      dark = "dragon",
    },
    transparent = false,
    terminalColors = true,
    dimInactive = false,
    overrides = function(colors)
      return highlights.custom_hl(colors.palette)
    end,
    colors = {
      themes = {
        all = {
          ui = { bg_gutter = "black3" },
        },
      },
    },
  })
end

return M
