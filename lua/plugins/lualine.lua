return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
    "nvim-tree/nvim-web-devicons",
  },

  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- Set an empty statusline until lualine loads
      vim.o.statusline = " "
    else
      -- Hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,

  config = function()
    -- Load Theme Configuration
    local theme_config = require("themes.catppuccin.catppuccin-lualine-theme")

    -- Fetch theme colors once
    local theme = theme_config.theme

    -- Icons
    local icons = {
      branch = "",
      position = "",
      scrollbar = "",
      lsp = " ",
    }

    -- Mode Mapping (Full Names)
    local mode_map = {
      n = "NORMAL",
      i = "INSERT",
      ic = "INSERT",
      R = "REPLACE",
      v = "VISUAL",
      V = "V-LINE",
      c = "COMMAND",
      s = "SELECT",
      S = "S-LINE",
      t = "TERMINAL",
      nt = "TERMINAL",
      ["\22"] = "V-BLOCK",
      ["\19"] = "S-BLOCK",
    }

    -- Mode Icons
    local mode_icons = {
      n = "", -- Normal
      i = "", -- Insert
      ic = "", -- Insert
      R = "", -- Replace
      v = "", -- Visual
      V = "", -- V-Line
      c = "", -- Command
      s = "󰫙", -- Select
      S = "󰫙", -- S-Line
      t = "", -- Terminal
      nt = "", -- Terminal
      ["\22"] = "󰫙", -- V-Block
      ["\19"] = "󰫙", -- S-Block
    }

    -- Function to Get Mode Display
    local function vi_mode_provider()
      local mode = vim.fn.mode()
      local mode_name = mode_map[mode] or "NORMAL"
      return string.format("%s %s", mode_icons[mode] or " ", mode_name)
    end

    -- LSP Icons Mapping
    local lsp_icons = {
      ["zls"] = " ",
      ["html"] = " ",
      ["gopls"] = " ",
      ["sourcekit"] = "󰛥 ",
      ["cssls"] = " ",
      ["taplo"] = " ",
      ["jsonls"] = " ",
      ["clangd"] = "󰙱 ",
      ["lua_ls"] = " ",
      ["bashls"] = " ",
      ["default"] = " ",
      ["pyright"] = " ",
      -- ["copilot"] = " ",
      ["phpactor"] = " ",
      ["tailwindcss"] = "󱏿 ",
      ["intelephense"] = " ",
      ["rust_analyzer"] = " ",
    }

    -- Function to Display LSP Clients
    local function lsp_provider()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then
        return ""
      end

      local lsp_display = ""
      for _, client in ipairs(clients) do
        local icon = lsp_icons[client.name] or lsp_icons["default"]
        lsp_display = lsp_display .. icon
      end
      return lsp_display
    end

    -- Setup Lualine
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "lazy", "NvimTree", "Outline", "TelescopePrompt" },
        always_divide_middle = true,
        globalstatus = true,
        -- fmt = string.upper,
      },
      sections = {
        -- left side components
        lualine_a = {
          { vi_mode_provider }, -- Display mode without colors
        },
        lualine_b = {
          -- stylua: ignore
          { "branch", icon = icons.branch, fmt = function(str) return str:upper() end },
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          { "diagnostics", sources = { "nvim_diagnostic" }, symbols = { error = " ", warn = " ", hint = " " } },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = { modified = " ", readonly = " " },
            fmt = function(str)
              if str == "" or str == nil then
                return " (empty)"
              end
              return " " .. str
            end,
          },
        },

        -- right side components
        lualine_x = {
          {
            "copilot",
            -- Default values
            symbols = {
              status = {
                icons = {
                  enabled = "",
                  sleep = "", -- auto-trigger disabled
                  disabled = "",
                  warning = "",
                  unknown = "",
                },
              },
              spinners = "dots", -- has some premade spinners
              spinner_color = "#6272A4",
            },
            show_colors = false,
            show_loading = true,
          },
          { lsp_provider }, -- Custom LSP section
          { "searchcount" },
          -- {
          --   "buffers",
          --   mode = 3,
          -- },
        },
        lualine_y = { { "location", icon = icons.position } },
        lualine_z = { { "progress", icon = icons.scrollbar } },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename" } },
        lualine_x = { { "location" } },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "quickfix", "man", "nvim-tree" },
    })
  end,
}
