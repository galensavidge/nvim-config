-- Set color theme
vim.g.neon_style = "dark"
vim.cmd[[colorscheme neon]]

-- Set status line config
require('lualine').setup {
  options = { theme = 'neon' }
}

-- Leap highlight groups
vim.cmd([[
  highlight link leapLabel IncSearch
  highlight link leapMatch Search
]])

-- Code color scheme customization
vim.cmd([[
  highlight clear Statement
  highlight link Statement Constant
  highlight link Boolean Constant
  highlight! link NormalFloat Normal
  highlight! link FloatBorder Directory
]])

-- LSP highlight groups
vim.cmd([[
  highlight clear LspReferenceText
  highlight link LspReferenceText CursorLine
  highlight clear LspReferenceRead
  highlight link LspReferenceRead CursorLine
  highlight clear LspReferenceWrite
  highlight link LspReferenceWrite CursorLine
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

-- Override LSP floating window styling
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'rounded'  -- Rounded border by default
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
