local ts_parsers = require('nvim-treesitter.parsers')

-- Check if a table contains an element.
local function contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

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

-- Highlight yanked text
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   callback = function()
--     require('vim.highlight').on_yank()
--   end,
-- })

-- Only show the cursorline and relative line numbers in the active window
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufNew' }, {
  callback = function()
    if vim.opt_local.number:get() == true then
      vim.opt_local.cursorline = true
      vim.opt_local.relativenumber = true
    end
  end,
})
vim.api.nvim_create_autocmd('WinLeave', {
  callback = function()
    if vim.opt_local.number:get() == true then
      vim.opt_local.cursorline = false
      vim.opt_local.relativenumber = false
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

-- Set spll check
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'html',
    'markdown',
    'text',
    'rst',
    'gitcommit',
    'python',
    'julia',
    'h',
    'c',
    'cpp',
    'toml',
    'json',
  },
  callback = function()
    vim.opt_local.spell = true
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

-- Markdown LSP server
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'markdown',
--   callback = function(ev)
--     vim.lsp.start({
--       name = 'iwes',
--       cmd = { 'iwes' },
--
--       -- Set the "root directory" to the parent directory of the file in the
--       -- current buffer (`ev.buf`) that contains "index.md". Files that share a
--       -- root directory will reuse the connection to the same LSP server.
--       root_dir = vim.fs.root(ev.buf, { 'index.md' })
--     })
--   end,
-- })

-- Make sure the auto-formatter doesn't override bindings like gq
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end,
})

-- Strip Windows line endings on save
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.api.nvim_command('silent! exe "%s/\r$//"')
  end,
})

-- Show diagnostics on hover
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    -- Return if there is a floating window open already
    for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_get_config(winid).zindex and
          vim.api.nvim_win_get_config(winid).zindex > 10 then
        return
      end
    end

    -- Open the diagnostics in a floating window
    vim.diagnostic.open_float()
  end
})

-- Highlight LSP symbols on hover
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    local bufnr = vim.fn.bufnr()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    for _, client in ipairs(clients) do
      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ 'CursorHold' }, {
          buffer = bufnr,
          callback = function()
            local winid = vim.fn.win_getid(vim.fn.winnr())
            if contains(vim.fn.win_findbuf(bufnr), winid) then
              vim.lsp.buf.document_highlight()
            end
          end
        })

        vim.api.nvim_create_autocmd({
          'CursorMoved', 'WinLeave', 'InsertEnter'
        }, {
          buffer = bufnr,
          callback = function()
            local winid = vim.fn.win_getid(vim.fn.winnr())
            if contains(vim.fn.win_findbuf(bufnr), winid) then
              vim.lsp.buf.clear_references()
            end
          end,
        })
      end
    end
  end,
})

-- Override <A-d> keyboard shotcut so it kills terminal buffers
vim.api.nvim_create_autocmd({ 'TermOpen', }, {
  callback = function(ev)
    vim.keymap.set({ 'n', 'x', 'i' }, '<A-d>', ':bp | sp | bn | bd!<cr>',
      { buffer = ev.buf, silent = true, desc = 'Quit terminal' })
  end,
})

-- Make <esc> close the command-line window
vim.api.nvim_create_autocmd({ 'CmdWinEnter', }, {
  callback = function(ev)
    vim.keymap.set({ 'n' }, '<esc>', ':exit<CR>',
      { buffer = ev.buf, silent = true, desc = 'Close command-line window' })
  end,
})
