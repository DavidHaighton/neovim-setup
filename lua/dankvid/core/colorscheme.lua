local status, _ pcall(vim.cmd, "colorscheme nightfly")
if not status and status~=nil then
  print("Colorscheme not found!")
  print(status)
  return
end

