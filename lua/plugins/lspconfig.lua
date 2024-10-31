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
		-- Define your custom borders
		local custom_border = {
			{ "", "WarningMsg" },
			{ "─", "Comment" },
			{ "╮", "Comment" },
			{ "│", "Comment" },
			{ "╯", "Comment" },
			{ "─", "Comment" },
			{ "╰", "Comment" },
			{ "│", "Comment" },
		}
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = custom_border,
		})
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
			border = custom_border,
		})
		require("lspconfig.ui.windows").default_options = {
			border = "rounded",
		}

		-- Diagnostics settings
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
			ensure_installed = {
				"zls",
				"cssls",
				"taplo",
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

		-- LSP Keymaps on LspAttach Event
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				-- Exit if client is nil
				if not client then
					return
				end

				local opts = { buffer = ev.buf, noremap = true, silent = true }

				-- Key mappings with capability checks
				local mappings = {
					["<leader>cl"] = { ":LspInfo<CR>", "LSP Info" },
					["<leader>cr"] = { vim.lsp.buf.rename, "Rename", capability = client.supports_method("textDocument/rename") },
					["<leader>ca"] = { vim.lsp.buf.code_action, "Code Action", capability = client.supports_method("textDocument/codeAction") },
					["<leader>cd"] = { vim.diagnostic.open_float, "Line Diagnostics" },
					["K"] = { vim.lsp.buf.hover, "Hover", capability = client.supports_method("textDocument/hover") },
					["gD"] = { vim.lsp.buf.declaration, "Goto Declaration", capability = client.supports_method("textDocument/declaration") },
					["<C-k>"] = { vim.lsp.buf.signature_help, "Signature Help", capability = client.supports_method("textDocument/signatureHelp") },
					["gr"] = { ":FzfLua lsp_references<CR>", "Goto References", capability = client.supports_method("textDocument/references") },
					["gI"] = { ":FzfLua lsp_implementations<CR>", "Goto Implementation", capability = client.supports_method("textDocument/implementation") },
					["gd"] = { ":FzfLua lsp_definitions<CR>", "Goto Definition", capability = client.supports_method("textDocument/definition") },
					["gy"] = { ":FzfLua lsp_typedefs<CR>", "Goto Type Definition", capability = client.supports_method("textDocument/typeDefinition") },
				}

				-- Apply mappings with descriptions and capability checks
				for key, value in pairs(mappings) do
					if value.capability == nil or value.capability then
						vim.keymap.set("n", key, value[1], vim.tbl_extend("force", opts, { desc = value[2] }))
					end
				end
			end,
		})
	end,
}
