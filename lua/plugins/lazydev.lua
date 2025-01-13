return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      -- Only load luvit types when the `vim.uv` word is found
      { path = "luvit-meta/library", words = { "vim%.uv" } },
    },
  },
}
