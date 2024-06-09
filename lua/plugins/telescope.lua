-- Telescope
-- Includes fuzzy finders for a variety of different things.
-- Set keybinds
vim.keymap.set('n', '<C-p>', function()
    require('telescope').extensions.smart_open.smart_open()
  end, { desc = 'Search file names' })

vim.keymap.set('n', '<leader>f', ':Telescope live_grep',
  { desc = 'Search for text in files' })

vim.keymap.set('n', '<leader>w', ':Telescope grep_string',
  { desc = 'Grep word under cursor' })

vim.keymap.set('n', '<leader>b', ':Telescope buffers',
  { desc = 'Search buffers' })

vim.keymap.set('n', '<leader>km', ':Telescope keymaps',
  { desc = 'Search keymaps' })

vim.keymap.set('n', '<leader>h', ':Telescope help_tags',
  { desc = 'Search help tags' })

vim.keymap.set('n', '<leader>p',
  function()
    require('telescope').extensions.neoclip.plus()
  end, { desc = 'Search clipboard history' })

vim.keymap.set('n', '<leader>z', function()
    local ts = require('telescope.builtin')
    local themes = require('telescope.themes')

    ts.spell_suggest(themes.get_cursor({}))
  end, { desc = 'Search speling suggestions' })

vim.keymap.set('n', '<leader>u',
  function()
    require('telescope').extensions.undo.undo()
  end, { desc = 'Search undo tree' })

vim.keymap.set('n', '<leader>e', ':Telescope diagnostics',
  { desc = 'Search diagnostics' })

vim.keymap.set('n', '<leader>gb', ':Telescope git_branches',
  { desc = 'Search git banches' })

vim.keymap.set('n', '<leader>bp',
  function()
    require('telescope').extensions.dap.list_breakpoints()
  end, { desc = 'Search breakpoints' })

vim.keymap.set('n', '<leader>S',
  function()
    require('telescope').extensions.persisted.persisted()
  end, { desc = 'Search sessions' })

vim.keymap.set('n', '<leader>ts', ':Telescope builtin',
  { desc = 'Search Telescope pickers' })

return {
  { -- Telescope
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    lazy=true,
    config = function()
      -- Project/session management
      require('telescope').load_extension('persisted')

      -- Better fuzzy finder
      require('telescope').load_extension('fzf')

      -- Undo tree
      require('telescope').load_extension('undo')

      -- Debugger breakpoints
      require('plugins.dap')
      require('telescope').load_extension('dap')

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
    end,
  },

  { -- Telescope-fzf-native (better fuzzy finder)
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy=true,
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  { -- Smart-open (
    'danielfalk/smart-open.nvim',
    branch = '0.2.x',
    lazy=true,
    config = function()
      require('telescope').load_extension('smart_open')
    end,
    dependencies = { 'kkharji/sqlite.lua', },
  },

  { -- Telescope-undo (undo tree)
    'debugloop/telescope-undo.nvim',
    lazy=true,
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  { -- Telescope-dap (debugger breakpoints)
    'nvim-telescope/telescope-dap.nvim',
    lazy=true,
    dependencies = { 'nvim-telescope/telescope.nvim', },
  },
}
