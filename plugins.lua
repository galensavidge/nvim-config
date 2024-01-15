-- Bootstrap lazy.nvim if it is not installed
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

-- Set up plugins
require("lazy").setup({
  { -- Neon
    "rafamadriz/neon",
    priority = 100,
  },
  { -- Lualine
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { -- Telescope
    "nvim-telescope/telescope.nvim",
    tag = '0.1.5',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  { -- Persisted
    "olimorris/persisted.nvim",
    config = true,
    priority = 90,
  },
  { -- Cutlass
    "svermeulen/vim-cutlass",
  },
  { -- Neoclip
    "AckslD/nvim-neoclip.lua",
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
})
