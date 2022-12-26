local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save a file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end


return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- install packer (plugin manager)
  use('nvim-lua/plenary.nvim') --lots of plugins rely on this
  use("bluz71/vim-nightfly-guicolors") -- colorscheme
  use("christoomey/vim-tmux-navigator") -- allow for better pane navigation for tmux and vim
  use("szw/vim-maximizer") -- maximizes a pane in vim
  use("nvim-tree/nvim-tree.lua") -- file tree
  use("kyazdani42/nvim-web-devicons") -- icons for tree
  use("nvim-lualine/lualine.nvim") -- statusline
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- fuzzy finder
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x"})
  -- autocompletion
  use("hrsh7th/nvim-cmp") -- autocompletion 
  use("hrsh7th/cmp-buffer") -- can use current file for auto completion
  use("hrsh7th/cmp-path") -- can autocomplete paths
  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- allows autocomplete to access snippets
  use("rafamadriz/friendly-snippets") -- commonly used snippets
  -- lsp
  use("williamboman/mason.nvim") -- managing and installing LSP servers
  use("williamboman/mason-lspconfig.nvim") -- bridge between configuring LSP and managing LSP
  use("neovim/nvim-lspconfig") --configuring LSP servers
  -- configuring LSP servers
  use("hrsh7th/cmp-nvim-lsp") -- allows LSP to show up in autocomplete
  use({"glepnir/lspsaga.nvim", branch="main" }) -- enhanced UIs
  use("onsails/lspkind.nvim")
  -- formatting and linting
  use("jose-elias-alvarez/null-ls.nvim") -- configures formatters and linters
  use("jayp0521/mason-null-ls.nvim") -- integration with mason
  -- tree sitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  --auto closing
  use("windwp/nvim-autopairs") --closes brackets and stuff
  --git
  use("lewis6991/gitsigns.nvim") -- shows what changed in a file since commit
  use("tpope/vim-fugitive")
  if packer_bootstrap then
    require("packer").sync()
  end
end)

