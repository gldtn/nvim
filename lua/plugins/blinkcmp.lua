return {
	"saghen/blink.cmp",
	lazy = false,
	enabled = true,
	version = "v0.*",
	dependencies = "rafamadriz/friendly-snippets",
	config = function()
		require("blink.cmp").setup({
			highlight = { use_nvim_cmp_as_default = true },
			keymap = {
				["<C-y>"] = { "accept", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
			},
			windows = {
				autocomplete = {
					draw = "simple",
					border = {
						{ "󱐋", "WarningMsg" },
						"─",
						"╮",
						"│",
						"╯",
						"─",
						"╰",
						"│",
					},
				},
				documentation = {
					auto_show = true,
					border = {
						{ "", "DiagnosticHint" },
						"─",
						"╮",
						"│",
						"╯",
						"─",
						"╰",
						"│",
					},
				},
				signature_help = { border = "rounded" },
				-- ghost_text = { enabled = true },
			},
		})
	end,
}
