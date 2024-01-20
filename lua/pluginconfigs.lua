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

-- Show indented blocks visually
require('ibl').setup()

-- Project/session management
require('persisted').setup({
  use_git_branch = true,
  autoload = true,
})
require('telescope').load_extension('persisted')

-- Better fuzzy finder sorting
require('telescope').load_extension('fzf')

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
require('lspconfig.lua')

-- Set up completion
require('plugins.cmp')

-- Better Python syntax highlighting
vim.g.python_highlight_all = true

-- Code outline
require('plugins.outline')

-- File browser
require('telescope').load_extension('file_browser')

-- Whitespace trimming
require('trim').setup({
  trim_on_write = true,
  trim_trailing = true,
  trim_last_line = false,
  trim_first_line = false,
})
