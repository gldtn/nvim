return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		panel = { enabled = false },
		suggestion = {
			auto_trigger = true,
			keymap = {
				accept = "<C-S-y>",
				accept_word = "<C-w>",
				accept_line = "<C-l>",
				next = "<C-j>",
				prev = "<C-k>",
				dismiss = "<ESC>",
			},
		},
	},
}
