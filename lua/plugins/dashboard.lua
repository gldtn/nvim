return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  enabled = true,
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      shortcut_type = "number",
      hide = {
        statusline = true,
      },
      config = {
        week_header = { enable = true },
        shortcut = {
          {
            icon = "󰒲  ",
            icon_hl = "dashIcons",
            desc = "Update ",
            group = "dashKey1",
            action = "Lazy update",
            key = "u",
          },
          {
            icon = "   ",
            icon_hl = "dashIcons",
            desc = "Files ",
            group = "dashKey2",
            action = "FzfLua files",
            key = "f",
          },
          {
            icon = "   ",
            icon_hl = "dashIcons",
            desc = "Recent ",
            group = "dashKey3",
            action = "FzfLua oldfiles",
            key = "r",
          },
          {
            icon = "   ",
            icon_hl = "dashIcons",
            desc = "Grep ",
            group = "dashKey4",
            action = "FzfLua live_grep",
            key = "g",
          },
          {
            icon = "   ",
            icon_hl = "dashIcons",
            desc = "Notify ",
            group = "dashKey5",
            action = "Noice fzf",
            key = "n",
          },
          {
            icon = "   ",
            icon_hl = "dashIcons",
            desc = "Quit ",
            group = "dashKey6",
            action = "qall!",
            key = "q",
          },
        },
        project = { enable = false },
        mru = { enable = false, limit = 5 },
        footer = {},
      },
    })
  end,
}
