return {
  "gbprod/yanky.nvim",
  opts = {},
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
    { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
    { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
    -- stylua: ignore
    { "<leader>Y", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "yank history", },
  },
}
