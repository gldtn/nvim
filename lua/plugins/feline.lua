return {
	"freddiehaddad/feline.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		local feline = require("feline")
		local comp = "ui.feline.components."
		local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

		-- Load components
		local c = {
			spacer = require(comp .. "spacer").spacer,
			vi_mode = require(comp .. "vi_mode"),
			git = require(comp .. "git"),
			diagnostics = require(comp .. "diagnostics"),
			lsp = require(comp .. "lsp").lsp,
			lazy = require(comp .. "lazy").lazy,
			fileinfo = require(comp .. "fileinfo").file_info,
			cursor = require(comp .. "cursor").cursor_position,
			scrollbar = require(comp .. "scrollbar"),
			inactive = require(comp .. "inactive").inactive,
		}

		-- Components structure
		-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "bg", fg = "fg" })
		feline.setup({
			components = {
				active = {
					-- left
					{
						c.vi_mode.vi_mode_icon,
						c.vi_mode.vi_mode,
						c.spacer,
						c.git.git_branch,
						c.spacer,
						c.fileinfo,
						c.spacer,
						c.git.git_add,
						c.git.git_delete,
						c.git.git_change,
						c.spacer,
						c.diagnostics.diagnostic_info,
						c.diagnostics.diagnostic_hints,
						c.diagnostics.diagnostic_errors,
						c.diagnostics.diagnostic_warnings,
					},
					-- middle
					{},
					-- right
					{
						c.lsp,
						c.lazy,
						c.spacer,
						c.cursor,
						c.spacer,
						c.scrollbar.scroll_bar_icon,
						c.scrollbar.scroll_bar_position,
					},
				},
				inactive = {
					{
						c.inactive,
					},
				},
			},
			force_inactive = {
				filetypes = {
					"^qf$",
					"^git$",
					"^help$",
					"^lazy$",
					"^alpha$",
					"^mason$",
					"^packer$",
					"^Neogit*",
					"^trouble$",
					"^lspinfo$",
					"^Outline$",
					"^NvimTree$",
					"^neo%-tree$",
					"^dashboard$",
					"^mini-starter$",
					"^TelescopePrompt$",
				},
				buftypes = { "terminal" },
				bufnames = {},
			},
			theme = colors.theme,
			vi_mode_colors = colors.mode_theme,
		})

		-- reload feline with current theme
		vim.api.nvim_create_autocmd({ "VimEnter", "VimResume", "ColorScheme" }, {
			pattern = { "*" },
			callback = function()
				local theme = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")
				feline.use_theme(theme)
				feline.setup({
					theme = theme.theme,
					vi_mode_colors = theme.mode_theme,
				})
			end,
		})
	end,
}
