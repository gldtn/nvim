-- Shorten `vim.keymap.set` function to `Map`,
local map = require("core.util").map
-- local snacks = require("snacks")

-- ------------------------------------------------
-- [[ Keymaps ]] --
-- ------------------------------------------------

-- Yank bindings
map({ "n", "v" }, "p", '"_dP') -- don't yank on paste selection
map("n", "x", '"_x', { noremap = true }) -- don't yank on single char delete
map("n", "<D-a>", "gg0VG$", { desc = "Select all" })

-- Nvim quit
map("n", "<D-q>", "<cmd>qa<cr>", { desc = "Exit nvim" })
map("n", "<D-r>", "<cmd>cq<cr>", { desc = "Restart nvim" })
map("n", "<leader>q", "<cmd>qa!<cr>", { desc = "Quit without saving" })

-- [[ save file ]]
local save_desc = "Save file"
local save_title = "Save Notification"
local save_msg = "File saved successfully!"
local info_msg = vim.log.levels.INFO

-- Save file
map("n", "<D-s>", function()
    vim.cmd("w")
    vim.notify(save_msg, info_msg, { title = save_title })
end, { desc = save_desc })

-- Save file, exit insert mode
map("i", "<D-s>", function()
    vim.cmd("stopinsert") -- Exit insert mode
    vim.cmd("w")
    vim.notify(save_msg, info_msg, { title = save_title })
end, { desc = save_desc })

-- Save file and exit visual modes (visual, visual-line, visual-block)
map({ "v", "x" }, "<D-s>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
    vim.cmd("w")
    vim.notify(save_msg, info_msg, { title = save_title })
end, { desc = save_desc })

-- Hints
map("n", "<leader>th", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "✨lsp toggle inlay hints" })

-- Identing; stay in indent mode
map("v", "<", "<gv^")
map("v", ">", ">gv^")

-- Open new lines: stay in normal mode
map("n", "O", "O<Esc>^")
map("n", "o", "o<Esc>^")

-- Map `n` to jump to next search result
map("n", "n", "n", { desc = "Next search result" })
map("n", "p", "N", { desc = "Previous search result" })

-- Move Lines
map("n", "<D-S-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<D-S-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<D-S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<D-S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<D-S-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<D-S-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Comments
map("i", "<D-/>", "<C-o>gcc", { remap = true, desc = "Line comment" })
map("i", "<C-p>", "<C-o>gcip", { remap = true, desc = "Paragraph comment" })
map({ "n", "v" }, "<D-/>", "gcc", { remap = true, desc = "Line comment" })
map({ "n", "v" }, "<D-p>", "gcip", { remap = true, desc = "Paragraph comment" })

-- buffers
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Alternate Buffer" })
map("n", "<D-w>", "<cmd>bd<cr>", { desc = "Delete buffer" })
-- map("n", "<M-w>", function()
--     snacks.bufdelete()
-- end, { desc = "Delete buffer" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Track.nvim
map("n", "<c-space>", "<cmd>Track views<cr>", { desc = "List marked files" })
map("n", "<leader>mb", "<cmd>Track branches<cr>", { desc = "Track branches" })
map("n", "<leader>mm", "<cmd>Mark<cr>", { desc = "Mark file" })
map("n", "<leader>mu", "<cmd>Unmark<cr>", { desc = "Unmark file" })

-- Filesystem/Browser
map("n", "-", "<cmd>Neotree toggle right<cr>", { desc = "Toggle file explorer" })
map("n", "\\", "<cmd>Neotree toggle float<cr>", { desc = "Float file explorer" })

-- toggle options
-- snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
-- snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
-- snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
-- snacks.toggle.diagnostics():map("<leader>td")
-- snacks.toggle.line_number():map("<leader>tl")
-- snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>tc")
-- snacks.toggle.treesitter():map("<leader>tT")
-- if vim.lsp.inlay_hint then
--     snacks.toggle.inlay_hints():map("<leader>th")
-- end
-- snacks
--     .toggle({
--         name = "Copilot Completion",
--         get = function()
--             return not require("copilot.client").is_disabled()
--         end,
--         set = function(state)
--             if state then
--                 require("copilot.command").enable()
--             else
--                 require("copilot.command").disable()
--             end
--         end,
--     })
--     :map("<leader>tc")
--
-- -- browse to git repo
-- map("n", "<leader>gb", function()
--     snacks.gitbrowse()
-- end, { desc = "Git Browse" })

-- Terminal/Run... ; thanks @scottmckendry
-- stylua: ignore start
-- map({"n", "t"}, "<C-\\>", function() snacks.terminal() end, { desc = "Toggle Terminal" })
-- map("n", "<leader>gg", function() snacks.lazygit() end, { desc = "Lazygit" })
-- map("n", "<leader>rlf", ":luafile %<cr>", { desc = "Run Current Lua File" })
-- map("n", "<leader>rlt", ":PlenaryBustedFile %<cr>", { desc = "Run Lua Test File" })
-- map("n", "<leader>rss", function() snacks.terminal.toggle(vim.fn.expand("%:p"), { interactive = false }) end, { desc = "Run shell script (bash, powershell, etc)" })
-- map("n", "<leader>rm", function() snacks.terminal.toggle("make", { interactive = false }) end, { desc = "Run make" })
-- map("n", "<leader>rt", function() snacks.terminal.toggle("task", { interactive = false }) end, { desc = "Run task" })
-- stylua: ignore end

-- ------------------------------------------------
-- [[ Tools ]]
-- ------------------------------------------------
map("n", "<C-l><C-l>", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<C-l><C-s>", "<cmd>Lazy sync<cr>", { desc = "Lazy sync" })
map("n", "<C-m><C-m>", "<cmd>Mason<cr>", { desc = "Mason" })
map("n", "<C-g><C-g>", "<cmd>Neogit<cr>", { desc = "Neo-git" })

-- Clear search with <esc>
map("n", "<esc>", ":noh<cr><esc>", { desc = "Escape and clear hlsearch" })
