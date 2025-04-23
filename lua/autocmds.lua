local ts_parsers = require('nvim-treesitter.parsers')

-- Overwrite formatting options for all programming languages, plus markdown
-- and RST
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'python', 'julia', 'c', 'h', 'cpp', 'markdown', 'rst' },
  callback = function()
    vim.opt_local.formatoptions = 'cqjnlr'
  end,
})

-- Request treesitter parser to update the syntax tree on text change
vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave' }, {
  callback = function()
    local buf = vim.fn.bufnr()
    local filelang = ts_parsers.ft_to_lang(
      vim.api.nvim_buf_get_option(buf, 'filetype'))
    local parser = ts_parsers.get_parser(buf, filelang)
    if parser ~= nil then
      parser:parse()
    end
  end,
})

-- Set highlighting for certain words
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew' }, {
  callback = function()
    vim.cmd('syntax match Todo /TODO/')
    vim.cmd('syntax match Done /DONE/')
  end,
})

-- Set treesitter highlighting for markdown and RST
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'rst' },
  callback = function()
    vim.cmd('TSBufEnable highlight')
  end,
})

-- Set tab length by file type
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'json' },
  callback = function(ev)
    vim.opt_local.tabstop = 2
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rst' },
  callback = function(ev)
    vim.opt_local.tabstop = 3
  end,
})

-- Set max line length by file type
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'julia' },
  callback = function(ev)
    vim.opt_local.colorcolumn = '93'
    vim.opt_local.textwidth = 92
  end,
})

-- Use Matlab syntax for GMAT files
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew' }, {
  pattern = { '*.script', '*.gmf' },
  callback = function(ev)
    vim.opt_local.tabstop = 3
    vim.opt_local.syntax = 'matlab'
  end,
})

-- Strip Windows line endings on save
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.api.nvim_command('silent! exe "%s/\r$//"')
  end,
})
