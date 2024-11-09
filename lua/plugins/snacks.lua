return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	keys = {
		{
			"<leader>gB",
			function()
				---@diagnostic disable-next-line: undefined-global
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				---@diagnostic disable-next-line: undefined-global
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.99,
					height = 0.99,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		},
	},
	opts = {
		gitbrowse = {
			what = "file",
		},
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
		lazygit = {
			configure = false,
			win = {
				position = "float",
				width = 0.99,
				height = 0.99,
			},
		},
		terminal = {
			win = {
				position = "bottom",
				width = 0.5,
				wo = {
					winbar = "", -- hide terminal title
				},
			},
		},
	},
}
