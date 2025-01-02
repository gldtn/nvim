return {
  "folke/trouble.nvim",
  lazy = true,
  cmd = { "Trouble" },
  dependencies = { "echasnovski/mini.icons", version = false },
  opts = {
    opts = { use_diagnostic_signs = true },
  },
  keys = {
    { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "[D]iagnotics toggle" },
    { "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "[B]uffer diagnostics" },
    { "<leader>tq", "<cmd>Trouble qflist toggle<cr>", desc = "[Q]uickfix list" },
    { "<leader>tl", "<cmd>Trouble loclist toggle<cr>", desc = "[L]ocation list" },
    { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "[S]ymbols" },
    { "gR", "<cmd>Trouble lsp toggle focus=false win.postion=right<cr>", desc = "LSP definitions / references / ..." },
  },
}
