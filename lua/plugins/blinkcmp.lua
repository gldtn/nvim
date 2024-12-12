--- @diagnostic disable: missing-fields
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
    dependencies = {
        -- "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "giuxtaposition/blink-cmp-copilot",
    },
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
            ["<esc>"] = { "hide", "fallback" },
            ["<C-y>"] = { "accept", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            -- escape with arrow keys
            ["<Up>"] = { "hide", "fallback" },
            ["<Down>"] = { "hide", "fallback" },
            ["<Left>"] = { "hide", "fallback" },
            ["<Right>"] = { "hide", "fallback" },
        },
        appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "mono" },

        sources = {
            providers = {
                lsp = { fallback_for = { "lazydev" } },
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
                copilot = {
                    name = "copilot",
                    module = "blink-cmp-copilot",
                    -- score_offset = 0,
                },
            },
            default = { "copilot", "lsp", "path", "snippets", "buffer", "lazydev" },
        },

        completion = {
            menu = {
                draw = {
                    align_to_component = "label",
                    padding = 1,
                    gap = 1,
                    columns = {
                        { "kind_icon", gap = 1 },
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                    },
                },
                border = { fancy_border.menu, unpack(fancy_border.body) },
            },
            documentation = {
                auto_show = true,
                window = {
                    border = { fancy_border.info, unpack(fancy_border.body) },
                },
            },
            signature_help = {
                window = {
                    border = { fancy_border.info, unpack(fancy_border.body) },
                },
            },
        },

        -- Uncomment if needed
        opts_extend = { "sources.default" },
    },
}
