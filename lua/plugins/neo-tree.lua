return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    { "echasnovski/mini.icons", version = false },
  },
  lazy = true,
  cmd = { "Neotree" },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  },
  enabled = true,
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
    window = {
      position = "right",
      width = 50,
      -- playing with float options (change window.position to "float")
      popup = {
        size = {
          width = 0.6,
          height = 0.8,
        },
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          ".github",
          ".gitignore",
        },
        never_show = {
          ".git",
          ".DS_Store",
          "thumbs.db",
        },
        hide_by_pattern = { "*-lock.json" },
      },
    },
    git_status = {
      window = {
        position = "float",
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
          ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
          ["oc"] = { "order_by_created", nowait = false },
          ["od"] = { "order_by_diagnostics", nowait = false },
          ["om"] = { "order_by_modified", nowait = false },
          ["on"] = { "order_by_name", nowait = false },
          ["os"] = { "order_by_size", nowait = false },
          ["ot"] = { "order_by_type", nowait = false },
        },
      },
    },
    event_handlers = {
      -- Equalize Window Sizes on Neo-tree Open and Close
      {
        event = "neo_tree_window_after_open",
        handler = function(args)
          if args.position == "left" or args.position == "right" then
            vim.cmd("wincmd =")
          end
        end,
      },
      {
        event = "neo_tree_window_after_close",
        handler = function(args)
          if args.position == "left" or args.position == "right" then
            vim.cmd("wincmd =")
          end
        end,
      },
    },
  },
  -- Neotree setup
  config = function(_, opts)
    require("neo-tree").setup(opts)
    -- Loads neo-tree when openning a directory
    vim.api.nvim_create_augroup("load_neo_tree", {})
  end,
}
