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
    { "<leader>fw", "<cmd>FzfLua grep_cword<CR>", desc = "Grep Word" },
    { "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Helptags" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
    { "<leader>fl", "<cmd>FzfLua highlights<CR>", desc = "Highlights" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<CR>", desc = "Old/Recent files" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Old/Recent files" },
    { "<leader>nh", "<cmd>Noice fzf<CR>", desc = "Notification history" },
    { "bb", "<cmd>FzfLua buffers<CR>", desc = "List Buffers" },
    { "<leader>fd", function() require("fzf-lua").files({ cwd = "~/.config" }) end, desc = "Dotfiles" },
    -- live_grep current buffer
    { "<leader>fb", function()
      require("fzf-lua").lgrep_curbuf({
        cmd = "rg --column --line-number --no-heading --color=always --smart-case",
        prompt = " 󰱼 ",
        winopts = {
          width = 1,
          height = 0.3,
          row = vim.o.lines - 2,
        },
      })
    end, desc = "Live Grep Current Buffer" },
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", desc = "LSP Code Actions" },
    { "<leader>gr", "<cmd>FzfLua lsp_references<CR>", desc = "LSP References" },
    { "<leader>gd", "<cmd>FzfLua lsp_definitions<CR>", desc = "LSP Definitions" },
  },
  opts = {
    "default-title",
    fzf_colors = true,
    file_icon_padding = "",
    winopts = {
      width = 0.80,
      height = 0.80,
      backdrop = 25,
      title_flags = false,
      preview = {
        horizontal = "right:75%",
        border = { "▌", " ", " ", " ", " ", " ", "▌", "▌" },
      },
    },
    files = {
      prompt = "   ",
      cwd_prompt = false,
      formatter = "path.filename_first",
    },
    grep = {
      prompt = " 󰱼  ",
      rg_glob = true,
      glob_flag = "--iglob",
      glob_separator = "%s%-%-",
    },
    buffers = {
      prompt = "   ",
      winopts = {
        width = 0.33,
        height = 0.43,
        backdrop = 25,
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
          backdrop = 25,
          preview = {
            horizontal = "down:75%",
            vertical = "down:75%",
            border = { "━", "━", "━", " ", " ", " ", " ", " " },
          },
        },
      },
    },
    oldfiles = { prompt = "   " },
    helptags = { prompt = "   " },
    manpages = { prompt = "   " },
    highlights = { prompt = "   " },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    -- Register as UI select backend
    require("fzf-lua").register_ui_select()
  end,
}
