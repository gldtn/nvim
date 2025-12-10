return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  enabled = false,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").load_extension("lazygit")
  end,
  keys = {
    { "<leader>og", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
