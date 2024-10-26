return {
	"folke/which-key.nvim",
	dependencies = { "echasnovski/mini.icons", version = false },
	event = "VeryLazy",
	opts = {
		title = true,
		sort = "alphanum",
		preset = "modern",
		title_pos = "center",
	},

	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500

		-- import which-key plugin
		local wk = require("which-key")

		-- define options
		local keyopts = {
			noremap = false,
			nowait = false,
		}

		local mappings = {
			{ "<leader>a", group = "ai" },
			{ "<leader>b", group = "buffer/browser" },
			{ "<leader>c", group = "code" },
			{ "<leader>d", group = "dap", icon = { icon = "", hl = "markdownH3" } },
			{ "<leader>f", group = "find/files" },
			{ "<leader>g", group = "goto", icon = { icon = "󰆤", color = "yellow" } },
			{ "<leader>G", group = "git", icon = { icon = "󰊢", hl = "markdownH2" } },
			{ "<leader>l", group = "lsp", icon = { icon = "󰒍", hl = "markdownH1" } },
			{ "<leader>m", group = "marks", icon = { icon = "󰸕", hl = "markdownH5" } },
			{ "<leader>r", group = "find/replace", icon = { icon = "󰛔", hl = "markdownH4" } },
			{ "<leader>s", group = "search" },
			{ "<leader>t", group = "toggles" },
			{ "<leader>x", group = "trouble", icon = { icon = "󱏚", color = "red" } },
			{ "<leader>T", group = "treesitter", icon = { icon = "", hl = "markdownH6" } },
			{ "<leader>Ti", "<cmd>InspectTree<cr>", desc = "inspect tree" },
			{ "<leader>Tu", "<cmd>TSUpdate<cr>", desc = "update parsers" },
		}

		wk.add({ mappings, keyopts })
	end,
}
