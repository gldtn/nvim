local comp_icons = {
	branch = " ",
	position = "",
	scrollbar = "",
	lsp = " ",
}

local mode_icons = {
	n = " ", -- normal
	i = " ", -- insert
	ic = " ", -- insert
	R = " ", -- replace
	v = " ", -- visual
	V = " ", -- v-line
	c = " ", -- command
	s = "󰫙 ", -- select
	S = "󰫙 ", -- s-line
	t = " ", -- terminal
	nt = " ", -- terminal
	["\22"] = "󰫙 ", -- v-block
	["\19"] = "󰫙 ", -- s-block
}

local lsp_icons = {
	["zls"] = " ",
	["html"] = " ",
	["gopls"] = " ",
	["cssls"] = " ",
	["taplo"] = " ",
	["jsonls"] = " ",
	["clangd"] = "󰙱 ",
	["lua_ls"] = " ",
	["bashls"] = " ",
	["default"] = " ",
	["pyright"] = " ",
	["copilot"] = " ",
	["phpactor"] = " ",
	["tailwindcss"] = "󱏿 ",
	["intelephense"] = " ",
	["rust_analyzer"] = " ",
}

return {
	comp_icons = comp_icons,
	mode_icons = mode_icons,
	lsp_icons = lsp_icons,
}
