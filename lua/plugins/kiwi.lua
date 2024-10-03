-- Kiwi
-- Minimal personal wiki plugin.

return {
  'serenevoid/kiwi.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  keys = {
    {
      '<leader>ww',
      function()
        require('kiwi').open_wiki_index()
      end,
      desc = 'Open wiki index'
    },
    {
      '<leader>wt',
      function()
        require('kiwi').todo.toggle()
      end,
      desc = 'Toggle markdown task'
    }
  },
  lazy = true,
}
