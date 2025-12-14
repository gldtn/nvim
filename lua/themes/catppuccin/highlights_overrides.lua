local M = {}

M.get = function(c, neutral, bg)
  return {
    dashKey1 = { fg = c.blue },
    dashKey2 = { fg = c.sky },
    dashKey3 = { fg = c.mauve },
    dashKey4 = { fg = c.green },
    dashKey5 = { fg = c.yellow },
    dashKey6 = { fg = c.red },
    dashIcons = { fg = c.peach },
    DashboardHeader = { fg = c.subtext1 },

    RenderMarkdownCode = { bg = bg.bc1 },
    LSPFloatBorder = { fg = neutral.nc3, bg = bg.bc1 },

    BlinkCmpDoc = { bg = bg.bc1 },
    BlinkCmpMenu = { bg = bg.bc1 },
    BlinkCmpDocBorder = { fg = neutral.nc3, bg = bg.bc1 },
    BlinkCmpMenuBorder = { fg = neutral.nc3, bg = bg.bc1 },
  }
end

return M
