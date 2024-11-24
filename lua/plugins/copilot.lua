return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            "zbirenbaum/copilot.lua",
            lazy = true,
            cmd = "Copilot",
            event = "InsertEnter",
            opts = {
                panel = { enabled = false },
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = "<C-S-y>",
                        accept_word = "<C-w>",
                        accept_line = "<C-l>",
                        next = "<C-j>",
                        prev = "<C-k>",
                        dismiss = "<ESC>",
                    },
                },
            },
        },
    },
    build = "make tiktoken",
    config = function()
        local chat = require("CopilotChat")
        local actions = require("CopilotChat.actions")
        local fzflua = require("CopilotChat.integrations.fzflua")

        -- Setup CopilotChat
        chat.setup({
            debug = false,
            model = "cpt-4o",
            allow_insecure = true,
            question_header = "  gldtn: ",
            answer_header = "  Copilot: ",
            error_header = "  Error: ",
            prompts = {
                Explain = {
                    mapping = "<leader>ae",
                    description = "AI Explain",
                },
                Review = {
                    mapping = "<leader>ar",
                    description = "AI Review",
                },
                Tests = {
                    mapping = "<leader>at",
                    description = "AI Tests",
                },
                Fix = {
                    mapping = "<leader>af",
                    description = "AI Fix",
                },
                Optimize = {
                    mapping = "<leader>ao",
                    description = "AI Optimize",
                },
                Docs = {
                    mapping = "<leader>ad",
                    description = "AI Documentation",
                },
                CommitStaged = {
                    mapping = "<leader>ac",
                    description = "AI Generate Commit",
                },
            },
        })

        -- Keymaps
        vim.keymap.set({ "n", "v" }, "<leader>aa", chat.toggle, { desc = "AI Toggle" })
        vim.keymap.set({ "n", "v" }, "<leader>ax", chat.reset, { desc = "AI Reset" })
        vim.keymap.set({ "n", "v" }, "<leader>as", chat.stop, { desc = "AI Stop" })

        -- prompt/help actions
        vim.keymap.set({ "n", "v" }, "<leader>ah", function()
            fzflua.pick(actions.help_actions())
        end, { desc = "AI Help Actions" })
        vim.keymap.set({ "n", "v" }, "<leader>ap", function()
            fzflua.pick(actions.prompt_actions())
        end, { desc = "AI Prompt Actions" })
    end,
}
