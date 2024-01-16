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

 -- Better color column
require('virt-column').setup()

 -- Git integration (show hunks, stage hunks, blame)
require('gitsigns').setup()

 -- Leap motions (need to unbind some things set by cutlass first)
vim.keymap.del('n', 's')
vim.keymap.del('n', 'S')
vim.keymap.del('x', '"_s')
require('leap').create_default_mappings()

 -- Set up language servers
local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp.pyright.setup({capabilities = capabilities})
lsp.clangd.setup({capabilities = capabilities})

 -- Set up completion
require('plugins.cmp')

 -- Better Python syntax highlighting
vim.g.python_highlight_all = true

 -- Code outline
require('plugins.outline')

 -- File browser
require('telescope').load_extension('file_browser')

 -- Commenting
require('Comment').setup({
  ignore = '^$', -- Ignore empty lines
  toggler = {
      line = '<leader>ct', -- Line-comment toggle keymap
  },
  opleader = {
      line = '<leader>cc', -- Line-comment keymap
      block = '<leader>cb', -- Block-comment keymap
  },
  ---Enable keybindings
  mappings = {
      basic = true,
      extra = false,
  },
})
