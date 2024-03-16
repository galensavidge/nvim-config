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
  { -- Minintro
    "eoh-bse/minintro.nvim",
    opts = { color = "#989898" },
    config = true,
    lazy = false
  },
  { -- Indent-blankline
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  { -- Hlsearch
    'nvimdev/hlsearch.nvim',
    config = function()
      require('hlsearch').setup()
    end,
  },
  { -- Telescope
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = true,
  },
  { -- Telescope-fzf-native
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  { -- Telescope-undo
    'debugloop/telescope-undo.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  { -- Spectre
    'nvim-pack/nvim-spectre',
    dependencies = {
      'nvim-lua/plenary.nvim',
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
    lazy = true,
  },
  { -- Diffview
    'sindrets/diffview.nvim',
  },
  { -- Leap
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
  },
  { -- Lspconfig
    'neovim/nvim-lspconfig',
  },
  { -- Null-ls
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { -- Python-syntax
    'vim-python/python-syntax',
  },
  { -- Julia-vim
    'julialang/julia-vim'
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
  { -- Nvim-cmp
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-calc',
    },
  },
  { -- Lspkind
    'onsails/lspkind.nvim',
  },
  { -- LuaSnip
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    -- version = 'v2.*', -- Replace <CurrentMajor> by the latest released major
                         -- (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
  },
  -- { -- Codeium
  --   'Exafunction/codeium.vim',
  -- },

  { -- Triptych
    'simonmclean/triptych.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },
  { -- Comment
    'numToStr/Comment.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  { -- Trim
    'cappyzawa/trim.nvim',
  },
  { -- Vim-notes
    'xolox/vim-notes',
    dependencies = { 'xolox/vim-misc' },
  },
  { -- Nvim-dap
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'mfussenegger/nvim-dap-python',
    },
  },
  { -- Telescope-dap
    'nvim-telescope/telescope-dap.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },
  { -- Sniprun
    'michaelb/sniprun',
    branch = 'master',
    build = 'sh install.sh',
  },
})
