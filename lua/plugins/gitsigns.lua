return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "[GS] Toggle current line blame" },
    { "<leader>gw", ":Gitsigns toggle_word_diff<cr>", desc = "Toggle word diff" },
    { "[g", ":Gitsigns next_hunk<cr>", desc = "Next hunk" },
    { "]g", ":Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
  },
  opts = {
    signcolumn = true,
    current_line_blame_formatter = "<author>:<author_time:%Y-%m-%d> - <summary>",
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "right_align",
      delay = 1,
      ignore_whitespace = false,
    },
  },
}
