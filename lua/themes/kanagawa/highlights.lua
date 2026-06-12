local schema = require("themes.hl-schema")

local M = {}

M.custom_hl = function(c)
  local accent = {
    ac1 = c.dragonBlue,
    ac2 = c.dragonTeal,
    ac3 = c.dragonViolet,
  }
  local neutral = {
    nc1 = c.dragonWhite,
    nc2 = c.dragonBlack4,
    nc3 = c.dragonGray3,
  }
  local muted = {
    mc1 = c.dragonGray,
    mc2 = c.dragonGray2,
    mc3 = c.dragonGray3,
    -- not to be used in schema, only for extra highlights
    mc4 = c.dragonBlack4,
    mc5 = c.dragonBlack1,
  }
  local bg = {
    bc1 = c.dragonBlack3,
    bc2 = c.dragonBlack4,
    bc3 = c.dragonBlack1,
  }
  local title = {
    float = { fg = bg.bc1, bg = c.dragonBlue },
    preview = { fg = bg.bc1, bg = c.dragonGreen },
  }

  -- Call schema.get to populate the highlights
  local hl_schema = schema.get(accent, neutral, muted, bg, title)

  -- Define extra highlights
  local hl_extras = {
    -- dashboard
    dashKey1 = { fg = c.dragonBlue },
    dashKey2 = { fg = c.dragonAqua },
    dashKey3 = { fg = c.dragonViolet },
    dashKey4 = { fg = c.dragonGreen },
    dashKey5 = { fg = c.dragonYellow },
    dashKey6 = { fg = c.dragonRed },
    dashIcons = { fg = c.dragonPink },
    DashboardHeader = { fg = c.dragonTeal },

    -- LSP floats hover/signature help
    RenderMarkdownCode = { bg = bg.bc1 },
    LSPFloatBorder = { fg = neutral.nc3, bg = bg.bc1 },

    -- blink.cmp
    BlinkCmpDoc = { bg = bg.bc1 },
    BlinkCmpMenu = { bg = bg.bc1 },
    BlinkCmpDocBorder = { fg = neutral.nc3, bg = bg.bc1 },
    BlinkCmpMenuBorder = { fg = neutral.nc3, bg = bg.bc1 },

    -- overrides
    -- Change the line number column background and foreground
    LineNr = { bg = c.dragonBlack3, fg = c.dragonBlack5 },

    -- Change the sign column (where git signs and diagnostics appear)
    -- SignColumn = { bg = c.dragonBlack2, fg = c.dragonGray3 },

    -- Change the fold column background
    -- FoldColumn = { bg = c.dragonBlack2, fg = c.dragonGray3 },

    -- Change the separator between gutter and code
    -- LineNrAbove = { bg = c.dragonBlack2, fg = c.dragonGray3 },
    -- LineNrBelow = { bg = c.dragonBlack2, fg = c.dragonGray3 },
  }

  -- Merge schema/extra hls
  for k, v in pairs(hl_extras) do
    hl_schema[k] = v
  end

  return hl_schema
end

return M
