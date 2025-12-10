-- Add new themes here:
--   ["name"] = { repo = "author/plugin", dev = false }
local themes = {
  ["catppuccin"] = { repo = "catppuccin/nvim", dev = false },
  ["tokyonight"] = { repo = "folke/tokyonight.nvim", dev = false },
  ["cyberdream"] = { repo = "scottmckendry/cyberdream.nvim", dev = false },
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
  if pcall(function()
    vim.cmd("colorscheme " .. name)
  end) then
    _G.active_theme = name
    save_last_theme(name)

    -- 🔥 force-run ColorScheme again with the *new* theme value
    vim.api.nvim_exec_autocmds("ColorScheme", {})
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
  local replaced = false

  for _, line in ipairs(lines) do
    if line:match("^%s*theme%s*=") then
      table.insert(new, "theme = " .. name)
      replaced = true
    else
      table.insert(new, line)
    end
  end

  if not replaced then
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
        set_ghostty_theme(name)
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

    -- Use the active theme directly
    local name = _G.active_theme or "auto"
    local theme = "auto"

    local ok, mod = pcall(require, "themes." .. name .. ".lualine-theme")
    if ok and type(mod) == "table" and mod.theme then
      theme = mod.theme
    end

    local cfg = vim.deepcopy(base)
    cfg.options = cfg.options or {}
    cfg.options.theme = theme
    lualine.setup(cfg)
  end,
})

return specs
