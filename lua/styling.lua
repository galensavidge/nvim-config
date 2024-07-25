-- Set color theme
vim.g.neon_style = "dark"
vim.cmd.colorscheme('neon')

-- Set status line config
require('lualine').setup {
  options = { theme = 'neon' }
}

-- Leap highlight groups
vim.api.nvim_set_hl(0, 'leapLabel', { link = 'IncSearch', force = true })
vim.api.nvim_set_hl(0, 'leapMatch', { link = 'Search', force = true })

-- Code color scheme customization
vim.api.nvim_set_hl(0, 'Statement', { link = 'Constant', force = true })
vim.api.nvim_set_hl(0, 'Boolean', { link = 'Constant', force = true })
vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal', force = true })
vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'Directory', force = true })

-- LSP highlight groups
local lsp_ref = { bg = '#323c4d', force = true }
vim.api.nvim_set_hl(0, 'LspReferenceWrite', lsp_ref)
vim.api.nvim_set_hl(0, 'LspReferenceRead', lsp_ref)
vim.api.nvim_set_hl(0, 'LspReferenceText', lsp_ref)

-- Set git-diff highlight groups to something better looking
vim.api.nvim_set_hl(0, 'DiffAdd',
  { ctermbg = 10, bg = '#1d3613', force = true })
vim.api.nvim_set_hl(0, 'DiffDelete',
  { ctermfg = 15, bg = '#3b1212', force = true })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#054a3c', force = true })
vim.api.nvim_set_hl(0, 'DiffText',
  { cterm = { bold = true }, ctermbg = 9, bg = '#076e59', force = true })

-- Set Julia syntax highlighting colors
vim.api.nvim_set_hl(0, 'juliaFunction', { link = 'Function', force = true })
vim.api.nvim_set_hl(0, 'juliaFunctionDef',
  { link = 'juliaFunction', force = true })
vim.api.nvim_set_hl(0, 'juliaFunctionCall',
  { link = 'juliaFunction', force = true })

-- Override LSP floating window styling
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'rounded' -- Rounded border by default
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
