-- Grug-far
-- Search and replace UI.

return {
  {
    'MagicDuck/grug-far.nvim',
    event='VeryLazy',
    config = function()
      require('grug-far').setup({})
    end
  },
}
