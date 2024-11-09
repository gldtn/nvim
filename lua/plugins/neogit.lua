return {
	"NeogitOrg/neogit",
	branch = "master",
	event = "BufReadPre",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- diff integration
	},
	cmd = "Neogit",
        -- stylua: ignore
		keys = {
			-- { "<leader>gg", "<CMD>Neogit<CR>", desc = "Neogit" },
			{ "<leader>gl", function() require("neogit").action("log", "log_current", { "--", vim.fn.expand("%") })() end, desc = "Git log for file", },
			{ "<leader>gr", function()
                local file = vim.fn.expand("%") vim.cmd([[execute "normal! \<ESC>"]])
                local line_start = vim.fn.getpos("'<")[2]
                local line_end = vim.fn.getpos("'>")[2]
                require("neogit").action("log", "log_current", { "-L" .. line_start .. "," .. line_end .. ":" .. file })()
            end, desc = "Git log for this range", mode = "v", },
		},
	-- See: https://github.com/NeogitOrg/neogit#configuration
	opts = {
		mappings = {
			popup = {
				["P"] = false,
				["p"] = "PushPopup",
				["F"] = "PullPopup",
			},
			status = {
				["<C-s>"] = "StageUnstaged",
				["<C-g><C-s>"] = "StageAll",
			},
			rebase_editor = {
				["<C-d>"] = "Abort",
				["<C-c><C-k>"] = false,
			},
			commit_editor = {
				["<C-d>"] = "Abort",
				["<C-c><C-k>"] = false,
			},
		},
		signs = {
			-- { CLOSED, OPENED }
			hunk = { "", "" },
			item = { "", "" }, -- 
			section = { " ", " " },
		},
		sections = {
			untracked = { folded = true, hidden = false },
			rebase = { folded = false },
			recent = { folded = false },
		},
		kind = "tab", -- tab/floating/split/vsplit
		commit_editor = { show_staged_diff = false },
		graph_style = "kitty",
		popup = { kind = "floating" },
		integrations = {
			fzf_lua = true,
			diffview = true,
			telescope = false,
		},
	},
}
