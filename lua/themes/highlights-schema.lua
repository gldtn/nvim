local M = {}

M.get_highlights = function(accent, neutral, muted, bg, title)
  -- backdrop blend level
  local blend = 6

  return {
    -- float titles
    FloatTitle = title.float,
    PreviewTitle = title.preview,

    -- float background overrides
    NormalFloat = { bg = bg.bc2 },
    LazyNormal = { bg = bg.bc2 },
    MasonNormal = { bg = bg.bc2 },
    SnacksNormal = { bg = bg.bc1 },
    FloatBorder = { fg = bg.bc2, bg = bg.bc2 }, -- for borderless floats

    -- float backdrops
    LazyBackdrop = { bg = bg.bc1, blend = blend },
    MasonBackdrop = { bg = bg.bc1, blend = blend },
    FzfLuaBackdrop = { bg = bg.bc1, blend = blend },
    SnacksBackdrop = { bg = bg.bc1 }, -- see snacks config for blend

    -- fzf-lua titles
    SnacksPickerTitle = { link = "FloatTitle" },
    SnacksPickerPreviewTitle = { link = "PreviewTitle" },

    -- snacks pickers
    SnacksPicker = { bg = bg.bc1 },
    SnacksPickerBorder = { fg = muted.mc1, bg = bg.bc1 },

    -- snacks ident-scope
    SnacksIndent = { fg = muted.mc1 },
    SnacksIndentScope = { fg = muted.mc2 },

    -- fzf-lua titles
    FzfLuaTitle = { link = "FloatTitle" },
    FzfLuaPreviewTitle = { link = "PreviewTitle" },

    -- fzf-lua headers
    FzfLuaHeaderBind = { fg = accent.ac3 },
    FzfLuaFzfHeader = { fg = neutral.nc3 },
    FzfLuaHeaderText = { fg = neutral.nc3 },

    -- fzf-lua prompt details
    FzfLuaFzfQuery = { fg = neutral.nc1 },

    -- fzf-lua builtin preview scrollbar
    FzfLuaScrollFloatFull = { bg = muted.mc1 }, -- builtin preview (scrollbar)
    FzfLuaScrollFloatEmpty = { bg = bg.bc1 }, -- builtin preview (scrollbar bg)

    -- fzf-lua results
    FzfLuaMarker = { fg = accent.ac1 },
    FzfLuaFzfMatch = { fg = accent.ac1 },
    FzfLuaFzfPointer = { fg = muted.mc1 },

    -- fzf-lua backgrounds
    FzfLuaNormal = { fg = neutral.nc1, bg = bg.bc2 },
    FzfLuaFzfPrompt = { fg = accent.ac1, bg = bg.bc2 },
    FzfLuaPreviewNormal = { fg = neutral.nc1, bg = bg.bc2 },

    -- fzf-lua borders
    FzfLuaBorder = { fg = bg.bc2, bg = bg.bc2 },
    FzfLuaFzfBorder = { fg = neutral.nc3, bg = bg.bc2 },
    FzfLuaFzfSeparator = { fg = neutral.nc3, bg = bg.bc2 }, -- prompt separator
    FzfLuaPreviewBorder = { fg = bg.bc1, bg = bg.bc2 }, -- preview separator

    -- telescope titles
    TelescopeTitle = { fg = accent.ac1 },
    TelescopePromptTitle = { link = "FloatTitle" },
    TelescopePreviewTitle = { link = "PreviewTitle" },

    -- telescope prompt details
    TelescopePromptPrefix = { fg = accent.ac1 },
    TelescopePromptCounter = { fg = accent.ac2 },

    -- telescope prompt behaviors
    TelescopeMatching = { fg = accent.ac2 },
    TelescopeSelection = { fg = neutral.nc1, bg = muted.mc1 },
    TelescopeMultiSelection = { fg = accent.ac1, bg = muted.mc1 },

    -- telescope backgrounds
    TelescopeNormal = { fg = neutral.nc1, bg = bg.bc2 },
    TelescopePromptNormal = { fg = neutral.nc1, bg = muted.mc1 },

    -- telescope borders
    TelescopeBorder = { fg = bg.bc2, bg = bg.bc2 },
    TelescopePromptBorder = { fg = muted.mc1, bg = muted.mc1 },
    TelescopePreviewBorder = { fg = bg.bc1, bg = bg.bc2 },

    -- whichkey
    WhichKeyTitle = { link = "Comment" },
    WhichKeyBorder = { link = "Comment" },
  }
end

M.setup = function(hl, accent, neutral, primary, muted, title)
  -- Set the highlights using hl
  local highlights = M.get_highlights(accent, neutral, primary, muted, title)

  -- Apply the highlights to hl (the highlight table provided by tokyonight)
  for group, settings in pairs(highlights) do
    hl[group] = settings
  end
end

return M
