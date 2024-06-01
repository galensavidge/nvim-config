-- Sets up git integration plugins.

return {
  { -- Gitsigns (show git status in the symbol column)
    'lewis6991/gitsigns.nvim',
    lazy = true,
    config = function()
      require('gitsigns').setup()
    end,
  },

  { -- Neogit (UI window for git commands)
    'NeogitOrg/neogit',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true
  },

  { -- Diffview (UI window for working with git diffs)
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
  },
}
