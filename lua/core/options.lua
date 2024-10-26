local options = {
	-- General settings

	-- Ident settings
	tabstop = 4, -- Number of spaces that a <tab> uses
	title = true, -- Set the title of the window to the file name
	shiftwidth = 4, -- Number of spaces to use for each step of (auto)ident
	smarttab = true, -- Use shiftwidth for <tab> and <BS> (Normal mode)
	expandtab = true, -- Spaces to inset a <tab> (Insert mode)
	autoindent = true, -- Copy ident from current line
	smartindent = true, -- Smart identing when starting a new line

	-- Line settings
	wrap = false, -- Disable text wrap
	scrolloff = 10, -- Better scrolling
	textwidth = 160, -- Set text width to 1000
	cursorline = true, -- Highlight current line
	formatoptions = "tc", -- Autoformat settings
	number = true, -- Enable line numbers
	relativenumber = true, -- Enable relative numbers

	-- Search settings
	incsearch = true, -- Include search
	hlsearch = true, -- Highlight search
	smartcase = true, -- Smart case search
	ignorecase = true, -- Ignore case search
	inccommand = "split", -- Split search editing

	-- Window split settings
	splitbelow = true, -- Split window below =P
	splitright = true, -- Split window right =P
	splitkeep = "cursor", -- Keep cursor position when splitting

	-- File settings
	encoding = "utf-8", -- Set encoding for the file
	fileencoding = "utf-8", -- Set encoding for the file
	swapfile = false, -- Disable swap files
	backup = false, -- Disable backup files
	undofile = true, -- Enable undo files

	-- Popup menu settings
	pumblend = 0, -- Popup menu blend (transparency)
	winblend = 0, -- Window blend (transparency)
	pumwidth = 35, -- Popup menu width
	pumheight = 25, -- Popup menu height
	menuitems = 30, -- Menu items limit

	-- Misc settings
	mouse = "a", -- Enable mouse mode
	laststatus = 3,
	termguicolors = true, -- Better term colors (24-bit)
	virtualedit = "block", -- Set highlight to block
	clipboard = "unnamedplus", -- Synchronizes the system clipboard
	completeopt = "menuone,noselect", -- Completion options
	fillchars = { eob = " " }, -- Fill character at the end of the buffer
	shell = "zsh", -- Set shell to zsh

	-- Make cursor blink
	guicursor = {
		"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
		"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
		"sm:block-blinkwait175-blinkoff150-blinkon175",
	},
}

-- Loop through & set the options above
for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.scriptencoding = "utf-8" -- Set encoding for scripts
