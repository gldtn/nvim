return {
	"MagicDuck/grug-far.nvim",
	opts = {},
	keys = {
        -- Launch, limiting search/replace to current file
        -- stylua: ignore start
        { "<leader>rf", function() require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } }) end, desc = "find & replace (buffer)" }, -- stylua: ignore
        -- Launch with the current visual selection, searching only current file
        { "<leader>rv", function() require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand("%") } }) end, desc = "find & replace (visual)" },
		-- stylua: ignore end
		-- search locally (current file)
		{
			"<leader>rl",
			function()
				require("grug-far").toggle_instance({
					instanceName = "far",
					staticTitle = "Find and Replace",
					prefills = {
						paths = vim.fn.expand("%"),
						search = vim.fn.expand("<cword>"),
					},
				})
			end,
			desc = "find & replace (far)",
		},
		-- search globally
		{
			"<leader>rg",
			function()
				require("grug-far").toggle_instance({
					instanceName = "far",
					staticTitle = "Find and Replace",
					prefills = {
						search = vim.fn.expand("<cword>"),
					},
				})
			end,
			desc = "find & replace (globally)",
		},
	},
}
