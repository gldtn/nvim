return {
	"echasnovski/mini.indentscope",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		symbol = "│",
		options = { try_as_border = true },
	},
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "fzf",
                "help",
                "lazy",
                "alpha",
                "mason",
                "notify",
                "trouble",
                "Trouble",
                "neo-tree",
                "dashboard",
                "snacks_win",
                "toggleterm",
                "snacks_notif",
                "snacks_terminal",
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
}
