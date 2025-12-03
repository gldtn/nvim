return {
  "folke/which-key.nvim",
  dependencies = { "echasnovski/mini.icons", version = false },
  event = "VeryLazy",
  opts = {
    title = true,
    sort = "alphanum",
    preset = "modern",
    title_pos = "center",
  },

  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500

    -- import which-key plugin
    local wk = require("which-key")

    -- define options
    local keyopts = {
      noremap = false,
      nowait = false,
    }

    local c = "orange"

    local mappings = {
      { "<leader>b", group = "buffer/browser", icon = { icon = "", color = c } },
      { "<leader>c", group = "code", icon = { icon = "󰅪", color = c } },
      { "<leader>f", group = "find/files", icon = { icon = "󰍉", color = c } },
      { "<leader>g", group = "goto", icon = { icon = "󰆤", color = c } },
      { "<leader>L", "<cmd>Lazy<cr>", desc = "lazy", icon = { icon = "󰒲", color = c } },
      { "<leader>M", "<cmd>Mason<cr>", desc = "mason", icon = { icon = "", color = c } },
      { "<leader>n", group = "notifications", icon = { icon = "󰎟", color = c } },
      { "<leader>r", group = "find/replace", icon = { icon = "󰛔", color = c } },
      { "<leader>s", group = "switch", icon = { icon = "", color = c } },
      { "<leader>T", group = "toggles", icon = { icon = "󰔡", color = c } },
      { "<leader>x", group = "trouble", icon = { icon = "󱏚", color = c } },
      { "<leader>q", group = "quit", icon = { icon = "󰈆", color = c } },
      { "<leader>S", group = "treesitter", icon = { icon = "", color = c } },
      { "<leader>Si", "<cmd>InspectTree<cr>", desc = "inspect tree", icon = { icon = "", color = c } },
      { "<leader>Su", "<cmd>TSUpdate<cr>", desc = "update parsers", icon = { icon = "󰚰", color = c } },
    }

    wk.add({ mappings, keyopts })
  end,
}
