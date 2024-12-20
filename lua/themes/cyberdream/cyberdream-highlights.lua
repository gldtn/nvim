local schema = require("themes.highlights-schema")

local M = {}

M.setup = function(c)
  -- theme colors
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
    color3 = c.bgHighlight,
  }
  local primary = {
    color1 = c.bg,
    color2 = c.bgAlt,
    color3 = c.bgHighlight,
  }
  local title = {
    float = { fg = primary.color1, bg = c.blue },
    preview = { fg = primary.color1, bg = c.green },
  }

  local schema_highlights = schema.get_highlights(accent, neutral, primary, title)
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
    -- NeogitFloatHeader = { fg = c.fg, bg = c.red },

    -- background overrides
    -- Normal = { fg = c.fg, bg = "NONE" },
    NormalFloat = { bg = primary.color1 },
    LazyNormal = { bg = primary.color2 },
    MasonNormal = { bg = primary.color2 },
    NeoTreeNormal = { bg = primary.color2 },
    NeoTreeFloatNormal = { bg = primary.color1 },

    -- treesitter
    ["@Constant"] = { fg = c.pink, italic = true }, -- string, number, boolean, this, super
    ["@boolean"] = { fg = c.orange, italic = true }, -- boolean
    ["@keyword"] = { fg = c.orange, italic = true }, -- import, export, return...
    ["@property"] = { fg = c.fg, italic = false }, -- variables property
    ["@variable"] = { fg = c.green, italic = false }, -- variables values
    ["@StorageClass"] = { fg = c.purple, italic = true }, -- class keyword
    ["@keyword.repeat"] = { fg = c.orange, italic = true }, --keep?
    ["@keyword.function"] = { fg = c.orange, italic = true }, -- function()
    ["@keyword.conditional"] = { fg = c.orange, italic = true }, --keep?
  }
  -- Merge schema/extra hls
  for k, v in pairs(extra_highlights) do
    schema_highlights[k] = v
  end

  return schema_highlights
end

return M
