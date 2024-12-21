-- Telescope
-- Includes fuzzy finders for a variety of different things.

-- Set keybinds
if vim.fn.has('windows') and not vim.fn.has('linux') then
  vim.keymap.set('n', '<leader>;', ':Telescope find_files<CR>',
  { silent = true, desc = 'Search file names' })
else
  vim.keymap.set('n', '<leader>;', function()
    require('telescope').extensions.smart_open.smart_open()
  end, { silent = true, desc = 'Search file names' })
end

vim.keymap.set('n', '<leader>R', ':Telescope resume<CR>',
  { silent = true, desc = 'Resume last used telescope picker' })

vim.keymap.set('n', '<leader>f', ':Telescope live_grep theme=ivy<CR>',
  { silent = true, desc = 'Search for text in files' })

vim.keymap.set('n', '<leader>w', ':Telescope grep_string theme=ivy<CR>',
  { silent = true, desc = 'Grep word under cursor' })

vim.keymap.set('n', '<leader>b', ':Telescope buffers theme=dropdown<CR>',
  { silent = true, desc = 'Search buffers' })

vim.keymap.set('n', '<leader>km', ':Telescope keymaps theme=ivy<CR>',
  { silent = true, desc = 'Search keymaps' })

vim.keymap.set('n', '<leader>h', ':Telescope help_tags<CR>',
  { silent = true, desc = 'Search help tags' })

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

-- vim.keymap.set('n', '<leader>e', ':Telescope diagnostics<CR>',
--   { silent = true, desc = 'Search diagnostics' })

vim.keymap.set('n', '<leader>gb', ':Telescope git_branches theme=dropdown<CR>',
  { silent = true, desc = 'Search git banches' })

vim.keymap.set('n', '<leader>gc', ':Telescope git_bcommits<CR>',
  { silent = true, desc = 'Show commit history for current buffer' })

-- vim.keymap.set('n', '<leader>S',
--   function()
--     require('auto-session.session-lens').search_session()
--   end, { desc = 'Search sessions' })

vim.keymap.set('n', '<leader>ts', ':Telescope builtin theme=get_ivy<CR>',
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
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },

  { -- Smart-open (
    'danielfalk/smart-open.nvim',
    branch = '0.2.x',
    lazy = true,
    config = function()
      if vim.fn.has('windows') and not vim.fn.has('linux') then
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
}
