local schema = require("themes.hl-schema")

local M = {}

M.custom_hl = function(c)
  local accent = {
    ac1 = c.blue,
    ac2 = c.cyan,
    ac3 = c.magenta,
    -- not to be used in schema, only for extra highlights
    ac4 = c.orange,
  }
  local neutral = {
    nc1 = c.fg,
    nc2 = c.grey,
    nc3 = c.bg_highlight,
  }
  local muted = {
    mc1 = c.bg_alt,
    mc2 = c.bg_highlight,
    mc3 = c.grey,
    -- not to be used in schema, only for extra highlights
    mc4 = c.mantle,
    mc5 = c.crust,
  }
  local bg = {
    bc1 = c.bg,
    bc2 = c.bg_alt,
    bc3 = c.bg_highlight,
    -- not to be used in schema, only for extra highlights
    bc4 = c.bg_solid,
  }
  local title = {
    float = { fg = bg.bc4, bg = c.blue },
    preview = { fg = bg.bc4, bg = c.green },
  }

  -- Call schema.setup to populate the highlights
  local hl_schema = schema.get(accent, neutral, muted, bg, title)

  -- Define extra highlights
  local hl_extras = {
    -- dashboard
    dashKey1 = { fg = c.blue },
    dashKey2 = { fg = c.cyan },
    dashKey3 = { fg = c.magenta },
    dashKey4 = { fg = c.green },
    dashKey5 = { fg = c.yellow },
    dashKey6 = { fg = c.red },
    dashIcons = { fg = c.orange },
    DashboardHeader = { fg = c.grey },

    -- general highlights
    BlinkCmpLabel = { fg = c.fg, bg = "NONE" },

    -- LSP floats hover/signature help
    RenderMarkdownCode = { bg = bg.bc1 },
    LSPFloatBorder = { fg = neutral.nc3, bg = bg.bc1 },
  }

  -- Merge schema/extra hls
  for k, v in pairs(hl_extras) do
    hl_schema[k] = v
  end

  return hl_schema
end

return M
