local colorscheme = "monokai_soda"

local status_ok,_ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("error with colorscheme")
return
end
