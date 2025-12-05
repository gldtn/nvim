local schema = require("themes.highlights-schema")

local M = {}

M.on_highlights = function(hl, c)
  -- theme colors
  local accent = {
    fzf1 = c.blue,
    fzf2 = c.cyan,
    fzf3 = c.magenta,
  }
  local neutral = {
    color1 = c.fg,
    color2 = c.fg_dark,
    color3 = c.comment,
  }
  local primary = {
    color1 = c.bg,
    color2 = c.bg_dark,
    color3 = c.bg_highlight,
  }
  local title = {
    float = { fg = primary.color1, bg = c.blue },
    preview = { fg = primary.color1, bg = c.green },
  }

  -- Call schema.setup to populate the highlights
  schema.setup(hl, accent, neutral, primary, title)

  -- Define additional custom highlights
  local extra_highlights = {
    -- dashboard
    dashKey1 = { fg = c.blue },
    dashKey2 = { fg = c.cyan },
    dashKey3 = { fg = c.magenta },
    dashKey4 = { fg = c.green },
    dashKey5 = { fg = c.orange },
    dashKey6 = { fg = c.red },
    dashIcons = { fg = c.yellow },
    DashboardHeader = { fg = c.comment },

    -- neotree
    NeoTreeFloatTitle = title.float,

    -- background overrides
    MasonNormal = { bg = primary.color2 },

    -- LSP floats hover/signature help
    RenderMarkdownCode = { bg = primary.color1 },
    NormalFloat = { bg = primary.color1 },
    LSPFloatBorder = { fg = neutral.color3, bg = primary.color1 },
  }

  -- Add extra highlights to the hl table
  for k, v in pairs(extra_highlights) do
    hl[k] = v
  end
end

return M
