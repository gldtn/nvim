local schema = require("themes.highlights-schema")

local M = {}

M.custom_hl = function(hl, c)
  local accent = {
    ac1 = c.blue,
    ac2 = c.cyan,
    ac3 = c.magenta,
  }
  local neutral = {
    nc1 = c.fg,
    nc2 = c.fg_dark,
    nc3 = c.comment,
  }
  local muted = {
    mc1 = c.bg_float,
    mc2 = c.bg_highlight,
    mc3 = c.terminal_black,
  }
  local bg = {
    bc1 = c.bg,
    bc2 = c.bg_dark,
    bc3 = c.bg_highlight,
  }
  local title = {
    float = { fg = bg.bc1, bg = c.blue },
    preview = { fg = bg.bc1, bg = c.green },
  }

  -- Call schema.setup to populate the highlights
  schema.setup(hl, accent, neutral, muted, bg, title)

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
    DashboardHeader = { fg = c.comment },

    -- LSP floats hover/signature help
    RenderMarkdownCode = { bg = bg.bc1 },
    LSPFloatBorder = { fg = neutral.nc3, bg = bg.bc1 },
  }

  -- Merge schema/extra hls
  for k, v in pairs(extra_highlights) do
    hl[k] = v
  end
end

return M
