return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Auto-completion sources
		"neovim/nvim-lspconfig", -- LSP client for nvim
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"hrsh7th/cmp-cmdline", -- source for the command line
		"hrsh7th/cmp-buffer", -- source for the text in buffer
		"hrsh7th/cmp-path", -- source files system paths

		-- Extra sources
		"ray-x/cmp-treesitter", -- treesitter source for nvim-cmp
		"zbirenbaum/copilot-cmp", -- copilot source for nvim-cmp

		-- Snippets
		"L3MON4D3/LuaSnip", -- snippets engine
		"saadparwaiz1/cmp_luasnip", -- auto-completion of snippets
		"rafamadriz/friendly-snippets", -- collection of snippets

		-- Icons
		"onsails/lspkind-nvim", -- icons for the popup menu
	},

	config = function()
		local cmp = require("cmp")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- require("utils.colorscheme")

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = {
				["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-Backspace>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-Cr>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.close(),
				["<Down>"] = cmp.mapping.close(), -- temp hack to hide overlay
				["<UP>"] = cmp.mapping.close(), -- temp hack to hide overlay
			},
			window = {
				completion = {
					col_offset = -3,
					side_padding = 0,
				},
			},
			sources = cmp.config.sources({
				{ name = "copilot", group_index = 2 },
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "nvim_lua", group_index = 2 },
				{ name = "luasnip", group_index = 2 },
				{ name = "treesitter", group_index = 2 },
				{ name = "cmdline" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				expandable_indicator = true,
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({
						-- mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
						symbol_map = { Copilot = "" },
					})(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"

					return kind
				end,
			},
			-- Setup lspconfig
			require("lspconfig")["zls"].setup({ capabilities = capabilities }),
			require("lspconfig")["phpactor"].setup({ capabilities = capabilities }),
		})
	end,
}
