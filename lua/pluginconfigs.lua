 -- Status line
require("lualine").setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {require('lsp-progress').progress, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

 -- Project/session management
require("persisted").setup({
  use_git_branch = true,
  autoload = true,
})
require('telescope').load_extension("persisted")

 -- Better color column
require("virt-column").setup()

 -- Git integration (show hunks, stage hunks, blame)
require('gitsigns').setup()

 -- Leap motions
require('leap').create_default_mappings(true)

 -- Set up language servers
require('lspconfig').pyright.setup({})
require('lspconfig').clangd.setup({})

 -- Better Python syntax highlighting
vim.g.python_highlight_all = true

 -- Code outline
require('plugins.outline')
