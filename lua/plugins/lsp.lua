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
            -- lsp
            "vimls",
            "lua_ls",
            "jsonls",
            "bashls",
            "yamlls",
            "phpactor",
            -- linter
            "eslint",
            -- formater
            "jq",
            "pint",
            "stylua",
            "prettierd",
          },
        },
      },
      {
        "neovim/nvim-lspconfig",
        config = function()
          local lspc = vim.lsp.config

          lspc.lua_ls = {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  checkThirdParty = false,
                  library = vim.api.nvim_get_runtime_file("", true),
                },
              },
            },
          }
        end,
      },
    },
  },
}
