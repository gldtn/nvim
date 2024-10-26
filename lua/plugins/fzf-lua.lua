return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	dependencies = {
		{ "echasnovski/mini.icons", version = false },
		{ "junegunn/fzf", build = "./install --bin" },
	},
    -- stylua: ignore
    keys = {
        { "<C-f><C-f>", "<cmd>FzfLua files<CR>", desc = "Files" },
        { "<C-f><C-w>", "<cmd>FzfLua grep_cword<CR>", desc = "Grep Word" },
        { "<C-f><C-h>", "<cmd>FzfLua helptags<CR>", desc = "Helptags" },
        { "<C-f><C-g>", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
        { "<C-h><C-h>", "<cmd>FzfLua highlights<CR>", desc = "Highlights" },
        { "<C-f><C-c>", "<cmd>FzfLua colorschemes<CR>", desc = "Colorscheme" },
        { "<C-f><C-d>", function() require("fzf-lua").files({ cwd = "~/.config" }) end, desc = "Dotfiles", },
    },
	opts = {
		"default-title",
		fzf_colors = true,
		keymap = {
			builtin = {
				["<C-/>"] = "toggle-help",
				["<C-f>"] = "toggle-fullscreen",
			},
		},
		winopts = {
			width = 0.90,
			height = 0.80,
			backdrop = 25,
			preview = { horizontal = "right:70%" },
			border = { "▌", " ", " ", " ", " ", " ", "▌", "▌" },
		},
		files = {
			prompt = "   ",
			cwd_prompt = false,
			formatter = "path.filename_first",
		},
		grep = {
			prompt = "   ",
			rg_glob = true,
			glob_flag = "--iglob",
			glob_separator = "%s%-%-",
		},
		helptags = { prompt = "   " },
		manpages = { prompt = "   " },
		highlights = { prompt = "   " },
	},
}
