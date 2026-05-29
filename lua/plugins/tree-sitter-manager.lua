return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require("tree-sitter-manager").setup({
      ensure_installed = {
        "c",
        "jq",
        "lua",
        "luap",
        "luadoc",
        "vim",
        "vimdoc",
        "json",
        "yaml",
        "toml",
        "bash",
        "markdown",
        "markdown_inline",
        -- web
        "php",
        "css",
        "html",
        "scss",
        "blade",
        "phpdoc",
        "php_only",
      },
      auto_install = true,
    })
  end,
}
