return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "TSUpdateSync" },
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    "EmranMR/tree-sitter-blade",
  },
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
    ensure_installed = {
      "c",
      "lua",
      "luap",
      "luadoc",
      "vim",
      "vimdoc",
      "json",
      "yaml",
      "toml",
      "bash",
      "swift",
      -- web
      "css",
      "html",
      "scss",
      "blade",
      "phpdoc",
      "php_only",
    },
    ignore_install = {},
    auto_install = true,
    sync_install = false,
    autotag = { enable = true },
    incremental_selection = { enable = true },
  },
  -- Setup tree-sitter-blade parser
  config = function(_, opts)
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    require("nvim-treesitter.configs").setup(opts)
    ---@class ParserConfig
    ---@field install_info table Information for installing the parser.
    ---@field filetype string Filetype this parser is associated with.
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    ---@type ParserConfig
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }
  end,
}
