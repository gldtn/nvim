return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    scope = { enabled = false },
    indent = { char = "│" },
    exclude = {
      filetypes = {
        "dashboard",
      },
    },
  },
}
