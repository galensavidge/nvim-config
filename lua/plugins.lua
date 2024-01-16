-- Bootstrap lazy.nvim if it is not installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require('lazy').setup({
  { -- Neon
    'rafamadriz/neon',
    priority = 100,
  },
  { -- Lualine
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { -- Indent-blankline
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  { -- Telescope
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  { -- Persisted
    'olimorris/persisted.nvim',
    config = true,
    priority = 90,
  },
  { -- Cutlass
    'svermeulen/vim-cutlass',
  },
  { -- Neoclip
    'AckslD/nvim-neoclip.lua',
    config = function()
        require('neoclip').setup()
    end,
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },
  { -- Virt-column
    'lukas-reineke/virt-column.nvim',
  },
  { -- Gitsigns
    'lewis6991/gitsigns.nvim',
  },
  { -- Diffview
    'sindrets/diffview.nvim',
  },
  { -- Leap
    'ggandor/leap.nvim',
  },
  { -- Lspconfig
    'neovim/nvim-lspconfig',
  },
  { -- Python-syntax
    'vim-python/python-syntax',
  },
  { -- Inc-rename
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup()
    end,
  },
  { -- LSP-progress
    'linrongbin16/lsp-progress.nvim',
    config = function()
      require('lsp-progress').setup()
    end
  },
  { -- LSP-timeout
    'hinell/lsp-timeout.nvim',
    dependencies={ 'neovim/nvim-lspconfig' }
  },
  { -- Outline
    'hedyhli/outline.nvim',
    cmd = { 'Outline', 'OutlineOpen' },
    lazy = true,
  },
  { -- Telescope-file-browser
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  },
  { -- Comment
    'numToStr/Comment.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
})
