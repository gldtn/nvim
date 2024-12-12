return {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "Trouble" },
    dependencies = { "echasnovski/mini.icons", version = false },
    opts = {
        opts = { use_diagnostic_signs = true },
    },
    keys = {
        { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnotics Toggle" },
        { "<leader>tD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
        { "<leader>tq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
        { "<leader>tl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
        { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
        { "gR", "<cmd>Trouble lsp toggle focus=false win.postion=right<cr>", desc = "LSP definitions / references / ..." },
    },
}
