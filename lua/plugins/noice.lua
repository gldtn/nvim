return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        timeout = 3000,
        stages = "slide",
        top_down = true,
      },
    },
  },
  opts = {
    lsp = {
      hover = { enabled = false },
      signature = { enabled = false },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "lsp",
          kind = "progress",
          cond = function(message)
            local client = vim.tbl_get(message.opts, "progress", "client")
            return client == "lua_ls"
          end,
        },
        opts = { skip = true },
      },
    },
    presets = {
      inc_rename = false,
      bottom_search = false,
      lsp_doc_border = false,
      command_palette = true,
      long_message_to_split = false,
    },
    views = {
      split = {
        enter = true,
        size = "25%",
        position = "bottom",
      },
      mini = {
        win_options = {
          winblend = 0,
        },
      },
    },
    cmdline = {
      view = "cmdline",
      format = {
        cmdline = {
          pattern = "^:",
          icon = "  ",
          icon_hl_group = "markdownH1",
          lang = "vim",
        },
      },
    },
  },
}
