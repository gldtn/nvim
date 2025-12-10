local M = {}
local highlights = require("themes.cyberdream.highlights").custom_hl

M.setup = function()
  require("cyberdream").setup({
    variant = "default",
    cache = false,
    -- transparent = true,
    italic_comments = true,
    hide_fillchars = true,
    borderless_pickers = true,
    highlights = highlights,
  })
end

return M
