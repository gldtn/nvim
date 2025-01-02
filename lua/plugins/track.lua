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
    map("n", "<leader>Tb", "<cmd>Track branches<cr>", { desc = "Track [b]ranches" })
    map("n", "<leader>Tm", "<cmd>Mark<cr>", { desc = "[M]ark file" })
    map("n", "<leader>Tu", "<cmd>Unmark<cr>", { desc = "[U]nmark file" })
  end,
}
