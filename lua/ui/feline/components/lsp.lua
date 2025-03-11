local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")
local icons = require("ui.feline.icons")
local sep = require("ui.feline.separators")

local component = {}

-- LSP client info component
local function lsp_icon_provider()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    return ""
  end

  local lsp_icons = ""
  for _, client in pairs(clients) do
    local lsp_icon = icons.lsp_icons[client.name] or icons.lsp_icons["default"]
    lsp_icons = lsp_icons .. " " .. lsp_icon
  end

  return lsp_icons
end

component.lsp = {
  provider = lsp_icon_provider,
  icon = icons.comp_icons.lsp,
  hl = {
    fg = "lsp_fg",
    bg = "lsp_bg",
  },
  left_sep = sep.left_separator,
  right_sep = sep.right_separator,
}

return component
