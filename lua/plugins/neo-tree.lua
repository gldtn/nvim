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
  enabled = true,
  -- init = function()
  --   vim.api.nvim_create_autocmd("BufEnter", {
  --     group = vim.api.nvim_create_augroup("load_neo_tree", {}),
  --     desc = "Loads neo-tree when openning a directory",
  --     callback = function(args)
  --       local stats = vim.uv.fs_stat(args.file)
  --       if not stats or stats.type ~= "directory" then
  --         return
  --       end
  --       require("neo-tree")
  --       return true
  --     end,
  --   })
  -- end,

  -- Neotree setup
  config = function()
    require("neo-tree").setup({
      close_if_last_window = "true",
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
      window = {
        position = "right",
        width = 40,
        popup = {
          -- Center the popup horizontally and vertically
          position = function()
            return {
              col = math.floor((vim.o.columns - (vim.o.columns * 0.4)) / 2),
              row = math.floor((vim.o.lines - (vim.o.lines * 0.8)) / 2),
            }
          end,
          size = function()
            -- Set the popup size to 80% of the window's width and height
            return {
              width = math.floor(vim.o.columns * 0.4),
              height = math.floor(vim.o.lines * 0.8),
            }
          end,
        },
      },
      popup_border_style = "rounded",
      filesystem = {
        filtered_items = {
          close_if_last_window = true,
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
      -- Loads neo-tree when openning a directory
      vim.api.nvim_create_augroup("load_neo_tree", {}),
    })
  end,
}
