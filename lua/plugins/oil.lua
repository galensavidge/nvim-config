-- Oil.nvim
-- File browser in a buffer.

return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup({
        columns = {
          -- 'permissions',
          'size',
          'mtime',
          'icon',
        },
        win_options = {
          signcolumn = "yes:2",
        },
        watch_for_changes = true,
        skip_confirm_for_simple_edits = true,
        use_default_keymaps = false,
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<A-v>'] = {
            'actions.select',
            opts = { vertical = true },
            desc = 'Open the entry in a vertical split'
          },
          ['<A-s>'] = {
            'actions.select',
            opts = { horizontal = true },
            desc = 'Open the entry in a horizontal split'
          },
          ['<A-t>'] = {
            'actions.select',
            opts = { tab = true },
            desc = 'Open the entry in new tab'
          },
          ['gp'] = 'actions.preview',
          [','] = 'actions.close',
          ['gR'] = 'actions.refresh',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['~'] = {
            callback = function()
              require('oil').open(vim.fn.expand('~'))
            end,
            desc = 'Open the home directory',
          },
          ['`'] = {
            'actions.cd',
            opts = { scope = 'tab' },
            desc = ':cd to the current oil directory',
            mode = 'n'
          },
          ['yp'] = {
            callback = function()
              local oil = require('oil')
              local entry = oil.get_cursor_entry()
              local dir = oil.get_current_dir()

              if not entry or not dir then
                return
              end

              local relpath = vim.fn.fnamemodify(dir, ':.') .. entry.name
              vim.fn.setreg('+', relpath)
              vim.print('Copied ' .. relpath)
            end,
            desc = 'Yank relative filepath',
          },
          ['yP'] = {
            callback = function()
              require('oil.actions').copy_entry_path.callback()
              local path = vim.fn.getreg(vim.v.register)
              vim.fn.setreg('+', path)
              vim.print('Copied ' .. path)
            end,
            desc = 'Yank absolute filepath',
          },
          ['gs'] = 'actions.change_sort',
          ['gx'] = 'actions.open_external',
          ['g.'] = 'actions.toggle_hidden',
          ['g\\'] = 'actions.toggle_trash',
        },
      })
    end,
  },
  {
    "benomahony/oil-git.nvim",
    dependencies = { "stevearc/oil.nvim" },
  }
}
