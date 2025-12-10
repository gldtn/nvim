return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 300,
    icons = {
      rules = false,
      breadcrumb = " ",
      separator = "󱦰  ",
      group = "󰹍 ",
    },
    plugins = {
      spelling = {
        enabled = false,
      },
    },

    win = {
      title = true,
      title_pos = "center",
      border = "rounded",
    },

    spec = {
      -- groups for n + v modes
      mode = { "n", "v" },
      -- Every entry must be { prefix, opts }
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Goto" },
      { "<leader>n", group = "Notifications" },
      { "<leader>o", group = "Open" },
      { "<leader>r", group = "Replace" },
      { "<leader>s", group = "switch" },
      { "<leader>t", group = "Toggle" },
      { "<leader>x", group = "Trouble" },
      { "<leader>q", group = "Quit" },
      -- cmds
      { "<leader>ol", "<cmd>Lazy<cr>", desc = "Lazy", icon = "󰒲" },
      { "<leader>om", "<cmd>Mason<cr>", desc = "Mason", icon = "" },
      { "<leader>on", "<cmd>Neogit<cr>", desc = "Neogit", icon = "" },
    },
  },

  -- stylua: ignore
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps",
    },
  },
  -- { "<leader>S", group = "treesitter", icon = { icon = "" } },
  -- { "<leader>Si", "<cmd>InspectTree<cr>", desc = "inspect tree", icon = { icon = "" } },
  -- { "<leader>Su", "<cmd>TSUpdate<cr>", desc = "update parsers", icon = { icon = "󰚰" } },
}
