-- Sets up git integration plugins.

return {
  { -- Gitsigns (show git status in the symbol column)
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()

      local gs = require('gitsigns')
      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = 'Next git hunk' })

      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = 'Previous git hunk' })

      vim.keymap.set('n', '<leader>hs', gs.stage_hunk,
        { desc = 'Stage git hunk' })
      vim.keymap.set('n', '<leader>hr', gs.reset_hunk,
        { desc = 'Reset git hunk' })
      vim.keymap.set('v', '<leader>hs', function()
        gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
      end, { desc = 'Stage git hunk' })
      vim.keymap.set('v', '<leader>hr', function()
        gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')}
      end, { desc = 'Reset git hunk' })
      vim.keymap.set('n', '<leader>hS', gs.stage_buffer,
        { desc = 'Stage all git hunks in buffer' })
      vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk,
        { desc = 'Undo stage git hunk' })
      vim.keymap.set('n', '<leader>hR', gs.reset_buffer,
        { desc = 'Reset all git hunks in buffer' })
      vim.keymap.set('n', '<leader>hp', gs.preview_hunk,
        { desc = 'Preview git hunk' })
      vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end,
        { desc = 'Open git blame for current line' })
      vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame,
        { desc = 'Toggle git blame' })
      vim.keymap.set('n', '<leader>td', gs.toggle_deleted,
        { desc = 'Toggle deleted lines in git hunks' })
      vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>',
          { silent = true, desc = 'Select hunk motion'})
    end,
  },

  { -- Neogit (UI window for git commands)
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    lazy = true,
    config = {
      integrations = {
      telescope = true,
      diffview = true,
      },
    },
    cmd = 'Neogit',
  },

  { -- Diffview (UI window for working with git diffs)
    'sindrets/diffview.nvim',
    config = true,
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  },
}
