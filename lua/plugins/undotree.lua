return {
	"debugloop/telescope-undo.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
	keys = {
		{ "<leader>u", "<cmd>Telescope undo initial_mode=normal<cr>", desc = "undo history" },
	},
	opts = {
		extensions = {
			undo = {
				saved_only = true,
				side_by_side = true,
				entry_format = "   $ID        [$STAT]        $TIME",
				layout_strategy = "vertical",
				layout_config = {
					preview_height = 0.65,
				},
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("undo")
	end,
}
