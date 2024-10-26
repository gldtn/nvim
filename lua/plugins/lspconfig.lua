return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "Bilal2453/luvit-meta", lazy = true },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("lspconfig.ui.windows").default_options.border = "rounded"

		-- Diagnostics
		vim.diagnostic.config({
			signs = true,
			underline = true,
			update_in_insert = true,
			virtual_text = {
				source = "if_many",
				prefix = " ● ",
			},
		})

		require("mason-lspconfig").setup({
			-- lsp servers
			ensure_installed = {
				"zls",
				"cssls",
				"lua_ls",
				"jsonls",
				"bashls",
				"yamlls",
				"phpactor",
				"tailwindcss",
				"rust_analyzer",
			},
			automatic_installation = true,
		})

		-- Automatically configure LSP servers
		require("mason-lspconfig").setup_handlers({
			-- Default handler
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,

			-- lua
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					on_init = function(client)
						local path = client.workspace_folders[1].name
						if not vim.uv.fs_stat(path .. "/.luarc.json") and not vim.uv.fs_stat(path .. "/.luarc.jsonc") then
							client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
								Lua = {
									runtime = {
										version = "LuaJIT",
									},
									workspace = {
										checkThirdParty = false,
										library = vim.api.nvim_get_runtime_file("", true),
									},
								},
							})
							client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
						end
						return true
					end,
					on_attach = function(client)
						-- Disable semantic tokens, causing highlight issues
						client.server_capabilities.semanticTokensProvider = nil
					end,
				})
			end,

			-- php
			["phpactor"] = function()
				require("lspconfig").phpactor.setup({
					init_options = {
						["language_server_worse_reflection.inlay_hints.enable"] = true,
						["language_server_worse_reflection.inlay_hints.types"] = true,
					},
				})
			end,

			-- zls
			["zls"] = function()
				require("lspconfig").zls.setup({
					cmd = { "/usr/local/bin/zls" },
					settings = {
						zls = {
							format = {
								enable = true,
							},
						},
					},
				})
			end,
		})
	end,
}
