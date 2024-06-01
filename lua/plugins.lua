return {
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
  { -- Neogit
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = true
  },
  { -- Diffview
    'sindrets/diffview.nvim',
  },
  { -- Leap
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
  },
  { -- Surround
    'kylechui/nvim-surround',
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end
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
  { -- Nvim-treesitter-context
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  { -- Lspkind
    'onsails/lspkind.nvim',
  },
  { -- LuaSnip
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
  },
  { -- Trim
    'cappyzawa/trim.nvim',
  },
  { -- Vim-notes
    'xolox/vim-notes',
    dependencies = { 'xolox/vim-misc' },
  },
  { -- Telescope-dap
    'nvim-telescope/telescope-dap.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },
}
