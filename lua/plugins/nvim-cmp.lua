return {
	"hrsh7th/nvim-cmp",
	lazy = true,
	event = { "InsertEnter" },
	dependencies = {
		-- Auto-completion sources
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"hrsh7th/cmp-cmdline", -- command-line completion
		"hrsh7th/cmp-buffer", -- source for the text in buffer
		"hrsh7th/cmp-path", -- source files system paths

		-- Extra sources
		"zbirenbaum/copilot-cmp", -- copilot source for nvim-cmp
		"folke/lazydev.nvim", -- workspace libraries

		-- Snippets
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- snippets engine
		"saadparwaiz1/cmp_luasnip", -- auto-completion of snippets

		-- Icons
		"luckasRanarison/tailwind-tools.nvim",
		"onsails/lspkind-nvim", -- icons for the popup menu
	},

	config = function()
		-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
		vim.opt.shortmess:append("c")

		local lspkind = require("lspkind")
		lspkind.init({})

		local cmp = require("cmp")

		cmp.setup({
			window = {
				completion = {
					---@diagnostic disable: assign-type-mismatch
					border = {
						{ "󱐋", "WarningMsg" },
						{ "─", "Comment" },
						{ "╮", "Comment" },
						{ "│", "Comment" },
						{ "╯", "Comment" },
						{ "─", "Comment" },
						{ "╰", "Comment" },
						{ "│", "Comment" },
					},
					scrollbar = false,
				},
				documentation = {
					border = {
						{ "", "DiagnosticHint" },
						{ "─", "Comment" },
						{ "╮", "Comment" },
						{ "│", "Comment" },
						{ "╯", "Comment" },
						{ "─", "Comment" },
						{ "╰", "Comment" },
						{ "│", "Comment" },
					},
					---@diagnostic enable: assign-type-mismatch
					scrollbar = false,
				},
			},
			completion = {
				completeopt = "menu,menuone,preview,noinsert",
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "lazydev" },
				{ name = "copilot" },
				{ name = "cmdline" },
				{ name = "FzfLua" },
				{ name = "buffer" },
				{ name = "path" },
			},
			mapping = {
				["<Esc>"] = cmp.mapping.close(),
				["<C-c>"] = cmp.mapping.close(),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }), { "i", "c" }), -- Stylua: ignore
			},

			-- Enable luasnip to handle snippet expansion for nvim-cmp
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				expandable_indicator = true,
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					-- Apply tailwind-tools formatting first
					vim_item = require("tailwind-tools.cmp").lspkind_format(entry, vim_item)

					-- Apply nvim-highlight-colors formatting
					local color_item = require("nvim-highlight-colors").format(entry, { kind = vim_item })

					-- Then apply your existing lspkind formatting
					local kind = require("lspkind").cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
						show_label_details = true,
						symbol_map = { Copilot = "" },
					})(entry, vim_item)
					if color_item.abbr_hl_group then
						kind.kind_hl_group = color_item.abbr_hl_group
						kind.kind = color_item.abbr
					end

					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"
					return kind
				end,
			},
		})

		-- Setup up vim-dadbod
		cmp.setup.filetype({ "sql" }, {
			sources = {
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})

		local ls = require("luasnip")
		ls.config.set_config({
			history = false,
			updateevents = "TextChanged,TextChangedI",
		})

		-- Load custom snippets
		for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
			loadfile(ft_path)()
		end

		-- Jump forward through the snippet
		vim.keymap.set({ "i", "s" }, "<c-k>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		-- Jump backward through the snippet
		vim.keymap.set({ "i", "s" }, "<c-j>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })
	end,
}
