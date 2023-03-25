--local colorscheme = "tokyonight-night"
local colorscheme = "gruvbox"
vim.o.background = "dark" -- or "light" for light mode

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  return
end
