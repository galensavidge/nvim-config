-- Miscellangous other utilities.

return {

  { -- Leap (motion to move anywhere on the screen)
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    config = function()
      -- Define equivalence classes for brackets and quotes, in addition to
      -- the default whitespace group.
      require('leap').opts.equivalence_classes = {
        ' \t\r\n', '([{', ')]}', '\'"`'
      }

      -- Use the traversal keys to repeat the previous motion without
      -- explicitly invoking Leap.
      require('leap.user').set_repeat_keys('s<enter>', 's<backspace>')
    end,
  },

  { -- Surround (shortcuts with working with parenthesis, brackets, quotes, or
    -- other surrounding characters)
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end
  },

  { -- Hlsearch (automatically remove search highlights)
    'nvimdev/hlsearch.nvim',
    config = function()
      require('hlsearch').setup()
    end,
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

  { -- Nvim-better-n (make n and N work with more things)
    'jonatan-branting/nvim-better-n',
    config = function()
      require('better-n').setup({})
    end
  },

  -- { -- Faster.nvim (disable features on big files)
  --   'pteroctopus/faster.nvim',
  --   config = function()
  --     require('faster').setup({})
  --   end,
  -- },

  { -- Treesj
    'Wansmer/treesj',
    lazy = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
      })
    end,
  },
}
