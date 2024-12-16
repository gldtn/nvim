local M = {}
local highlights = require("themes.cyberdream.cyberdream-highlights")

M.setup = function()
    require("cyberdream").setup({
        cache = false,
        transparent = true,
        italic_comments = true,
        borderless_telescope = { border = false, style = "flat" },
        theme = {
            variant = "auto",
            overrides = function(c)
                return highlights.setup(c)
            end,
        },
    })
    vim.keymap.set("n", "<C-t><C-t>", ":CyberdreamToggleMode<CR>", { noremap = true, silent = true })
    vim.api.nvim_create_autocmd("User", {
        pattern = "CyberdreamToggleMode",
        callback = function(ev)
            print("Switched to " .. ev.data .. " mode!")
        end,
    })
end

return M
