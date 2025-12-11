return {
  { -- find and replace
    "windwp/nvim-spectre",
    enabled = true,
    event = "BufRead",
    keys = {
      {
        "<leader>rr",
        function()
          require("spectre").open()
        end,
        desc = "Replace",
      },
      {
        "<leader>rw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Replace Word",
      },
      {
        "<leader>rf",
        function()
          require("spectre").open_file_search()
        end,
        desc = "Replace Buffer",
      },
    },
  },
  { -- autopair characters support
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    enabled = true,
  },
  { -- enhance nvim's native comments
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
}
