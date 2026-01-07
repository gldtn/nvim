return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            border = "solid",
            width = 0.6,
            height = 0.6,
            backdrop = 60,
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
          ensure_installed = {
            -- LSP's
            "zls",
            "html",
            "gopls",
            "vimls",
            "cssls",
            "vue_ls",
            "lua_ls",
            "jsonls",
            "bashls",
            "yamlls",
            "hyprls",
            "intelephense",
            "tailwindcss",
            -- linters
            "eslint",
            -- formaters
            "jq",
            "pint",
            "shfmt",
            "taplo",
            "black",
            "isort",
            "stylua",
            "goimports",
            "prettierd",
            "blade-formatter",
          },
        },
      },
      {
        "neovim/nvim-lspconfig",
        opts = {
          diagnostics = {
            signs = true,
            underline = true,
            update_in_insert = false,
            virtual_text = {
              source = "if_many",
              prefix = " ● ",
            },
            severity_sort = true,
          },
        },

        config = function(_, opts)
          require("ui.lsp_borders").apply()

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
            buf_map("n", "<C-S-h>", vim.lsp.buf.signature_help, "Signature Help")
          end

          -- Apply diagnostic configuration globally
          vim.diagnostic.config(opts.diagnostics)

          -- intelephense license key setup
          local get_intelephense_license = function()
            local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
            local content = f:read("*a")
            f:close()
            return string.gsub(content, "%s+", "")
          end

          local util = require("lspconfig.util")
          local servers = {

            lua_ls = {
              cmd = { "lua-language-server" },
              -- cmd = { "/usr/bin/lua-language-server" },
              settings = {
                Lua = {
                  runtime = { version = "LuaJIT" },
                  diagnostics = { globals = { "vim", "Snacks" } },
                  workspace = {
                    checkThirdParty = false,
                    library = { vim.env.VIMRUNTIME },
                  },
                },
              },
              on_attach = function(client, bufnr)
                client.server_capabilities.semanticTokensProvider = nil
                on_attach(client, bufnr)
              end,
            },

            gopls = {
              cmd = { "gopls" },
              filetypes = { "go", "gomod", "gowork", "gotmpl" },
              root_markers = util.root_pattern("go.mod", "go.work", ".git"),
              settings = {
                gopls = {
                  analyses = {
                    unusedparams = true, -- Enables detection of unused function parameters
                    shadow = true, -- Warns when a variable declaration shadows a variable in an outer scope
                  },
                  staticcheck = true, -- Enables additional static analysis beyond the default checks
                  usePlaceholders = true, -- Enables placeholders in code completions
                  completeUnimported = true, -- Enables completion suggestions for packages that are not yet imported
                },
              },
            },

            cssls = {
              settings = {
                css = {
                  validate = false, -- Disables all built-in validation to ignore custom values like @peach
                  lint = {
                    unknownAtRules = "ignore", -- Suppresses warnings for unknown at-rules like @define-color
                  },
                },
              },
            },

            html = {
              cmd = { "vscode-html-language-server", "--stdio" },
              filetypes = {
                "html",
                "blade",
                "javascriptreact",
                "typescriptreact",
                "svelte",
              },
              root_markers = { "index.html", ".git" },
              init_options = { provideFormatter = true },
              settings = {
                html = {
                  format = {
                    indentSize = 4,
                    insertSpaces = true,
                  },
                },
              },
            },

            intelephense = {
              cmd = { "intelephense", "--stdio" },
              filetypes = { "php", "blade" },
              root_markers = { "composer.json", ".git" },
              settings = {
                intelephense = {
                  format = {
                    enable = true,
                    insertSpaces = true,
                    tabSize = 4,
                  },
                },
              },
              init_options = {
                licenceKey = get_intelephense_license(),
              },
            },
          }

          -- Configure LSP capabilities once globally
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          local ok_cmp, cmp = pcall(require, "blink.cmp")
          if ok_cmp then
            capabilities = vim.tbl_deep_extend("force", capabilities, cmp.get_lsp_capabilities())
          end
          -- Apply settings to all servers using new v0.12 API
          for name, config in pairs(servers) do
            config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
            -- on_attach LSP keymaps
            if not config.on_attach then
              config.on_attach = on_attach
            end
            vim.lsp.config(name, config)
          end
        end,
      },
    },
  },
}
