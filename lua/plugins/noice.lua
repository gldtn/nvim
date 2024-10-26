return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				timeout = 3000,
				stages = "slide",
				top_down = false,
			},
		},
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				opts = { skip = true },
			},
		},
		presets = {
			bottom_search = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
		views = {
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		},
		cmdline = {
			view = "cmdline",
			format = {
				cmdline = {
					pattern = "^:",
					icon = "  ",
					icon_hl_group = "markdownH1",
					lang = "vim",
				},
			},
		},
	},
}
