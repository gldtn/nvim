-- thanks @CKolkey for providing all these neet functions
-- See: https://github.com/CKolkey/config/blob/master/nvim/lua/ckolkey/plugins/telescope.lua
local live_grep = function()
	local filetype = vim.fn.expand("%:e")
	if filetype == "" then
		filetype = "*"
	end

	require("telescope").extensions.live_grep_args.live_grep_args({ debounce = 100 })

	-- local exclusions = [[-g!"log/**" -g!".git/**" -g!".pnpm-store/**" -g!"node_modules/**" -g!"*.log""]]
	local keys = vim.api.nvim_replace_termcodes([["" -g "*.]] .. filetype .. [["<c-a><right>]], true, false, true)

	vim.api.nvim_feedkeys(keys, "c", false)
end
-- current word under cursor
local grep_current_word = function()
	local word = vim.fn.expand("<cword>")
	local filetype = vim.fn.expand("%:e")

	require("telescope").extensions.live_grep_args.live_grep_args({ debounce = 100 })

	local keys = vim.api.nvim_replace_termcodes([["" -g "*.]] .. filetype .. [["<c-a><right>]] .. word, true, false, true)

	vim.api.nvim_feedkeys(keys, "c", false)
end

-- telescope action keys
local function action(key)
	return function(...)
		return require("telescope.actions")[key](...)
	end
end

return {
	"nvim-telescope/telescope.nvim",
	Lazy = true,
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"natecraddock/telescope-zf-native.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{ "nvim-telescope/telescope-file-browser.nvim", dev = false },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
    -- stylua: ignore
	keys = {
		{ "<C-k><C-g>", live_grep, desc = "Live Grep" },
        { "<C-k><C-w>", grep_current_word, desc = "Grep current word" },
        -- { "<C-k><C-t>", "<cmd>Telescope colorscheme<cr>", desc = "Themes" },
		{ "<C-k><C-h>", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
        { "<C-k><C-f>", "<cmd>Telescope find_files<cr>", desc = "Find File" },
		{ "<C-k><C-r>", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
		{ "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
        { "<C-k><C-n>", function() require("telescope").extensions.notify.notify() end, desc = "Notifications", },
        { "<C-k><C-b>", "<cmd>Telescope file_browser path=%:p:h select_buffer=true initial_mode=normal<CR>", desc = "File drawer" },
	},

	opts = {
		defaults = {
			layout_config = {
				width = 0.90,
				height = 0.80,
				vertical = {
					mirror = false,
				},
				horizontal = {
					prompt_position = "top",
					preview_width = 0.70,
					results_width = 0.30,
				},
			},
			show_line = false,
			entry_prefix = " ",
			selection_caret = " ",
			prompt_prefix = "   ",
			dynamic_preview_title = true,
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			path_display = {
				filename_first = {
					reverse_directories = true,
				},
			},
			set_env = { ["COLORTERM"] = "truecolor" },
			borderchars = {
				prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
				results = { " ", " ", " ", " ", " ", " ", " ", " " },
				preview = { " ", "", "", "▌", "▌", "", "", "▌" },
			},
			mappings = {
				i = {
					["<C-h>"] = "which_key",
					["<esc>"] = action("close"),
					["<c-s>"] = action("file_split"),
					["<cr>"] = function(prompt_bufnr)
						local actions = require("telescope.actions")
						local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
						if #picker:get_multi_selection() > 1 then
							actions.send_selected_to_qflist(prompt_bufnr)
							actions.open_qflist(prompt_bufnr)
						else
							actions.select_default(prompt_bufnr)
						end
					end,
				},
				n = { ["<esc>"] = action("close") },
			},
			file_ignore_patterns = {
				"^.git\\/.*",
				"^log\\/.*",
				"^%.DS_Store$",
			},
			-- hidden = true,
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				-- "--hidden",
				"--column",
				"--smart-case",
				-- "--trim",
			},
		},
		-- pickers
		pickers = {
			buffers = {
				prompt_prefix = "   ",
				results_title = false,
				previewer = false,
				sort_lastused = true,
				initial_mode = "normal",
				layout_config = {
					width = 0.3,
					height = 0.4,
					prompt_position = "top",
				},
				mappings = {
					i = {
						["<c-d>"] = "delete_buffer",
					},
				},
			},
			colorscheme = {
				prompt_prefix = "   ",
				results_title = false,
				previewer = false,
				sort_lastused = true,
				layout_config = {
					width = 0.3,
					height = 0.4,
					prompt_position = "top",
				},
			},
			find_files = {
				prompt_prefix = "   ",
				cache_picker = false,
				find_command = {
					"fd",
					"--type",
					"f",
					"--strip-cwd-prefix",
					"--color=never",
					"--hidden",
				},
			},
			oldfiles = {
				prompt_prefix = "   ",
			},
			highlights = {
				prompt_prefix = "   ",
			},
			live_grep = {
				prompt_prefix = "   ",
				cache_picker = false,
			},
			help_tags = {
				prompt_prefix = "   ",
				mappings = {
					i = {
						["<CR>"] = "select_vertical",
					},
				},
			},
			marks = {
				prompt_prefix = "   ",
			},
			commands = {
				prompt_prefix = "   ",
			},
			registers = {
				prompt_prefix = "   ",
			},
			spell_suggests = {
				prompt_prefix = "   ",
			},
			keymaps = {
				prompt_prefix = "   ",
			},
			lsp_code_actions = {
				prompt_prefix = "  ",
				theme = "cursor",
			},
			lsp_references = {
				prompt_prefix = "   ",
			},
			lsp_implementations = {
				prompt_prefix = "   ",
			},
			lsp_document_diagnostics = {
				prompt_prefix = "   ",
			},
		},
		extensions = {
			["zf-native"] = {
				file = {
					enable = true,
					highlight_results = true,
					match_filename = true,
				},
				generic = {
					enable = true,
					highlight_results = true,
					match_filename = true,
				},
			},
			fzf = {
				fuzzy = true,
				override_generic_sorter = false,
				override_file_sorter = false,
				case_mode = "smart_case",
			},
			live_grep_args = {
				auto_quoting = false,
			},
			file_browser = {
				dir_icon = "󰉓 ",
				grouped = true,
				initial_mode = "normal",
				hidden = { file_browser = true, folder_browser = true },
			},
			persisted = {
				prompt_prefix = "   ",
				sort_lastused = true,
				layout_config = {
					width = 0.3,
					height = 0.4,
				},
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown({
					layout_strategy = "cursor",
					borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
				}),
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		-- add linenumbers to preview
		vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
	end,
}
