return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "TSUpdateSync" },
	dependencies = {
		-- "nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
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
			-- web
			"php",
			"css",
			"html",
			"scss",
		},
		ignore_install = {},
		auto_install = true,
		sync_install = false,
		autotag = { enable = true },
		incremental_selection = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
