-- Sets up plugins to improve register behavior and the yank/put workflow.

return {
  { -- Neoclip (clipboard manager with Telescope integration)
    'AckslD/nvim-neoclip.lua',
    lazy=false,
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('neoclip').setup()
    end,
  },
}
