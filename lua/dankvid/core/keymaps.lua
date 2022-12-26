vim.g.mapleader = ";" 
local n_keymap = function(lhs, rhs)
  -- syntax: mode, keys, command
  vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
end
n_keymap("<leader>nh", ":nohl<CR>") -- removes highlights
n_keymap("x", '"_x') -- don't store the value when the x command is called into a buffer

-- change numbers
n_keymap("<leader>+", "<C-a>") -- leader+ will increment a value
n_keymap("<leader>-", "<C-x>") -- leader+ will decrement a value

--split window
n_keymap("<leader>sv", "<C-w>v") --split window vertical
n_keymap("<leader>sh", "<C-w>s") --split window horizontally
n_keymap("<leader>se", "<C-w>=") -- make split windows equal
n_keymap("<leader>sx", ":close<CR>") -- close current split

-- tabs
n_keymap("<leader>to", ":tabnew<CR>") -- open new tab
n_keymap("<leader>tx", ":tabclose<CR>") -- close current tab
n_keymap("<leader>tn", ":tabn<CR>") -- next tab
n_keymap("<leader>tp", ":tabp<CR>") -- previous tab

-- plugin keymaps --
-- vim-maximizer
n_keymap("<leader>sm", ":MaximizerToggle<CR>")
-- nvim-tree
n_keymap("<leader>e", ":NvimTreeToggle<CR>")
-- telescope
n_keymap("<leader>ff", "<cmd>Telescope find_files<CR>")
n_keymap("<leader>fs", "<cmd>Telescope live_grep<CR>")
n_keymap("<leader>fc", "<cmd>Telescope grep_string<CR>")
n_keymap("<leader>fb", "<cmd>Telescope buffers<CR>")
n_keymap("<leader>fh", "<cmd>Telescope help_tags<CR>")
