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
    "moyiz/blink-emoji.nvim",
    "rafamadriz/friendly-snippets",
    "Kaiser-Yang/blink-cmp-dictionary",
    "giuxtaposition/blink-cmp-copilot",
    { "L3MON4D3/LuaSnip", version = "v2.*" },
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

    snippets = { preset = "luasnip" },

    sources = {
      default = {
        "lsp",
        "path",
        "emoji",
        "buffer",
        "copilot",
        "lazydev",
        "snippets",
        "dictionary",
      },
      cmdline = {}, -- disable cmdline completion

      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        },
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
        -- dictionary
        dictionary = {
          module = "blink-cmp-dictionary",
          name = "Dict",
          score_offset = 20,
          enabled = true,
          max_items = 8,
          min_keyword_length = 3,
          opts = {
            get_command = {
              "rg", -- make sure this command is available in your system
              "--color=never",
              "--no-line-number",
              "--no-messages",
              "--no-filename",
              "--ignore-case",
              "--",
              "${prefix}", -- this will be replaced by the result of 'get_prefix' function
              vim.fn.expand("~/.config/nvim/dict/words"), -- where you dictionary is
            },
            documentation = {
              enable = true, -- enable documentation to show the definition of the word
              get_command = {
                "wn", -- make sure this command is available in your system
                "${word}", -- this will be replaced by the word to search
                "-over",
              },
            },
          },
        },
        -- LSP
        lsp = { name = "LSP", module = "blink.cmp.sources.lsp" },
        -- LazyDev
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
      },
    },

    completion = {
      menu = {
        draw = {
          gap = 1,
          padding = 1,
          align_to = "cursor",
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
  opts_extend = { "sources.default" },
}
