 -- Set spell check
vim.api.nvim_create_autocmd('FileType',
{
  pattern = { 'html', 'markdown', 'text' },
  callback = function()
    vim.opt_local.spell = true
  end,
})

 -- Set tab length by file type
vim.api.nvim_create_autocmd('FileType',
{
  pattern = { 'lua' },
  callback = function(ev)
    vim.opt_local.tabstop = 2
  end
})
vim.api.nvim_create_autocmd('FileType',
{
  pattern = { 'rst' },
  callback = function(ev)
    vim.opt_local.tabstop = 3
  end
})
