-- Add new themes here:
--   ["name"] = { repo = "author/plugin", dev = false }
--
-- Note to self;
-- See Theme picker section to set ghostty theme names accordingly.
--
local themes = {
  ["catppuccin"] = { repo = "catppuccin/nvim", dev = false },
  ["tokyonight"] = { repo = "folke/tokyonight.nvim", dev = false },
}

---------------------------------------------------------------------
-- Persistence (Neovim theme only)
---------------------------------------------------------------------
local CACHE_FILE = vim.fn.stdpath("data") .. "/last-theme.txt"

local function load_last_theme()
  local f = io.open(CACHE_FILE, "r")
  if not f then
    return nil
  end
  local name = f:read("*l")
  f:close()
  return (name and themes[name]) and name or nil
end

local function save_last_theme(name)
  local f = io.open(CACHE_FILE, "w")
  if not f then
    return
  end
  f:write(name)
  f:close()
end

local saved_theme = load_last_theme()
_G.active_theme = saved_theme or "catppuccin" -- Fallback/Default theme

---------------------------------------------------------------------
-- Safe colorscheme setter (with persistence)
---------------------------------------------------------------------
local function safe_colorscheme(name)
  if pcall(vim.cmd, "colorscheme " .. name) then
    _G.active_theme = name
    save_last_theme(name)
  else
    vim.notify("Theme '" .. name .. "' not found", vim.log.levels.WARN)
  end
end

---------------------------------------------------------------------
-- Set and reload ghostty terminal theme
---------------------------------------------------------------------
local function set_ghostty_theme(name)
  local path = vim.fn.expand("~/.config/ghostty/config")
  if vim.fn.filereadable(path) == 0 then
    return
  end

  local lines = vim.fn.readfile(path)
  local new = {}
  local found = false

  for _, line in ipairs(lines) do
    if line:match("^%s*theme%s*=") then
      table.insert(new, "theme = " .. name)
      found = true
    else
      table.insert(new, line)
    end
  end

  if not found then
    table.insert(new, "theme = " .. name)
  end

  vim.fn.writefile(new, path)
  vim.fn.system({ "pkill", "-SIGUSR2", "ghostty" })
end

---------------------------------------------------------------------
-- Set lazy.nvim theme specs
---------------------------------------------------------------------
local specs = {}

for name, info in pairs(themes) do
  specs[#specs + 1] = {
    info.repo,
    dev = info.dev,
    lazy = false,
    priority = 1000,
    config = function()
      local ok, mod = pcall(require, "themes." .. name .. "." .. name)
      if ok and type(mod.setup) == "function" then
        mod.setup()
      end

      if _G.active_theme == name then
        safe_colorscheme(name)
      end
    end,
  }
end

---------------------------------------------------------------------
-- Theme picker (updates Neovim + Ghostty)
---------------------------------------------------------------------
vim.keymap.set("n", "<leader>st", function()
  local ok, fzf = pcall(require, "fzf-lua")
  if not ok then
    return
  end

  local list = vim.tbl_keys(themes)

  fzf.fzf_exec(list, {
    prompt = "  ",
    live_preview = true,
    actions = {
      ["default"] = function(sel)
        local name = sel[1]
        if not name or not themes[name] then
          return
        end

        safe_colorscheme(name)

        -- You'll need correct theme names here
        -- From terminal run (ghostty +list-themes)
        if name == "catppuccin" then
          set_ghostty_theme("Catppuccin Mocha")
        elseif name == "tokyonight" then
          set_ghostty_theme("TokyoNight Night")
        end
      end,
    },
    winopts = {
      height = 0.43,
      width = 0.33,
    },
  })
end, { desc = "Switch theme (Neovim + Ghostty)" })

---------------------------------------------------------------------
-- Lualine auto-update on ColorScheme
---------------------------------------------------------------------
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local ok1, lualine = pcall(require, "lualine")
    if not ok1 then
      return
    end

    local ok2, base = pcall(require, "plugins.lualine")
    if not ok2 then
      return
    end

    local name = vim.g.colors_name or ""
    local theme = "auto"

    if name:find("catppuccin") then
      local ok, mod = pcall(require, "themes.catppuccin.lualine-theme")
      theme = ok and mod.theme or "auto"
    elseif name:find("tokyonight") then
      local ok, mod = pcall(require, "themes.tokyonight.lualine-theme")
      theme = ok and mod.theme or "auto"
    end

    local cfg = vim.deepcopy(base)
    cfg.options = cfg.options or {}
    cfg.options.theme = theme
    lualine.setup(cfg)
  end,
})

return specs
