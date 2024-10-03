-- Miscellaneous other utilities.

return {

  { -- Leap (motion to move anywhere on the screen)
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
  },

  { -- Surround (shortcuts with working with parenthesis, brackets, quotes, or
    -- other surrounding characters)
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end
  },

  { -- Trim (automatically trim newlines and whitespace)
    'cappyzawa/trim.nvim',
    config = function()
      require('trim').setup({
        trim_on_write = true,
        trim_trailing = true,
        trim_last_line = true,
        trim_first_line = false,
      })
    end,
  },

  { -- Hlsearch (automatically remove search highlights)
    'nvimdev/hlsearch.nvim',
    config = function()
      require('hlsearch').setup()
    end,
  },

  { -- Bufjump (jump backward and forward through buffers in jump list)
    'kwkarlwang/bufjump.nvim',
    config = function()
      require('bufjump').setup({
        forward_key = false,
        backward_key = false,
      })
    end
  },

  { -- Boole.nvim (toggle more things with C-a/C-x)
    'nat-418/boole.nvim',
    config = function()
      require('boole').setup({
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>'
        },
        -- User defined loops
        additions = {
          { 'TODO', 'DONE' },
        },
      })
    end,
  },
}
