return {
    "echasnovski/mini.animate",
    enabled = false,
    recommended = true,
    event = "VeryLazy",
    opts = function()
        -- don't use animate when scrolling with the mouse
        local mouse_scrolled = false
        for _, scroll in ipairs({ "Up", "Down" }) do
            local key = "<ScrollWheel" .. scroll .. ">"
            vim.keymap.set({ "", "i" }, key, function()
                mouse_scrolled = true
                return key
            end, { expr = true })
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "grug-far",
            callback = function()
                vim.b.minianimate_disable = true
            end,
        })

        Snacks.toggle({
            name = "Mini Animate",
            get = function()
                return not vim.g.minianimate_disable
            end,
            set = function(state)
                vim.g.minianimate_disable = not state
            end,
        }):map("<leader>ua")

        local animate = require("mini.animate")
        return {
            resize = {
                timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
            },
            scroll = {
                timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
                subscroll = animate.gen_subscroll.equal({
                    predicate = function(total_scroll)
                        if mouse_scrolled then
                            mouse_scrolled = false
                            return false
                        end
                        return total_scroll > 1
                    end,
                }),
            },
        }
    end,
}