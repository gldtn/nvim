return {
    "saghen/blink.cmp",
    lazy = false,
    enabled = true,
    -- version = "v0.*",
    build = "cargo build --release",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        { "saghen/blink.compat", opts = { impersonate_nvim_cmp = true } },
    },
    config = function()
        require("blink.cmp").setup({
            sources = {
                -- add lazydev to your completion providers
                completion = {
                    enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
                },
                providers = {
                    -- dont show LuaLS require statements when lazydev has items
                    lsp = { fallback_for = { "lazydev" }, name = "lsp" },
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
                },
            },
            highlight = { use_nvim_cmp_as_default = true },
            keymap = {
                ["<C-y>"] = { "accept", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
            },
            windows = {
                autocomplete = {
                    draw = {
                        align_to_component = "label",
                        padding = 1,
                        gap = 1,
                        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
                        components = {},
                    },

                    border = {
                        { "󱐋", "WarningMsg" },
                        "─",
                        "╮",
                        "│",
                        "╯",
                        "─",
                        "╰",
                        "│",
                    },
                },
                documentation = {
                    auto_show = true,
                    border = {
                        { "", "DiagnosticHint" },
                        "─",
                        "╮",
                        "│",
                        "╯",
                        "─",
                        "╰",
                        "│",
                    },
                },
                signature_help = { border = "rounded" },
            },
        })
    end,
}
