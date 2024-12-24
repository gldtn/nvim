---@diagnostic disable-next-line: deprecated
table.unpack = table.unpack or unpack -- 5.1 compatibility
local fancy_border = {
  menu = { "󱐋", "WarningMsg" },
  info = { "", "DiagnosticHint" },
  body = { "─", "╮", "│", "╯", "─", "╰", "│" },
}

return {
  "saghen/blink.cmp",
  lazy = false,
  enabled = true,
  version = "v0.*",
  -- build = "cargo build --release",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "giuxtaposition/blink-cmp-copilot",
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
      ["<esc>"] = { "hide", "fallback" },
      -- escape with arrow keys
      ["<Up>"] = { "hide", "fallback" },
      ["<Down>"] = { "hide", "fallback" },
      ["<Left>"] = { "hide", "fallback" },
      ["<Right>"] = { "hide", "fallback" },
    },

    sources = {
      default = {
        "lsp",
        "path",
        "buffer",
        "copilot",
        "lazydev",
        "snippets",
      },
      cmdline = {}, -- disable cmdline completion

      providers = {
        -- Copilot
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
          transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
            local kind_idx = #CompletionItemKind + 1
            CompletionItemKind[kind_idx] = "Copilot"
            for _, item in ipairs(items) do
              item.kind = kind_idx
            end
            return items
          end,
        },
        -- LazyDev
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
      },
    },

    completion = {
      menu = {
        draw = {
          gap = 1,
          padding = 1,
          align_to_component = "label",
          columns = {
            { "kind_icon", gap = 1 },
            { "label", "label_description", gap = 1 },
            { "kind" },
          },
        },
        border = { fancy_border.menu, table.unpack(fancy_border.body) },
      },
      documentation = {
        auto_show = true,
        window = { border = { fancy_border.info, table.unpack(fancy_border.body) } },
      },
    },

    signature = {
      enabled = true,
      window = { border = { fancy_border.info, table.unpack(fancy_border.body) } },
    },

    appearance = {
      nerd_font_variant = "mono",
      use_nvim_cmp_as_default = true,
      kind_icons = require("ui.icons").kinds,
    },
  },
}
