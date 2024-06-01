-- Status line
require('lualine').setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {require('lsp-progress').progress, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

-- Tabline
require('tabline').setup({
    no_name = '[No Name]',    -- Name for buffers with no name
    modified_icon = '',      -- Icon for showing modified buffer
    close_icon = '',         -- Icon for closing tab with mouse
    separator = "▌",          -- Separator icon on the left side
    padding = 1,              -- Prefix and suffix space
    color_all_icons = false,  -- Color devicons in active and inactive tabs
    right_separator = false,  -- Show right separator on the last tab
    show_index = true,        -- Shows the index of tab before filename
    show_icon = true,         -- Shows the devicon
})

-- Show indented blocks visually
require('ibl').setup()

-- Telescope config
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
require('persisted').setup({
  use_git_branch = true,
  autoload = true,
})
require('telescope').load_extension('persisted')

-- Better fuzzy finder sorting
require('telescope').load_extension('fzf')

-- Undo tree for telescope
require('telescope').load_extension('undo')

-- Better color column
require('virt-column').setup()

-- Git integration (show hunks, stage hunks, blame)
require('gitsigns').setup()

-- Leap motions (need to unbind some things set by cutlass first)
vim.keymap.del('n', 's', {silent = true})
vim.keymap.del('n', 'S', {silent = true})
vim.keymap.del('x', '"_s', {silent = true})
vim.keymap.del('x', '"_S', {silent = true})
require('leap').create_default_mappings()

-- Set up language servers
require('plugins.lspconfig')

-- Set up treesitter context
require'treesitter-context'.setup{
  enable = true,
  line_numbers = true,
  -- Line used to calculate context. Choices: 'cursor', 'topline'
  mode = 'cursor',
  -- How many lines the window should span. Values <= 0 mean no limit.
  max_lines = 5,
  -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  min_window_height = 30,
  -- Maximum number of lines to show for a single context
  multiline_threshold = 20,
  -- Which context lines to discard if `max_lines` is exceeded. Choices:
  -- 'inner', 'outer'
  trim_scope = 'outer',
}

-- Set up completion
require('plugins.cmp')

-- Better Python syntax highlighting
vim.g.python_highlight_all = true

-- Code outline
require('plugins.outline')

-- File browser
require('plugins.triptych')

-- Whitespace trimming
require('trim').setup({
  trim_on_write = true,
  trim_trailing = true,
  trim_last_line = false,
  trim_first_line = false,
})

-- Debugging configuration
require('plugins.dap')
require('telescope').load_extension('dap')

-- Snippet runner configuration
require('sniprun').setup({
  -- your options
})
