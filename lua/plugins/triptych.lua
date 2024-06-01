-- Triptych
-- File explorer GUI.
return {
  {
    'simonmclean/triptych.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('triptych').setup({
        mappings = {
          show_help = '?',
          jump_to_cwd = '.',  -- Pressing again will toggle back
          nav_left = 'h',
          nav_right = { 'l', '<CR>' },
          open_hsplit = '<A-s>',
          open_vsplit = '<A-v>',
          open_tab = '<A-t>',
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
        },
      })
    end,
  }
}
