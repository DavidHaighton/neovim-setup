local setup, fugitive = pcall(require, "fugitive")
if not setup then
  return
end

fugitive.setup()
