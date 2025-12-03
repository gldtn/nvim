return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
    "nvim-tree/nvim-web-devicons",
  },

  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,

  config = function()
    -- Determine current theme for lualine
    local theme = "auto"
    local current = vim.g.colors_name or _G.active_theme or ""

    if current:find("catppuccin") then
      local ok, catpp_theme = pcall(require, "themes.catppuccin.lualine-theme")
      if ok and catpp_theme.theme then
        theme = catpp_theme.theme
      end
    elseif current:find("tokyonight") then
      local ok, tokyo_theme = pcall(require, "themes.tokyonight.lualine-theme")
      if ok and tokyo_theme.theme then
        theme = tokyo_theme.theme
      end
    end

    -- Icons
    local icons = {
      branch = "",
      position = "",
      scrollbar = "",
      lsp = " ",
    }

    -- Mode mapping
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

    local mode_icons = {
      n = "",
      i = "",
      ic = "",
      R = "",
      v = "",
      V = "",
      c = "",
      s = "󰫙",
      S = "󰫙",
      t = "",
      nt = "",
      ["\22"] = "󰫙",
      ["\19"] = "󰫙",
    }

    local function vi_mode_provider()
      local mode = vim.fn.mode()
      local mode_name = mode_map[mode] or "NORMAL"
      return string.format("%s %s", mode_icons[mode] or " ", mode_name)
    end

    local function lsp_servers()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) == nil then
        return ""
      end
      local names = {}
      for _, client in pairs(clients) do
        if client.name ~= "copilot" then
          table.insert(names, client.name)
        end
      end
      local lsp_list = #names > 0 and table.concat(names, ", ") or ""
      return "󰒋 " .. lsp_list
    end

    -- Lualine setup
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard", "lazy", "NvimTree", "Outline", "TelescopePrompt" },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { { vi_mode_provider } },
        lualine_b = {
          { "branch", icon = icons.branch, fmt = string.upper },
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          { "diagnostics", sources = { "nvim_diagnostic" }, symbols = { error = " ", warn = " ", hint = " " } },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = { modified = " ", readonly = " " },
            fmt = function(str)
              return str ~= "" and " " .. str or " (empty)"
            end,
          },
        },
        lualine_x = {
          { lsp_servers },
          {
            "copilot",
            symbols = {
              status = {
                icons = { enabled = " ", sleep = " ", disabled = " ", warning = " ", unknown = " " },
              },
              spinners = "dots",
              -- spinner_color = "#6272A4",
            },
            show_colors = false,
            show_loading = true,
          },
          { "searchcount" },
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
      extensions = { "quickfix", "man", "nvim-tree", "neo-tree" },
    })
  end,
}
