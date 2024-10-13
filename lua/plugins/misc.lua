-- Miscellaneous other utilities.

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
      require('leap.user').set_repeat_keys('<enter>', '<backspace>')
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

  { -- Nvim-better-n (make n and N work with more things)
    'jonatan-branting/nvim-better-n',
    config = function()
      require('better-n').setup({})
    end
  },

  { -- Faster.nvim (disable features on big files)
    'pteroctopus/faster.nvim',
    config = function()
      require('faster').setup({})
    end,
  },

  { -- Term-edit.nvim (enable some normal mode keybindings in terminal mode)
    'chomosuke/term-edit.nvim',
    lazy = false,
    version = '1.*',
    config = function()
      require('term-edit').setup({
        -- Mandatory option:
        -- Set this to a lua pattern that would match the end of your prompt.
        -- Or a table of multiple lua patterns where at least one would match the
        -- end of your prompt at any given time.
        -- For most bash/zsh user this is '%$ '.
        -- For most powershell/fish user this is '> '.
        -- For most windows cmd user this is '>'.
        prompt_end = '%$ ',
        -- How to write lua patterns: https://www.lua.org/pil/20.2.html
        mapping = {
          n = {
            s = false,
            S = false,
          },
        },
      })
    end,
  },
}
