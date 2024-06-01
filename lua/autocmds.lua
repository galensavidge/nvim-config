-- Highlight yanked text in normal mode
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    if not vim.v.event.visual then
      require('vim.highlight').on_yank()
    end
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

-- Load session on git branch change
vim.api.nvim_create_autocmd('User', {
  pattern = 'NeogitBranchCheckout',
  callback = function()
    vim.cmd('SessionSave')
    vim.cmd('SessionLoad')
  end,
})

-- Close outline and neogit before saving session to prevent issues
vim.api.nvim_create_autocmd('User', {
  pattern = 'PersistedSavePre',
  callback = function()
    require('neogit').close()
    local current_tab = vim.fn.tabpagenr()
    local pos = vim.fn.getcurpos()
    vim.cmd('tabd OutlineClose')
    vim.cmd("execute 'tabnext' " .. current_tab)
    vim.fn.setpos('.', pos)
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
