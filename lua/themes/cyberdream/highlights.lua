local schema = require("themes.highlights-schema")

local M = {}

M.custom_hl = function(c)
  local hl = {}

  local accent = {
    -- fzf colors
    fzf1 = c.blue,
    fzf2 = c.cyan,
    fzf3 = c.magenta,
    fzf4 = c.orange,
  }
  local neutral = {
    color1 = c.fg,
    color2 = c.grey,
    color3 = c.bg_highlight,
  }
  local primary = {
    color1 = c.bg,
    color2 = c.bg_alt,
    color3 = c.bg_highlight,
    color4 = c.bg_solid,
  }
  local title = {
    float = { fg = primary.color4, bg = c.blue },
    preview = { fg = primary.color4, bg = c.green },
  }

  -- Call schema.setup to populate the highlights
  schema.setup(hl, accent, neutral, primary, title)

  -- Define extra highlights
  local extra_highlights = {
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
    NeoTreeFloatTitle = title.float,
    BlinkCmpLabel = { fg = c.fg, bg = "NONE" },

    -- background overrides
    NormalFloat = { bg = primary.color4 },
    LazyNormal = { bg = primary.color2 },
    MasonNormal = { bg = primary.color2 },
    NeoTreeNormal = { bg = primary.color2 },
    NeoTreeFloatNormal = { bg = primary.color4 },
    SnacksBackdrop = { bg = primary.color1 },
  }

  -- Merge schema/extra hls
  for k, v in pairs(extra_highlights) do
    hl[k] = v
  end

  return hl
end

return M
