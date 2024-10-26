-- ------------------------------------------------
-- [[ Keymaps Settings ]] --
-- ------------------------------------------------
--  See `:help vim.keymap.set()`

-- Shorten `vim.keymap.set` function to `Map`,
local map = require("core.util").map

-- Leader key, remap to space
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- ------------------------------------------------
-- [[ Keymaps ]] --
-- ------------------------------------------------
-- a good part of these keymaps was stolen from Lazyvim.

-- Yank bindings
map({ "n", "v" }, "p", '"_dP') -- don't yank on paste selection
map("n", "x", '"_x', { noremap = true }) -- don't yank on single char delete
map("n", "<D-a>", "gg0VG$", { desc = "Select all" })

-- Nvim quit
map("n", "<D-q>", "<cmd>qa<cr>", { desc = "Exit nvim" })
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
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Alternate Buffer" })
map("n", "<leader>bq", "<cmd>bd<cr>", { desc = "Close Buffer" })
map("n", "<D-w>", "<cmd>bd<cr>", { desc = "Close Buffer" })

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
-- map("n", "-", "<cmd>Triptych<cr>", { desc = "Browse files" })
map("n", "-", "<cmd>Neotree toggle right<cr>", { desc = "Toggle file explorer" })
map("n", "\\", "<cmd>Neotree toggle float<cr>", { desc = "Float file explorer" })

-- Code/LSP
map("n", "<leader>cl", ":LspInfo<cr>", { desc = "LSP Info" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })
map("n", "gr", ":FzfLua lsp_references<cr>", { desc = "Goto References" })
map("n", "gI", ":FzfLua lsp_implementations<cr>", { desc = "Goto Implementation" })
map("n", "gd", ":fzfLua lsp_definitions<cr>", { desc = "Goto Definition" })
map("n", "gy", ":FzfLua lsp_typedefs<cr>", { desc = "Goto Type Definition" })

-- Keymap to trigger live_grep for the current file only
map("n", "<leader>fg", function()
	require("fzf-lua").lgrep_curbuf({
		cmd = "rg --column --line-number --no-heading --color=always --smart-case", -- Customize with desired rg options
		winopts = {
			height = 0.3, -- 30% of the window height
			width = 1, -- full window width
			row = vim.o.lines - 2, -- position near the bottom of the window
			border = { "▍", " ", " ", " ", " ", " ", "▍", "▍" },
			fullscreen = false, -- Do not open fullscreen
			-- preview = {
			--           horizontal = "right:50%",  -- Adjust the preview size
			-- },
		},
	})
end, { desc = "Fzf-lua live grep for current buffer" })

-- ------------------------------------------------
-- [[ Tools ]]
-- ------------------------------------------------
map("n", "<C-k><C-l>", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<C-k><C-s>", "<cmd>Lazy sync<cr>", { desc = "Lazy sync" })
map("n", "<C-k><C-m>", "<cmd>Mason<cr>", { desc = "Mason" })
map("n", "<C-g><C-g>", "<cmd>Neogit<cr>", { desc = "Neo-git" })

-- Clear search with <esc>
map("n", "<esc>", ":noh<cr><esc>", { desc = "Escape and clear hlsearch" })

local themes = {
	{
		name = "rose-pine",
		setup = function()
			require("themes.rose-pine.rose-pine").setup()
		end,
	},
	{
		name = "cyberdream",
		setup = function()
			require("themes.cyberdream.cyberdream").setup()
		end,
	},
	{
		name = "catppuccin",
		setup = function()
			require("themes.catppuccin.catppuccin").setup()
		end,
	},
}
