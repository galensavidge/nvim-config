-- Treesitter textobjects
return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  dependencies = { 'nvim-treesitter/nvim-treesitter', },
  config = function()
    require('nvim-treesitter.configs').setup({
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobjects
          lookahead = true,

          keymaps = {
            ['af'] = {
              query = '@function.outer', desc = 'Select outer function'
            },
            ['if'] = {
              query = '@function.inner', desc = 'Select inner function'
            },
            ['ac'] = {
              query = '@class.outer', desc = 'Select outer class'
            },
            ['ic'] = {
              query = '@class.inner', desc = 'Select inner class'
            },
            ['as'] = {
              query = '@scope',
              query_group = 'locals',
              desc = 'Select language scope'
            },
          },
        },
      },
    })
  end
}
