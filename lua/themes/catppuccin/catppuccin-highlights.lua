local schema = require("themes.highlights-schema")

local M = {}

M.setup = function(c)
  local accent = {
    -- fzf colors
    fzf1 = c.blue,
    fzf2 = c.sky,
    fzf3 = c.mauve,
  }
  local neutral = {
    color1 = c.text,
    color2 = c.overlay2,
    color3 = c.surface2,
  }
  local primary = {
    color1 = c.base,
    color2 = c.mantle,
    color3 = c.surface0,
    color4 = c.crust,
  }
  local title = {
    float = { fg = primary.color1, bg = c.blue },
    preview = { fg = primary.color1, bg = c.green },
  }

  local schema_highlights = schema.get_highlights(accent, neutral, primary, title)
  local extra_highlights = {
    -- dashboard
    dashKey1 = { fg = c.blue },
    dashKey2 = { fg = c.sky },
    dashKey3 = { fg = c.mauve },
    dashKey4 = { fg = c.green },
    dashKey5 = { fg = c.yellow },
    dashKey6 = { fg = c.red },
    dashIcons = { fg = c.peach },
    DashboardHeader = { fg = c.subtext1 },

    -- background overrides
    NormalFloat = { bg = primary.color1 },
    LazyNormal = { bg = primary.color2 },
    MasonNormal = { bg = primary.color2 },
    NeoTreeNormal = { bg = primary.color2 },
    NeoTreeFloatNormal = { bg = primary.color1 },
    SnacksBackdrop = { fg = primary.color1, bg = primary.color1 },

    -- blink.cmp
    BlinkCmpDoc = { bg = primary.color1 },
    BlinkCmpMenu = { bg = primary.color1 },
    BlinkCmpDocBorder = { fg = neutral.color3, bg = primary.color1 },
    BlinkCmpMenuBorder = { fg = neutral.color3, bg = primary.color1 },
  }

  -- Merge schema/extra hls
  for k, v in pairs(extra_highlights) do
    schema_highlights[k] = v
  end

  return schema_highlights
end

return M
