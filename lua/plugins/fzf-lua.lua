return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    dependencies = {
        { "echasnovski/mini.icons", version = false },
        { "junegunn/fzf", build = "./install --bin" },
    },
    -- stylua: ignore
    keys = {
        { "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Files" },
        { "<leader>fw", "<cmd>FzfLua grep_cword<CR>", desc = "Grep Word" },
        { "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Helptags" },
        { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
        { "<leader>fl", "<cmd>FzfLua highlights<CR>", desc = "Highlights" },
        { "<leader>fr", "<cmd>FzfLua oldfiles<CR>", desc = "Old/Recent files" },
        { "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Old/Recent files" },
		{ "<leader><leader>", "<cmd>FzfLua buffers<CR>", desc = "List Buffers" },
        { "<leader>fd", function() require("fzf-lua").files({ cwd = "~/.config" }) end, desc = "Dotfiles" },
        -- live_grep current buffer
        { "<leader>fb", function()
            require("fzf-lua").lgrep_curbuf({
                cmd = "rg --column --line-number --no-heading --color=always --smart-case",
                winopts = {
                    height = 0.3,
                    width = 1,
                    row = vim.o.lines - 2,
                    border = { "▍", " ", " ", " ", " ", " ", "▍", "▍" },
                    fullscreen = false,
                },
            })
        end, desc = "Live Grep Current Buffer" },
    },
    opts = {
        "default-title",
        fzf_colors = true,
        file_icon_padding = "",
        keymap = {
            builtin = {
                ["<C-/>"] = "toggle-help",
                ["<C-f>"] = "toggle-fullscreen",
            },
        },
        winopts = {
            width = 0.90,
            height = 0.80,
            backdrop = 25,
            preview = { horizontal = "right:70%" },
            border = { "▌", " ", " ", " ", " ", " ", "▌", "▌" },
        },
        files = {
            prompt = "   ",
            cwd_prompt = false,
            formatter = "path.filename_first",
        },
        grep = {
            prompt = " 󰱼  ",
            rg_glob = true,
            glob_flag = "--iglob",
            glob_separator = "%s%-%-",
        },
        buffers = {
            prompt = "   ",
            winopts = {
                width = 0.33,
                height = 0.43,
                preview = { hidden = "hidden" },
            },
        },
        lsp = {
            code_actions = {
                prompt = "   ",
                winopts = {
                    numbers = true,
                    relative = "editor",
                    width = 0.6,
                    height = 0.6,
                    preview = {
                        horizontal = "down:75%",
                        vertical = "down:75%",
                    },
                    border = { " ", "━", " ", " ", " ", " ", " ", " " },
                },
            },
        },
        oldfiles = { prompt = "   " },
        helptags = { prompt = "   " },
        manpages = { prompt = "   " },
        highlights = { prompt = "   " },
    },
}
