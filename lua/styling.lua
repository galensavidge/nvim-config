-- Set color theme
vim.g.neon_style = "dark"
vim.cmd[[colorscheme neon]]

-- Set status line config
require('lualine').setup {
  options = { theme = 'neon' }
}

-- Code color scheme customization
vim.cmd([[
  highlight clear Statement
  highlight link Statement Constant
]])

-- Set git-diff highlight groups to something better looking
vim.cmd([[
  highlight clear DiffAdd
  highlight DiffAdd ctermbg=10 guibg=#1d3613
  highlight clear DiffDelete
  highlight DiffDelete ctermfg=15 guibg=#3b1212
  highlight clear DiffChange
  highlight DiffChange guibg=#054a3c
  highlight clear DiffText
  highlight DiffText cterm=bold ctermbg=9 guibg=#076e59
]])

-- Set Julia syntax highlighting colors
vim.cmd([[
  highlight link juliaFunction Function
  highlight link juliaFunctionDef juliaFunction
  highlight link juliaFunctionCall juliaFunction
]])
