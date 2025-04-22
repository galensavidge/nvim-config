-- Telescope
-- Includes fuzzy finders for a variety of different things.

-- Set keybinds
if vim.fn.has('win32') then
  vim.keymap.set('n', '<leader>;', ':Telescope find_files<CR>',
    { silent = true, desc = 'Search file names' })
else
  vim.keymap.set('n', '<leader>;', function()
    require('telescope').extensions.smart_open.smart_open()
  end, { silent = true, desc = 'Search file names' })
end

vim.keymap.set('n', '<leader>sR', ':Telescope resume<CR>', {
  silent = true,
  desc = 'Search resume (resume last used telescope picker)',
})

vim.keymap.set('n', '<leader>gg', ':Telescope live_grep theme=ivy<CR>',
  { silent = true, desc = 'Search for text in files' })

vim.keymap.set('n', '<leader>gw', ':Telescope grep_string theme=ivy<CR>',
  { silent = true, desc = 'Grep word under cursor' })

vim.keymap.set('n', '<leader>sb', ':Telescope buffers theme=dropdown<CR>',
  { silent = true, desc = 'Search buffers' })

vim.keymap.set('n', '<leader>sk', ':Telescope keymaps theme=ivy<CR>',
  { silent = true, desc = 'Search keymaps' })

vim.keymap.set('n', '<leader>sh', ':Telescope help_tags<CR>',
  { silent = true, desc = 'Search help tags' })

vim.keymap.set('n', '<leader>si', ':Telescope hierarchy incoming_calls<CR>',
  { silent = true, desc = 'Search incoming calls' })

vim.keymap.set('n', '<leader>so', ':Telescope hierarchy outgoing_calls<CR>',
  { silent = true, desc = 'Search outgoing calls' })

vim.keymap.set('n', '<leader>z',
  function()
    local ts = require('telescope.builtin')
    local themes = require('telescope.themes')
    ts.spell_suggest(themes.get_cursor({}))
  end, { desc = 'Search speling suggestions' })

vim.keymap.set('n', '<leader>u',
  function()
    local themes = require('telescope.themes')
    require('telescope').extensions.undo.undo(themes.get_dropdown({}))
  end, { desc = 'Search undo tree' })

vim.keymap.set('n', '<leader>gb', ':Telescope git_branches theme=dropdown<CR>',
  { silent = true, desc = 'Search git banches' })

vim.keymap.set('n', '<leader>gc', ':Telescope git_bcommits<CR>',
  { silent = true, desc = 'Show commit history for current buffer' })

vim.keymap.set('n', '<leader>st', ':Telescope builtin theme=get_ivy<CR>',
  { silent = true, desc = 'Search Telescope pickers' })

return {
  { -- Telescope
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = true,
    cmd = 'Telescope',
    config = function()
      -- Better fuzzy finder
      require('telescope').load_extension('fzf')

      -- Undo tree
      require('telescope').load_extension('undo')

      -- LSP call hierarchy
      require("telescope").load_extension("hierarchy")

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
                ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
              }
            }
          }
        },
        extensions = {
          smart_open = {
            match_algorithm = 'fzf',
          }
        },
      })
    end,
  },

  { -- Telescope-fzf-native (better fuzzy finder)
    'nvim-telescope/telescope-fzf-native.nvim',
    lazy = true,
    build = 'make',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  { -- Smart-open (file search that learns your browsing habits)
    'danielfalk/smart-open.nvim',
    branch = '0.2.x',
    lazy = true,
    config = function()
    if vim.fn.has('win32') then
        -- vim.g.sqlite_clib_path = 'sqlite3/sqlite3.dll'
      else
        require('telescope').load_extension('smart_open')
      end
    end,
    dependencies = { 'kkharji/sqlite.lua', },
  },

  { -- Telescope-undo (undo tree)
    'debugloop/telescope-undo.nvim',
    lazy = true,
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  { -- Telescope-hierarchy (LSP call hierarchy)
    'jmacadie/telescope-hierarchy.nvim',
    lazy = true,
    dependencies = {
      {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
      },
    },
  },
}
