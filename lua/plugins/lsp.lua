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
            "vimls",
            "cssls",
            "vue_ls",
            "lua_ls",
            "jsonls",
            "bashls",
            "yamlls",
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
            update_in_insert = true,
            virtual_text = {
              source = "if_many",
              prefix = " ● ",
            },
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

          -- Apply diagnostic configuration
          vim.diagnostic.config(opts.diagnostics)

          -- intelephense license key setup
          local get_intelephense_license = function()
            local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
            local content = f:read("*a")
            f:close()
            return string.gsub(content, "%s+", "")
          end

          local servers = {

            lua_ls = {
              -- cmd = { "lua-language-server" },
              cmd = { "/usr/bin/lua-language-server" },
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

          -- Apply settings to all servers
          for name, config in pairs(servers) do
            -- inject cmp capabilities to blink if available
            local ok_cmp, cmp = pcall(require, "blink.cmp")
            if ok_cmp then
              config.capabilities = cmp.get_lsp_capabilities(config.capabilities)
            end
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
