return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  -- stylua: ignore
  keys = {
    -- Top Pickers & Explorer
    { "\\", function() Snacks.explorer() end, desc = "File Explorer" },
    -- git
    { "<leader>og", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<C-g>", function() Snacks.lazygit() end, desc = "Lazygit" },
    -- others
    { "<c-s-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    { "<C-S-x>", "<cmd>bdelete<cr>", desc = "Delete Buffer" },
    { "<C-x>", function() Snacks.bufdelete() end, desc = "Delete Buffer (Smart)" },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    { "<C-n>", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
  },
  opts = {
    image = { enabled = true },
    input = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    bigfile = { enabled = true },
    animate = { enabled = true },
    terminal = { enabled = true },
    explorer = { enabled = true },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          auto_close = true,
          layout = {
            preset = "sidebar",
            layout = {
              position = "right",
            },
          },
        },
      },
    },
    lazygit = {
      configure = true,
      win = {
        position = "float",
        height = 0.9,
        width = 0.9,
      },
      theme = {
        activeBorderColor = { fg = "MatchParen", bold = false },
        inactiveBorderColor = { fg = "Comment" },
      },
    },
    notifier = {
      enabled = true,
      level = vim.log.levels.INFO, -- Hide low-level spam
      timeout = 4000,
      style = "compact",
      top_down = false,
    },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
    indent = {
      enabled = true,
      style = "up_down",
      duration = {
        step = 50, -- ms per step
        total = 600, -- maximum duration
      },
    },
  },
  config = function(_, opts)
    local Snacks = require("snacks")

    local function get_backdrop_color()
      local hl = vim.api.nvim_get_hl(0, { name = "NormalFloat", link = false })
      local bg = hl.bg or vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
      if not bg then
        return "#000000"
      end -- Fallback to black if no bg found
      return string.format("#%06x", bg)
    end

    local function apply_lazygit_backdrop()
      local bg = get_backdrop_color()

      Snacks.config.lazygit = vim.tbl_deep_extend("force", Snacks.config.lazygit or {}, {
        win = {
          backdrop = {
            bg = bg,
            blend = 3,
            transparent = true, -- Set to true for blend to apply as overlay opacity
          },
        },
      })
    end

    apply_lazygit_backdrop()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = apply_lazygit_backdrop,
    })

    Snacks.setup(opts)
  end,
}
