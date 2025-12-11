local schema = require("themes.highlights-schema")

local M = {}

M.custom_hl = function(c)
  local hl = {}

  local accent = {
    color1 = c.blue,
    color2 = c.cyan,
    color3 = c.magenta,
    color4 = c.orange,
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
    BlinkCmpLabel = { fg = c.fg, bg = "NONE" },

    -- LSP floats hover/signature help
    RenderMarkdownCode = { bg = primary.color1 },
    LSPFloatBorder = { fg = neutral.color3, bg = primary.color1 },

    -- background overrides
    NormalFloat = { bg = primary.color1 },
    LazyNormal = { bg = primary.color2 },
    MasonNormal = { bg = primary.color2 },

    -- snacks
    SnacksIndentScope = { fg = accent.color1 },
    SnacksBackdrop = { bg = primary.color1 },
    SnacksPicker = { bg = primary.color1 },
    SnacksPickerBorder = { fg = primary.color3, bg = primary.color1 },
  }

  -- Merge schema/extra hls
  for k, v in pairs(extra_highlights) do
    hl[k] = v
  end

  return hl
end

return M
