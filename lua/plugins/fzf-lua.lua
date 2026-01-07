local finder_opts = { -- options for grep curbuff/cword and lsp_references
  cmd = "rg --column --line-number --no-heading --color=always --smart-case",
  prompt = " 󰱼 ",
  winopts = {
    -- split = "botright new", -- bottom split
    height = 0.5,
    width = 1,
    row = vim.o.lines - 2,
    border = { "▍", " ", " ", " ", " ", " ", "▍", "▍" },
    fullscreen = false,
  },
}
-- fzf-lua.lsp_references does not support multiprocess, hence the tbl extend
-- NOTE: Multiprocess makes rg run faster in large files/projects
local multiprocess_true = vim.tbl_extend("force", finder_opts, { multiprocess = true })

return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  dependencies = {
    { "echasnovski/mini.icons", version = false },
    { "junegunn/fzf", build = "./install --bin" },
  },
  -- stylua: ignore
  keys = {
    { "ff", "<cmd>FzfLua files<CR>", desc = "Files" },
    { "<leader><Space>", "<cmd>FzfLua buffers<CR>", desc = "List Buffers" },
    { "<leader>fb", function() require("fzf-lua").lgrep_curbuf(multiprocess_true) end, desc = "Live Grep Current Buffer" },
    { "<leader>fd", function() require("fzf-lua").files({ cwd = "~/.config" }) end, desc = "Dotfiles" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
    { "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Helptags" },
    { "<leader>fl", "<cmd>FzfLua highlights<CR>", desc = "Highlights" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<CR>", desc = "Old/Recent files" },
    { "<leader>fR", "<cmd>FzfLua resume<CR>", desc = "Resume Fzf-Lua" },
    { "<leader>fw", function() require("fzf-lua").grep_cword(multiprocess_true) end, desc = "Grep Word" },
    { "<leader>nh", "<cmd>Noice fzf<CR>", desc = "Notification history" },
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", desc = "LSP Code Actions" },
    { "<leader>gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "LSP Definitions" },
    { "<leader>gi", "<cmd>FzfLua lsp_implementations<CR>", desc = "LSP Implementations" },
    { "<leader>gr", function() require("fzf-lua").lsp_references(finder_opts) end, desc = "LSP References" },
  },
  config = function()
    require("fzf-lua").register_ui_select() -- Register as UI select backend
    local actions = require("fzf-lua.actions")
    local actions_keys = {
      ["ctrl-l"] = actions.file_vsplit,
      ["ctrl-j"] = actions.file_split,
    }

    require("fzf-lua").setup({
      keymap = {
        builtin = {
          ["`"] = "hide",
          ["?"] = "toggle-help",
          ["ctrl-p"] = "toggle-preview",
          ["ctrl-f"] = "toggle-fullscreen",
          ["ctrl-u"] = "preview-page-up",
          ["ctrl-d"] = "preview-page-down",
        },
        fzf = {
          ["ctrl-p"] = "toggle-preview",
          ["ctrl-u"] = "preview-page-up",
          ["ctrl-d"] = "preview-page-down",
        },
      },
      fzf_colors = true,
      ui_select = true,
      winopts = {
        width = 0.80,
        height = 0.80,
        backdrop = 3,
        title_flags = false,
        preview = {
          horizontal = "right:75%",
          scrollbar = "float",
          border = { "▌", " ", " ", " ", " ", " ", "▌", "▌" },
          winopts = {
            number = true,
          },
        },
      },
      files = {
        prompt = "   ",
        cwd_prompt = false,
        multiprocess = true,
        formatter = "path.filename_first",
        actions = actions_keys,
      },
      grep = {
        prompt = " 󰱼  ",
        multiprocess = true,
        rg_glob = true,
        glob_flag = "--iglob",
        glob_separator = "%s%-%-",
        actions = actions_keys,
      },
      buffers = {
        prompt = "   ",
        winopts = {
          width = 0.35,
          height = 0.45,
          preview = { hidden = "hidden" },
        },
      },
      lsp = {
        code_actions = {
          prompt = "   ",
          winopts = {
            numbers = true,
            width = 0.6,
            height = 0.6,
            preview = {
              horizontal = "down:75%",
              vertical = "down:75%",
              border = { "━", "━", "━", " ", " ", " ", " ", " " },
            },
          },
        },
      },
      oldfiles = {
        prompt = "   ",
        actions = actions_keys,
      },
      helptags = { prompt = "   " },
      manpages = { prompt = "   " },
      highlights = {
        prompt = "   ",
        winopts = {
          width = 1,
          height = 0.5,
          backdrop = 12,
          row = vim.o.lines - 2,
        },
      },
    })
  end,
}
