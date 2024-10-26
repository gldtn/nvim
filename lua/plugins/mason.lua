return {
	"williamboman/mason.nvim",
	dev = true,
	cmd = "Mason",
	keys = { { "<leader>cm", ":Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
				backdrop = 85,
				width = 0.8,
				height = 0.8,
			},
		})

		-- tools (formatters)
		local mason_packages = {
			"jq",
			"pint",
			"shfmt",
			"stylua",
			"prettierd",
			"rustywind",
			"shellcheck",
			"blade-formatter",
		}

		local mr = require("mason-registry")
		local function ensure_installed()
			for _, tool in ipairs(mason_packages) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end

		if mr.refresh then
			mr.refresh(ensure_installed)
		else
			ensure_installed()
		end
	end,
}
