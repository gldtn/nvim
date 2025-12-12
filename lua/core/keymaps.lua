-- ------------------------------------------------
-- Keymaps
-- ------------------------------------------------
-- Shorten `vim.keymap.set` function to `Map`,
local map = require("core.utils").map
-- ------------------------------------------------

-- selection
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("n", "<C-b>", "<C-v>", { desc = "Enter Visual Block mode" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Yank bindings
-- map({ "n", "v" }, "p", '"_dP') -- don't yank on paste selection
map("n", "x", '"_x', { noremap = true }) -- don't yank on single char delete

-- Identing; stay in indent mode
map("v", "<", "<gv^")
map("v", ">", ">gv^")

-- Open new lines: stay in normal mode
map("n", "O", "O<Esc>^")
map("n", "o", "o<Esc>^")

-- comments
map("i", "<C-/>", "<C-o>gcc", { desc = "Line comment", remap = true })
map("i", "<C-p>", "<C-o>gcip", { desc = "Paragraph comment", remap = true })
map({ "n", "v" }, "<C-/>", "gcc", { desc = "Line comment", remap = true })
map({ "n", "v" }, "<C-p>", "gcip", { desc = "Paragraph comment", remap = true })

-- Move Lines
map("n", "<C-S-j>", "<cmd>m .+1<cr>==", { desc = "Move line down (n)" })
map("n", "<C-S-k>", "<cmd>m .-2<cr>==", { desc = "Move line up (n)" })
map("i", "<C-S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down (i)" })
map("i", "<C-S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up (i)" })
map("v", "<C-S-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down (v)" })
map("v", "<C-S-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up (v)" })

-- buffers
map("n", "<S-l>", ":bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", ":bprevious<cr>", { desc = "Prev Buffer" })

-- move to window using the <ctrl> <shift> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = false })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = false })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = false })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = false })

map("n", "<leader>cs", ":source %<cr>", { desc = "Source current file" })

-- quit binds
map("n", "qq", "<cmd>qa<cr>", { desc = "Exit nvim" })
map("n", "qr", "<cmd>restart<cr>", { desc = "Restart nvim" })
map("n", "qa", "<cmd>qa!<cr>", { desc = "Quit without saving" })

-- save file; notifications
local save_desc = "Save file"
local save_title = "Save Notification"
local save_msg = "File saved successfully!"
local info_msg = vim.log.levels.INFO

-- save
map("n", "<C-s>", function()
  vim.cmd("w")
  vim.notify(save_msg, info_msg, { title = save_title })
end, { desc = save_desc })

-- exit insert mode, save file
map("i", "<C-s>", function()
  vim.cmd("stopinsert") -- Exit insert mode
  vim.cmd("w")
  vim.notify(save_msg, info_msg, { title = save_title })
end, { desc = save_desc })

-- exit visual modes (visual, visual-line, visual-block), save file
map({ "v", "x" }, "<C-s>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  vim.cmd("w")
  vim.notify(save_msg, info_msg, { title = save_title })
end, { desc = save_desc })
