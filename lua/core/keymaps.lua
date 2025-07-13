-- Shorten `vim.keymap.set` function to `Map`,
local map = require("core.util").map
-- local snacks = require("snacks")

-- ------------------------------------------------
-- [[ Keymaps ]] --
-- ------------------------------------------------

-- Yank bindings
map({ "n", "v" }, "p", '"_dP') -- don't yank on paste selection
map("n", "x", '"_x', { noremap = true }) -- don't yank on single char delete
map("n", "<C-a>", "gg1VG$", { desc = "Select all" })

-- Nvim quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Exit nvim" })
map("n", "<leader>qr", "<cmd>cq<cr>", { desc = "Restart nvim" })
map("n", "<leader>qa", "<cmd>qa!<cr>", { desc = "Quit without saving" })

-- [[ save file ]]
local save_desc = "Save file"
local save_title = "Save Notification"
local save_msg = "File saved successfully!"
local info_msg = vim.log.levels.INFO

-- Save file
map("n", "<C-s>", function()
  vim.cmd("w")
  vim.notify(save_msg, info_msg, { title = save_title })
end, { desc = save_desc })

-- Save file, exit insert mode
map("i", "<C-s>", function()
  vim.cmd("stopinsert") -- Exit insert mode
  vim.cmd("w")
  vim.notify(save_msg, info_msg, { title = save_title })
end, { desc = save_desc })

-- Save file and exit visual modes (visual, visual-line, visual-block)
map({ "v", "x" }, "<C-s>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  vim.cmd("w")
  vim.notify(save_msg, info_msg, { title = save_title })
end, { desc = save_desc })

-- Hints
map("n", "<leader>Th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "LSP [t]oggle inlay [h]ints" })

-- Identing; stay in indent mode
map("v", "<", "<gv^")
map("v", ">", ">gv^")

-- Open new lines: stay in normal mode
map("n", "O", "O<Esc>^")
map("n", "o", "o<Esc>^")

-- Map `n` to jump to next search result
map("n", "<C-n>", "n", { desc = "Next search result" })
map("n", "<C-p>", "N", { desc = "Previous search result" })

-- Move Lines
map("n", "<C-D-j>", "<cmd>m .+1<cr>==", { desc = "Move line down (n)" })
map("n", "<C-D-k>", "<cmd>m .-2<cr>==", { desc = "Move line up (n)" })
map("i", "<C-D-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down (i)" })
map("i", "<C-D-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up (i)" })
map("v", "<C-D-j>", ":m '>+1<cr>gv=gv", { desc = "Move line down (v)" })
map("v", "<C-D-k>", ":m '<-2<cr>gv=gv", { desc = "Move line up (v)" })

-- Comments
map("i", "<C-/>", "<C-o>gcc", { remap = true, desc = "Line comment" })
map("i", "<C-p>", "<C-o>gcip", { remap = true, desc = "Paragraph comment" })
map({ "n", "v" }, "<C-/>", "gcc", { remap = true, desc = "Line comment" })
map({ "n", "v" }, "<C-p>", "gcip", { remap = true, desc = "Paragraph comment" })

-- buffers
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Alternate Buffer" })
map("n", "<leader>w", "<cmd>bd<cr>", { desc = "Delete buffer" })
-- map("n", "<M-w>", function()
--     snacks.bufdelete()
-- end, { desc = "Delete buffer" })

-- Move to window using the <ctrl> <shift> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> <shift> arrow keys
map("n", "<C-M-Up>", "<cmd>resize +12<cr>", { desc = "Increase Window Height" })
map("n", "<C-M-Down>", "<cmd>resize -12<cr>", { desc = "Decrease Window Height" })
map("n", "<C-M-Left>", "<cmd>vertical resize 12<cr>", { desc = "Decrease Window Width" })
map("n", "<C-M-Right>", "<cmd>vertical resize +12<cr>", { desc = "Increase Window Width" })

-- Track.nvim
map("n", "<c-space>", "<cmd>Track views<cr>", { desc = "List marked files" })
map("n", "<leader>mb", "<cmd>Track branches<cr>", { desc = "Track branches" })
map("n", "<leader>mm", "<cmd>Mark<cr>", { desc = "Mark file" })
map("n", "<leader>mu", "<cmd>Unmark<cr>", { desc = "Unmark file" })

-- Filesystem/Browser
map("n", "<leader><leader>", "<cmd>Neotree toggle float<cr>", { desc = "Float file explorer" })

map("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source file" })

-- Quickfix
map("n", "<M-n>", "<cmd>cnext<CR>", { desc = "Next quickfix" })
map("n", "<M-p>", "<cmd>cprev<CR>", { desc = "Previous quickfix" })

-- ------------------------------------------------
-- [[ Tools ]]
-- ------------------------------------------------
map("n", "<leader>tl", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>tm", "<cmd>Mason<cr>", { desc = "Mason" })
map("n", "<leader>tg", "<cmd>Neogit<cr>", { desc = "Neo-git" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
