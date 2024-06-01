-- Telescope
-- Includes fuzzy finders for a variety of different things.

return {
  { -- Telescope
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    event = 'VeryLazy',
    config = function()
      local actions = require('telescope.actions')
      require('telescope').setup({
        defaults = {
          path_display = {
            truncate = 0,
            filename_first = {
              reverse_directories = false
            }
          },
          mappings = {
            n = {
              ['<a-s>'] = actions.select_horizontal,
              ['<a-v>'] = actions.select_vertical,
              ['<a-t>'] = actions.select_tab,
            },
            i = {
              ['<a-s>'] = actions.select_horizontal,
              ['<a-v>'] = actions.select_vertical,
              ['<a-t>'] = actions.select_tab,
            },
          }
        },
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
              }
            }
          }
        }
      })

      -- Project/session management
      require('telescope').load_extension('persisted')

      -- Better fuzzy finder
      require('telescope').load_extension('fzf')

      -- Undo tree
      require('telescope').load_extension('undo')

      -- Debugger breakpoints
      require('plugins.dap')
      require('telescope').load_extension('dap')
    end,
  },

  { -- Telescope-fzf-native (better fuzzy finder)
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  { -- Telescope-undo (undo tree)
    'debugloop/telescope-undo.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  { -- Telescope-dap (debugger breakpoints)
    'nvim-telescope/telescope-dap.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },
}
