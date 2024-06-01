-- Sets up plugins to improve register behavior and the yank/put workflow.

return {
  { -- Cutlass (add a "cut" action and make all delete actions not affect
    -- registers)
    'svermeulen/vim-cutlass',
  },

  { -- Neoclip (clipboard manager with Telescope integration)
    'AckslD/nvim-neoclip.lua',
    event = 'VeryLazy',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('neoclip').setup()
    end,
  },
}
