return {
  "folke/trouble.nvim",
  lazy = true,
  opts = {
    opts = { use_diagnostic_signs = true },
  },
  cmd = { "Trouble" },
  dependencies = { "echasnovski/mini.icons", version = false },
  keys = {
    { "<leader>xd", "<cmd>Trouble diagnostics toggle<cr>", desc = "[D]iagnotics toggle" },
    { "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "[B]uffer diagnostics" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "[Q]uickfix list" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "[L]ocation list" },
    { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "[S]ymbols" },
    { "gR", "<cmd>Trouble lsp toggle focus=false win.postion=right<cr>", desc = "LSP definitions / references / ..." },
  },
}
