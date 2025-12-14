local schema = require("themes.hl-schema")

local M = {}

M.custom_hl = function(c)
  local accent = {
    ac1 = c.blue,
    ac2 = c.sky,
    ac3 = c.mauve,
  }
  local neutral = {
    nc1 = c.text,
    nc2 = c.overlay2,
    nc3 = c.surface2,
  }
  local muted = {
    mc1 = c.surface0,
    mc2 = c.surface1,
    mc3 = c.surface2,
    -- not to be used in schema, only for extra highlights
    mc4 = c.mantle,
    mc5 = c.crust,
  }
  local bg = {
    bc1 = c.base,
    bc2 = c.mantle,
    bc3 = c.crust,
  }
  local title = {
    float = { fg = bg.bc1, bg = c.blue },
    preview = { fg = bg.bc1, bg = c.green },
  }

  -- Call schema.get to populate the highlights
  local hl_schema = schema.get(accent, neutral, muted, bg, title)

  -- Define extra highlights
  local hl_extras = {
    -- dashboard
    dashKey1 = { fg = c.blue },
    dashKey2 = { fg = c.sky },
    dashKey3 = { fg = c.mauve },
    dashKey4 = { fg = c.green },
    dashKey5 = { fg = c.yellow },
    dashKey6 = { fg = c.red },
    dashIcons = { fg = c.peach },
    DashboardHeader = { fg = c.subtext1 },

    -- LSP floats hover/signature help
    RenderMarkdownCode = { bg = bg.bc1 },
    LSPFloatBorder = { fg = neutral.nc3, bg = bg.bc1 },

    -- blink.cmp
    BlinkCmpDoc = { bg = bg.bc1 },
    BlinkCmpMenu = { bg = bg.bc1 },
    BlinkCmpDocBorder = { fg = neutral.nc3, bg = bg.bc1 },
    BlinkCmpMenuBorder = { fg = neutral.nc3, bg = bg.bc1 },
  }

  -- Merge schema/extra hls
  for k, v in pairs(hl_extras) do
    hl_schema[k] = v
  end

  return hl_schema
end

return M
