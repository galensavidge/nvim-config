 -- Set spell check
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},
{
  pattern = {"*.rst", "*.md", "*COMMIT*"},
  callback = function(ev)
    vim.opt.spell = true
    vim.opt.spelllang = 'en_us'
  end
})

 -- Set tab length by file type
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},
{
  pattern = {"*.lua"},
  callback = function(ev)
    vim.opt.tabstop = 2
  end
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"},
{
  pattern = {"*.rst"},
  callback = function(ev)
    vim.opt.tabstop = 3
  end
})
