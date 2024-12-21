-- Grug-far
-- Search and replace UI.

return {
  {
    'MagicDuck/grug-far.nvim',
    cmd = { 'GrugFar' },
    config = function()
      require('grug-far').setup({
        keymaps = {
          close = { n = 'q' },
        },
      })
    end
  },
}
