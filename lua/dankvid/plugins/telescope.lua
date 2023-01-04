local status, telescope = pcall(require, "telescope")
if not status then
  return
end


local actions_setup, action = pcall(require, "telescope.setup")
if not actions_setup then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = action.move_selection_previous, -- move to the prev result
        ["<C-j>"] = action.move_selection_next, --move top the next result
        ["<C-q>"] = action.send.send_selection_to_qflist + action.open_qflist -- send selected to quickfixlist
      }
    }
  }
})

telescope.load_extension("fzf")
