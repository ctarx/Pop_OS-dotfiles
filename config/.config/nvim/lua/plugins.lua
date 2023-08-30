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

local plugin_list = {
  {
    'numToStr/Comment.nvim',
      config = function()
        require("Comment").setup()
      end
  },

  {
    'ellisonleao/gruvbox.nvim',
      priority = 1000,
      config = function()
        vim.cmd("colorscheme gruvbox")
      end
  },

  {
    'akinsho/bufferline.nvim',
      version = "*",
      dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  -- LSP
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    'folke/neodev.nvim',

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
      dependencies = {
        'L3MON4D3/LuaSnip', -- snippet engine
        'saadparwaiz1/cmp_luasnip', -- for autocompletion
        'rafamadriz/friendly-snippets', -- usefull snippets
            
        'hrsh7th/cmp-nvim-lsp',
            
      },
  },

  {
    'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
  },

  {
    'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
  },

  {
    'nvim-tree/nvim-tree.lua',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'nvim-lualine/lualine.nvim',
      dependencies = {
        "nvim-tree/nvim-web-devicons"
      },
      config = function()
        require("lualine").setup({
          icons_enabled = true,
          theme = 'gruvbox',
        })
      end,
  },

   'lukas-reineke/indent-blankline.nvim',
   'norcalli/nvim-colorizer.lua',

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },

  {
    'iamcco/markdown-preview.nvim',
      ft = 'markdown',
      build = function()
        vim.fn['mkdp#util#install']()
      end,
  }

}

local opts = {}

require("lazy").setup(plugin_list, opts)
