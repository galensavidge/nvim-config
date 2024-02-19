require('triptych').setup({
  mappings = {
    show_help = '?',
    jump_to_cwd = '.',  -- Pressing again will toggle back
    nav_left = 'h',
    nav_right = { 'l', '<CR>' },
    delete = { 'd', 'x' },
    add = 'a',
    copy = 'y',
    rename = 'r',
    cut = 'm',
    paste = 'p',
    quit = 'q',
    toggle_hidden = '<leader>.',
  },
  extension_mappings = {
    ['f'] = {
      mode = 'n',
      fn = function(target)
        require 'telescope.builtin'.live_grep {
          search_dirs = { target.path }
        }
      end
    },
    ['<C-s>'] = {
      mode = 'n',
      fn = function(target)
        vim.cmd.Triptych()
        vim.schedule(function()
          vim.cmd.split(target.path)
        end)
      end,
    },
    ['<C-v>'] = {
      mode = 'n',
      fn = function(target)
        vim.cmd.Triptych()
        vim.schedule(function()
          vim.cmd.vsplit(target.path)
        end)
      end,
    },
  },
})
