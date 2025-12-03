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
  version = "v1.*",
  dependencies = {
    "folke/lazydev.nvim",
    "moyiz/blink-emoji.nvim",
    "rafamadriz/friendly-snippets",
    "giuxtaposition/blink-cmp-copilot",
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    "MeanderingProgrammer/render-markdown.nvim",
    { "Kaiser-Yang/blink-cmp-dictionary", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  opts = {
    keymap = {
      preset = "default",
      ["<esc>"] = { "hide", "fallback" },
      -- escape with arrow keys
      ["<Up>"] = { "hide", "fallback" },
      ["<Down>"] = { "hide", "fallback" },
      ["<Left>"] = { "hide", "fallback" },
      ["<Right>"] = { "hide", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
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
        "markdown",
        "snippets",
        "dictionary",
      },
      providers = {
        -- emoji
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 10, -- Tune by preference
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        },
        -- markdown
        markdown = {
          name = "RenderMarkdown",
          module = "render-markdown.integ.blink",
          fallbacks = { "lsp" },
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
          score_offset = 15,
          enabled = true,
          max_items = 3,
          min_keyword_length = 5,
          opts = {
            dictionary_directories = { vim.fn.expand("~/.config/nvim/dict") },
            get_command = "fzf",
            get_command_args = function(prefix)
              return {
                "--filter=" .. prefix,
                "--sync",
                "--no-sort",
                "-i", -- -i to ignore case, +i to respect case, with no this line is smart case
              }
            end,
          },
        },
        -- LazyDev
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
      },
    },

    completion = {
      accept = { auto_brackets = { enabled = true } }, -- testing this feature
      -- Don't select by default, don't auto insert on selection
      list = { selection = { preselect = false, auto_insert = false } },
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
