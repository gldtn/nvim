-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- IMPORTANT:
-- setup leader keys prior to loading lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set encoding for the file
vim.o.encoding = "utf-8" -- Set encoding for the file
vim.o.fileencoding = "utf-8" -- Set encoding for the file

require("lazy").setup({
  ---@diagnostic disable-next-line: assign-type-mismatch
  dev = {
    path = "~/git/projects",
    fallback = true,
  },
  spec = {
    { import = "plugins" },
  },
  ui = {
    backdrop = 25,
    border = "rounded",
    title = " lazy.nvim ",
  },
  install = {
    missing = true,
  },
  checker = {
    enabled = true,
    frequency = 3600,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        "netrwPlugin",
        "tutor",
      },
    },
  },
  rocks = { enabled = false },
})
