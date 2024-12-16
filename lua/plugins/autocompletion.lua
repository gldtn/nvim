--- @diagnostic disable: missing-fields
local fancy_border = {
    menu = { "󱐋", "WarningMsg" },
    info = { "", "DiagnosticHint" },
    body = { "─", "╮", "│", "╯", "─", "╰", "│" },
}

return {
    {
        "saghen/blink.cmp",
        lazy = false,
        enabled = true,
        version = "v0.*",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "giuxtaposition/blink-cmp-copilot",
        },
        opts = {
            keymap = {
                preset = "default",
                ["<esc>"] = { "hide", "fallback" },
                ["<C-y>"] = { "accept", "fallback" },
                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
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
                    "snippets",
                    "buffer",
                    "lazydev",
                    "copilot",
                },
                providers = {
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
                    -- dont show LuaLS require statements when lazydev has items
                    lsp = { fallback_for = { "lazydev" } },
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
                },
            },

            completion = {
                menu = {
                    draw = {
                        align_to_component = "label",
                        padding = 1,
                        gap = 4,
                        -- columns = {
                        --     { "kind_icon", gap = 1 },
                        --     { "label", "label_description", gap = 1 },
                        --     { "kind" },
                        -- },
                        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                    },
                    border = { fancy_border.menu, unpack(fancy_border.body) },
                },
                documentation = {
                    auto_show = true,
                    window = {
                        border = { fancy_border.info, unpack(fancy_border.body) },
                    },
                }, --
                signature_help = {
                    window = {
                        border = { fancy_border.info, unpack(fancy_border.body) },
                    },
                },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
                kind_icons = {
                    Copilot = "",
                    Text = "󰉿",
                    Method = "󰊕",
                    Function = "󰊕",
                    Constructor = "󰒓",

                    Field = "󰜢",
                    Variable = "󰆦",
                    Property = "󰖷",

                    Class = "󱡠",
                    Interface = "󱡠",
                    Struct = "󱡠",
                    Module = "󰅩",

                    Unit = "󰪚",
                    Value = "󰦨",
                    Enum = "󰦨",
                    EnumMember = "󰦨",

                    Keyword = "󰻾",
                    Constant = "󰏿",

                    Snippet = "󱄽",
                    Color = "󰏘",
                    File = "󰈔",
                    Reference = "󰬲",
                    Folder = "󰉋",
                    Event = "󱐋",
                    Operator = "󰪚",
                    TypeParameter = "󰬛",
                },
            },
            -- opts_extend = { "sources.default" },
        },
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        build = ":Copilot auth",
        opts = {
            suggestion = { enabled = false, auto_trigger = true, keymap = { accept = "<M-CR>" } },
            panel = { enabled = false },
        },
    },
}
