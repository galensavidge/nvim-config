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

-- Better Python syntax highlighting
vim.g.python_highlight_all = true

-- Whitespace trimming
require('trim').setup({
  trim_on_write = true,
  trim_trailing = true,
  trim_last_line = false,
  trim_first_line = false,
})
