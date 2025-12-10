local schema = require("themes.highlights-schema")

local M = {}

M.custom_hl = function(c)
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

  -- Call schema.setup to populate the highlights
  local schema_highlights = schema.get_highlights(accent, neutral, primary, title)

  -- Define extra highlights
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

    RenderMarkdownCode = { bg = primary.color1 },
    LSPFloatBorder = { fg = neutral.color3, bg = primary.color1 },
    LazyGitBorder = { fg = neutral.color3, bg = primary.color1 },

    -- background overrides
    NormalFloat = { bg = primary.color1 },
    LazyNormal = { bg = primary.color2 },
    MasonNormal = { bg = primary.color2 },
    NeoTreeNormal = { bg = primary.color2 },
    LazyGitBackdrop = { bg = primary.color1 },
    NeoTreeFloatNormal = { bg = primary.color1 },
    SnacksBackdrop = { bg = primary.color1 },
    SnacksPicker = { bg = primary.color1 },
    SnacksPickerBorder = { fg = primary.color3, bg = primary.color1 },

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
