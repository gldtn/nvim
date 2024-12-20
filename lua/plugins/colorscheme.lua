-- Define themes and their repositories
local themes = {
  ["rose-pine"] = { repo = "rose-pine/neovim", dev = false },
  ["catppuccin"] = { repo = "catppuccin/nvim", dev = false },
  ["tokyonight"] = { repo = "folke/tokyonight.nvim", dev = false },
  ["cyberdream"] = { repo = "scottmckendry/cyberdream.nvim", dev = false },
}

-- Path to store the active theme for persistence
local theme_file = vim.fn.stdpath("config") .. "/active_theme.txt"

-- Load the saved theme
local function load_saved_theme()
  if vim.fn.filereadable(theme_file) == 1 then
    local saved_theme = vim.fn.readfile(theme_file)[1]
    if themes[saved_theme] then
      _G.active_theme = saved_theme
      return saved_theme
    end
  end
  return "" -- Default theme
end

-- Save the active theme
local function save_theme(theme)
  vim.fn.writefile({ theme }, theme_file)
end

-- Set the active theme
_G.active_theme = load_saved_theme()

-- Switch Kitty theme using the `kt` script
local function switch_kitty_theme(theme)
  local kitty_script = os.getenv("XDG_CONFIG_HOME") .. "/kitty/toggle-kitty-theme.py"
  os.execute("python3 " .. kitty_script .. " " .. theme)
end

-- Switch themes using fzf-lua
local function switch_theme()
  local theme_list = {}

  for name, _ in pairs(themes) do
    table.insert(theme_list, name)
  end

  require("fzf-lua").fzf_exec(theme_list, {
    prompt = "   ",
    actions = {
      ["default"] = function(selected)
        local new_theme = selected[1]
        if themes[new_theme] then
          _G.active_theme = new_theme
          save_theme(new_theme)
          vim.cmd("colorscheme " .. new_theme)
          switch_kitty_theme(new_theme)
          vim.notify("Theme switched to: " .. new_theme, vim.log.levels.INFO, { title = "Theme Switcher" })
        end
      end,
    },
    winopts = {
      height = 0.43,
      width = 0.33,
    },
  })
end

vim.keymap.set("n", "<C-k><C-t>", switch_theme, { desc = "Switch Theme" })

-- Configure the themes for Lazy.nvim
local specs = {}
for name, url in pairs(themes) do
  specs[#specs + 1] = {
    url.repo,
    dev = url.dev,
    lazy = false,
    priority = 1000,
    config = function()
      require("themes." .. name .. "." .. name).setup()
      vim.cmd("colorscheme " .. _G.active_theme)
    end,
  }
end

return specs
