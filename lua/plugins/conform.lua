return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  cmd = { "ConformInfo" },
  dependencies = {
    "rcarriga/nvim-notify",
  },

  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        toml = { "taplo" },
        css = { "prettierd" },
        scss = { "prettierd" },
        html = { "prettierd" },
        yaml = { "prettierd" },
        json = { "prettierd" },
        markdown = { "prettierd" },
        javascript = { "prettierd" },
        python = { "isort", "black" },
        blade = { "blade-formatter" },
        php = { "pint", "blade-formatter" },
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    })

    -- Disable autoformat-on-save
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    -- Enable autoformat-on-save
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })

    -- Toggle autoformat-on-save globally
    local function toggle_autoformat()
      if vim.g.disable_autoformat then
        vim.g.disable_autoformat = false
        vim.notify("Autoformat enabled globally!", vim.log.levels.INFO, { title = "Auto-format" })
      else
        vim.g.disable_autoformat = true
        vim.notify("Autoformat disabled globally!", vim.log.levels.INFO, { title = "Auto-format" })
      end
    end

    -- Keybindings
    local map = require("core.utils").map

    map("n", "<leader>cf", function()
      require("conform").format({ async = true, lsp_fallback = true })
      vim.notify("Formatting complete!", vim.log.levels.INFO, { title = "Buffer Format" })
    end, { desc = "Format buffer" })
    map("n", "<leader>tf", toggle_autoformat, { desc = "Toggle autoformat-on-save" })
  end,
}
