local M = {}
local highlights = require("themes.catppuccin.highlights")

M.setup = function()
  require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = {
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false,
    term_colors = true,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      functions = { "italic" },
      booleans = { "italic" },
    },
    color_overrides = {},
    custom_highlights = function(c)
      return highlights.setup(c)
    end,
    default_integrations = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
  })
end

return M
