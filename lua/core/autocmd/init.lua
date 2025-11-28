-- Laod all lua files in folder
local dir_files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/core/autocmd/*.lua", true, true)
for _, file in ipairs(dir_files) do
  -- Skip init.lua to prevent recursive loading
  if not file:match("init%.lua$") then
    local module_name = file:match("lua/(.*)%.lua$"):gsub("/", ".")
    require(module_name)
  end
end
