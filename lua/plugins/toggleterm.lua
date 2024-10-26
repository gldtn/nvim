return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- lazy = true,
	-- event = "VeryLazy",
	opts = function()
		require("toggleterm").setup({
			size = 15,
			open_mapping = [[<C-/>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			-- shading_factor = "1",
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "single",
				winblend = 0,
				borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
				title_pos = "center",
			},
			highlights = {
				Normal = { link = "ToggleTermNormal" },
				NormalFloat = { link = "ToggleTermNormalFloat" },
				FloatBorder = { link = "comment" },
			},
		})
		vim.keymap.set("n", "<C-/>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
	end,
}
