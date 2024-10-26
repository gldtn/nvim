return {
  "tamton-aquib/staline.nvim",
  -- event = "VeryLazy",
  priority = 100,
  enabled = false,
  config = function()
    local p = require("rose-pine.palette")

    local unicodes = {
      n = "",
      i = " ",
      c = " ",
      R = " ",
      v = " ",
      V = " ",
      ["\22"] = " "
    }
    local sep_icons = {
      slant = { left = " ", right = " " },
      round = { left = " ", right = " " },
      block = { left = " █", right = "█ " },
      arrow = { left = " ", right = " " },
    }

    require("staline").setup({
      sections = {
        left = {
          { 'GoldIconSep', 'left_sep' },
          { 'GoldIcon',    'mode' },
          { 'GoldIconSep', 'right_sep' },

          -- { 'FoamIconSep', 'left_sep' },
          -- { 'FoamIcon', ' ' },
          -- { 'Foam', 'branch' },
          -- { 'DefaultSep', 'right_sep' },

          { 'FoamIconSep', 'left_sep' },
          { 'FoamIcon',    'f_icon' }, { 'FoamIcon', ' ' },
          { 'Foam',       ' ' }, { 'Foam', 'f_name' },
          { 'Gold',       'f_modified' },
          { 'DefaultSep', 'right_sep' },

          'branch',

          'diagnostics', ' ',
        },
        mid = {},
        right = {
          'lsp_name', ' ',

          { 'RoseIconSep', 'left_sep' },
          { 'RoseIcon', ' ' },
          { 'Rose', ' %l:%L' },
          { 'DefaultSep', 'right_sep' },

          { 'IrisIconSep', 'left_sep' },
          { 'IrisIcon', ' ' },
          { 'Iris', ' %p%%' },
          { 'DefaultSep', 'right_sep' },
        }
      },
      mode_icons = unicodes,
      mode_colors = {
        n = p.subtle,
        i = p.love,
        c = p.foam,
        R = p.love,
        v = p.rose,
        V = p.rose,
        ["\22"] = p.rose,
      },
      defaults = {
        bg = p.base,
        full_path = true,
        true_colors = true,
        left_separator = sep_icons.round.left,
        right_separator = sep_icons.round.right,
        line_column = "%l:%L",
        branch_symbol = " ",
        lsp_client_symbol = " ",
      },
      lsp_symbols = {
        Error = "  ",
        Info  = "  ",
        Warn  = "  ",
        Hint  = "  "
      },
      special_table = {
        lazy         = { 'Lazy', '󰒲  ' },
        ["neo-tree"] = { 'Neotree', ' ' },
        mason        = { 'Mason', ' ' },
        NeogitStatus = { 'Neogit', '󰊢  ' },
        toggleterm   = { 'Terminal', "  " }
      },
    })
    -- set highlights
    local function set_hl(group, fg, bg)
      vim.cmd("hi " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
    end

    -- set default icon fg
    local function set_icon_hl(icon, bg)
      set_hl(icon, p.overlay, bg)
    end
    -- set icon bg
    set_icon_hl("GoldIcon", p.gold)
    set_icon_hl("LoveIcon", p.love)
    set_icon_hl("RoseIcon", p.rose)
    set_icon_hl("FoamIcon", p.foam)
    set_icon_hl("IrisIcon", p.iris)

    -- set colored icons sep. bg
    local function set_iconsep_hl(iconsep, fg)
      set_hl(iconsep, fg, p.base)
    end
    -- set colored icons sep. fg
    set_iconsep_hl("GoldIconSep", p.gold)
    set_iconsep_hl("LoveIconSep", p.love)
    set_iconsep_hl("RoseIconSep", p.rose)
    set_iconsep_hl("FoamIconSep", p.foam)
    set_iconsep_hl("IrisIconSep", p.iris)

    -- set colored components fg
    local function set_color_hl(color, fg)
      set_hl(color, fg, p.overlay)
    end
    -- set colors
    set_color_hl("Gold", p.gold)
    set_color_hl("Love", p.love)
    set_color_hl("Rose", p.rose)
    set_color_hl("Foam", p.foam)
    set_color_hl("Iris", p.iris)
    -- default sep
    set_hl("DefaultSep", p.overlay, p.base)
  end,
}
