return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "dashboard",
      },
    },
  },
}
