return {
	{
		"NeogitOrg/neogit",
		branch = "master",
		event = "BufReadPre",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- diff integration
			"nvim-telescope/telescope.nvim", -- telescope integration
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>Gg", "<cmd>Neogit<CR>", desc = "Neogit" },
			{
				"<leader>Gf",
				function()
					require("neogit").action("log", "log_current", { "--", vim.fn.expand("%") })()
				end,
				desc = "Git log for file",
			},
			{
				"<leader>gf",
				function()
					local file = vim.fn.expand("%")
					vim.cmd([[execute "normal! \<ESC>"]])
					local line_start = vim.fn.getpos("'<")[2]
					local line_end = vim.fn.getpos("'>")[2]

					require("neogit").action("log", "log_current", { "-L" .. line_start .. "," .. line_end .. ":" .. file })()
				end,
				desc = "Git log for this range",
				mode = "v",
			},
		},
		-- See: https://github.com/TimUntersberger/neogit#configuration
		opts = {
			kind = "tab", -- tab/floating/split/vsplit
			console_timeout = 10000,
			telescope_sorter = function()
				return require("telescope").extensions.fzf.native_fzf_sorter()
			end,
			filewatcher = {
				enabled = true,
			},
			disable_hint = false,
			graph_style = "unicode",
			remember_settings = true,
			notification_icon = " ",
			auto_show_console = true,
			fetch_after_checkout = true,
			use_per_project_settings = true,
			disable_insert_on_commit = "auto",
			mappings = {
				popup = {
					["P"] = false,
					["p"] = "PushPopup",
					["F"] = "PullPopup",
				},
				status = {
					["<c-s>"] = "StageUnstaged",
					["<c-g><c-s>"] = "StageAll",
				},
				rebase_editor = {
					["<c-d>"] = "Abort",
					["<c-c><c-k>"] = false,
				},
				commit_editor = {
					["<c-d>"] = "Abort",
					["<c-c><c-k>"] = false,
				},
			},
			signs = {
				-- { CLOSED, OPENED }
				hunk = { "", "" },
				-- item = { "  ", " " }, -- 
				section = { " ", " " },
			},
			sections = {
				untracked = {
					folded = true,
					hidden = false,
				},
				rebase = {
					folded = false,
				},
				recent = {
					folded = false,
				},
			},
			commit_editor = { show_staged_diff = false },
			-- commit_view = { kind = "floating" },
			-- popup = { kind = "floating" },
			integrations = {
				-- telescope = true, -- use telescope instead of vim.ui.select
				diffview = true,
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "[GS] Toggle current line blame" },
			{ "<leader>gw", ":Gitsigns toggle_word_diff<cr>", desc = "Toggle word diff" },
			{ "[g", ":Gitsigns next_hunk<cr>", desc = "Next hunk" },
			{ "]g", ":Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
		},
		opts = {
			signcolumn = true,
			current_line_blame_formatter = "<author>:<author_time:%Y-%m-%d> - <summary>",
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "right_align",
				delay = 1,
				ignore_whitespace = false,
			},
		},
	},
}
