local M = {}
local highlights = require("themes.cyberdream.cyberdream-highlights")

M.setup = function()
  require("cyberdream").setup({
    cache = false,
    transparent = true,
    italic_comments = true,
    borderless_pickers = false,
    highlights = {
      function(c)
        return highlights.setup(c)
      end,
    },
  })
  vim.api.nvim_set_keymap("n", "<leader>ct", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true })
  vim.api.nvim_create_autocmd("User", {
    pattern = "CyberdreamToggleMode",
    callback = function(ev)
      print("Switched to " .. ev.data .. " mode!")
    end,
  })
end

return M
