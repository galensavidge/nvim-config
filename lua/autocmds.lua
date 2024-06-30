local ts_parsers = require("nvim-treesitter.parsers")

-- Request treesitter parser to update the syntax tree on text change
vim.api.nvim_create_autocmd('TextChanged', {
  callback = function()
    local filelang = ts_parsers.ft_to_lang(
      vim.api.nvim_buf_get_option(vim.fn.bufnr(), 'filetype'))
    local parser = ts_parsers.get_parser(vim.fn.bufnr(), filelang)
    if parser ~= nil then
      parser:parse()
    end
  end,
})

-- Highlight yanked text in normal mode
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    if not vim.v.event.visual then
      require('vim.highlight').on_yank()
    end
  end,
})

-- Only show the cursorline and relative line numbers in the active window
vim.api.nvim_create_autocmd('WinEnter', {
  callback = function()
    if vim.bo.filetype == '' or vim.bo.filetype == 'Outline' then
      return
    end
    vim.opt_local.cursorline = true
    vim.opt_local.relativenumber = true
  end,
})
vim.api.nvim_create_autocmd('WinLeave', {
  callback = function()
    if vim.bo.filetype == '' or vim.bo.filetype == 'Outline' then
      return
    end
    vim.opt_local.cursorline = false
    vim.opt_local.relativenumber = false
  end,
})

-- Set folding by indent in certain file types
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'julia', 'h', 'c', 'cpp' },
  callback = function()
      vim.opt_local.foldmethod = 'indent'
    end,
})

-- Set spell check
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'html', 'markdown', 'text', 'rst', 'gitcommit' },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Set tab length by file type
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua' },
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

-- Make sure the auto-formatter doesn't override bindings like gq
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end,
})

-- Strip Windows line endings on save
vim.api.nvim_create_autocmd('BufWritePre',  {
  callback = function()
    vim.api.nvim_command('silent! exe "%s/\r$//"')
  end,
})
