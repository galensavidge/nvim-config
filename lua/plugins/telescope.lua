-- Telescope
-- Includes fuzzy finders for a variety of different things.

return {
  { -- Telescope
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    lazy=true,
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

      -- Set keybinds
      local ts = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', ts.find_files, { desc = 'Search file names' })
      vim.keymap.set('n', '<leader>f', ts.live_grep,
        { desc = 'Search for text in files' })
      vim.keymap.set('n', '<leader>w', ts.grep_string,
        { desc = 'Grep word under cursor' })
      vim.keymap.set('n', '<leader>b', ts.buffers, { desc = 'Search buffers' })
      vim.keymap.set('n', '<leader>km', ts.keymaps, { desc = 'Search keymaps' })
      vim.keymap.set('n', '<leader>h', ts.help_tags, { desc = 'Search help tags' })
      vim.keymap.set('n', '<leader>p',
        require('telescope').extensions.neoclip.plus,
        { desc = 'Search clipboard history' })
      vim.keymap.set('n', '<leader>z', function()
        ts.spell_suggest(require('telescope.themes').get_cursor({}))
      end, { desc = 'Search speling suggestions' })
      vim.keymap.set('n', '<leader>u',
        require('telescope').extensions.undo.undo,
        { desc = 'Search undo tree' })
      vim.keymap.set('n', '<leader>e', ts.diagnostics,
        { desc = 'Search diagnostics' })
      vim.keymap.set('n', '<leader>gb', ts.git_branches,
        { desc = 'Search git banches' })
      vim.keymap.set('n', '<leader>bp',
        require('telescope').extensions.dap.list_breakpoints,
        { desc = 'Search breakpoints' })
      vim.keymap.set('n', '<leader>S',
        require('telescope').extensions.persisted.persisted,
        { desc = 'Search sessions' })
      vim.keymap.set('n', '<leader>ts', ts.builtin,
        { desc = 'Search Telescope pickers' })
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
