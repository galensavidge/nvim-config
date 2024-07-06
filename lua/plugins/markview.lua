-- Markview
-- Markdown viewer.
return {
  'OXY2DEV/markview.nvim',
  branch = 'dev',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Used by the code bloxks
  },

  config = function()
    require('markview').setup({})

    vim.keymap.set('n', '<leader>mv', ':Markview<cr>',
      { silent = true, desc = 'Toggle markdown viewer' })
  end
}
