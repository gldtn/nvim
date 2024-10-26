return {
    "dharmx/track.nvim",
    lazy = true,
    -- enabled = false,
    cmd = { "Track", "Mark", "Unmark", "RMBranch", "SwapBranch" },
    opts = function()
        -- options
        require("track").setup({
            pickers = {
                branches = { initial_mode = "normal" },
                views = { initial_mode = "normal" },
            },
        })

        -- mappings
        local map = require("core.util").map
        map("n", "<c-space>", "<cmd>Track views<cr>", { desc = "List marked files" })
        map("n", "<leader>tb", "<cmd>Track branches<cr>", { desc = "Track branches" })
        map("n", "<leader>tm", "<cmd>Mark<cr>", { desc = "Mark file" })
        map("n", "<leader>tu", "<cmd>Unmark<cr>", { desc = "Unmark file" })
    end,
}
