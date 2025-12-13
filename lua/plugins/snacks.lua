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
    -- search
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
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
      prompt = "   ",
      formatters = {
        file = {
          filename_first = true,
        },
      },
      layouts = {
        default = {
          layout = {
            box = "horizontal",
            width = 0.8,
            min_width = 120,
            height = 0.8,
            {
              box = "vertical",
              border = true,
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = true, width = 0.75 },
          },
        },
      },
      sources = {
        files = {},
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
    -- Function to get the current NormalFloat background color
    -- Snacks defaults to black when `win` opens, always overriding colorscheme
    local function get_backdrop_color()
      local hl = vim.api.nvim_get_hl(0, { name = "SnacksBackdrop", link = false })
      local bg = hl.bg or vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
      if not bg then
        return "#000000"
      end -- Fallback to black if no bg found
      return string.format("#%06x", bg)
    end

    local function apply_backdrop()
      local bg = get_backdrop_color()

      Snacks.config.win = vim.tbl_deep_extend("force", Snacks.config.win or {}, {
        backdrop = {
          bg = bg,
          blend = 4,
          transparent = true, -- Set to true for blend to apply as overlay opacity
        },
      })
    end

    apply_backdrop()

    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = apply_backdrop,
    })

    Snacks.setup(opts)
  end,
}
