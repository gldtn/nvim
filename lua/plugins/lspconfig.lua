return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },
        "saghen/blink.cmp",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "Bilal2453/luvit-meta", lazy = true },
    },
    opts = {
        diagnostics = {
            signs = true,
            underline = true,
            update_in_insert = true,
            virtual_text = {
                source = "if_many",
                prefix = " ● ",
            },
        },
        fancy_border = {
            { "", "DiagnosticHint" },
            { "─", "Comment" },
            { "╮", "Comment" },
            { "│", "Comment" },
            { "╯", "Comment" },
            { "─", "Comment" },
            { "╰", "Comment" },
            { "│", "Comment" },
        },
    },
    config = function(_, opts)
        -- Define the `on_attach` function for shared key mappings
        ---@diagnostic disable-next-line: unused-local
        local on_attach = function(client, bufnr)
            local buf_map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, noremap = true, desc = desc })
            end

            -- Key mappings
            buf_map("n", "<leader>ca", "<CMD>FzfLua lsp_code_actions<CR>", "Code Action")
            buf_map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
            buf_map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
            buf_map("n", "gd", "<CMD>FzfLua lsp_definitions<CR>", "Goto Definition")
            buf_map("n", "gD", "<CMD>FzfLua lsp_declarations<CR>", "Goto Declaration")
            buf_map("n", "gi", "<CMD>FzfLua lsp_implementations<CR>", "Goto Implementation")
            buf_map("n", "gr", "<CMD>FzfLua lsp_references<CR>", "Goto References")
            buf_map("n", "gy", "<CMD>FzfLua lsp_typedefs<CR>", "Goto Type Definition")
            buf_map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
            buf_map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
        end

        -- Apply diagnostic configuration
        vim.diagnostic.config(opts.diagnostics)

        -- Set custom borders
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = opts.fancy_border })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = opts.fancy_border })
        require("lspconfig.ui.windows").default_options = { border = "rounded" }

        -- Define individual server configurations
        local servers = {
            lua_ls = {
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.uv.fs_stat(path .. "/.luarc.json") and not vim.uv.fs_stat(path .. "/.luarc.jsonc") then
                        client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                workspace = {
                                    checkThirdParty = false,
                                    library = vim.api.nvim_get_runtime_file("", true),
                                },
                            },
                        })
                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end
                    return true
                end,
                on_attach = function(client, bufnr)
                    client.server_capabilities.semanticTokensProvider = nil
                    on_attach(client, bufnr)
                end,
            },
            phpactor = {
                init_options = {
                    ["language_server_worse_reflection.inlay_hints.enable"] = true,
                    ["language_server_worse_reflection.inlay_hints.types"] = true,
                },
            },
            zls = {
                cmd = { "/usr/local/bin/zls" },
                settings = {
                    zls = {
                        format = { enable = true },
                    },
                },
            },
            sourcekit = {
                cmd = { "xcrun", "sourcekit-lsp" },
                capabilities = {
                    workspace = {
                        didChangeWatchedFiles = { dynamicRegistration = true },
                    },
                },
            },
        }

        -- Apply settings to all servers
        for name, config in pairs(servers) do
            if not config.on_attach then
                config.on_attach = on_attach
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            end
            require("lspconfig")[name].setup(config)
        end

        -- Mason setup
        require("mason-lspconfig").setup({
            ensure_installed = { "zls", "cssls", "taplo", "lua_ls", "jsonls", "bashls", "yamlls", "phpactor", "tailwindcss", "rust_analyzer" },
            automatic_installation = true,
        })
        vim.lsp.set_log_level("debug")
    end,
}
