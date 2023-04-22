local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'ellisonleao/gruvbox.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  'bluz71/vim-nightfly-colors',
  'vim-test/vim-test',
  'lewis6991/gitsigns.nvim',
  'preservim/vimux',
  'christoomey/vim-tmux-navigator',
  'tpope/vim-fugitive',
  'akinsho/bufferline.nvim',
  'numToStr/Comment.nvim',

-- LSP
  'neovim/nvim-lspconfig', --enable LSP
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'glepnir/lspsaga.nvim',

  -- Autocompletion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',

  -- Snippet
  'L3MON4D3/LuaSnip', --snippet engine
  'saadparwaiz1/cmp_luasnip', --snippet completions
  "rafamadriz/friendly-snippets", --snippets collection
  "github/copilot.vim",
  {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {'lukas-reineke/indent-blankline.nvim'},
  {'windwp/nvim-autopairs'},
  {'norcalli/nvim-colorizer.lua'},
}

local opts = {}

require("lazy").setup(plugins, opts)
