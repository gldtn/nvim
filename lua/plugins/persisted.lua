return {
	"olimorris/persisted.nvim",
	lazy = true,
	event = "BufReadPre",
	config = function()
		local persisted = require("persisted")
		local utils = require("persisted.utils")
		local allowed_dirs = {
			"~/code",
			"~/.config",
		}
		persisted.setup({
			should_save = function()
				return utils.dirs_match(vim.fn.getcwd(), allowed_dirs)
			end,
		})
		-- mappings
		local map = require("core.util").map
		map("n", "<S-s>", "<cmd>Telescope persisted<cr>", { desc = "List Sessions" })
	end,
}
