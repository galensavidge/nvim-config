-- Move vertically by visual line (gets around super long lines)
vim.keymap.set({ 'n', 'x', 'o' }, 'j', 'gj', { silent = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'k', 'gk', { silent = true })

-- Move to the beginning and end of lines
vim.keymap.set({ 'n', 'x', 'o' }, 'H', '^', { silent = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'L', '$', { silent = true })

-- Leap motions
vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
vim.keymap.set({ 'n', 'x', 'o' }, 'gs', '<Plug>(leap-from-window)')
vim.keymap.set({ 'n', 'o' }, 'gS', function()
  require('leap.remote').action()
end)

-- Syntax tree walking motions
vim.keymap.set({ 'n', 'x' }, 'gj', ':Treewalker Down<CR>', { silent = true })
vim.keymap.set({ 'n', 'x' }, 'gk', ':Treewalker Up<CR>', { silent = true })
vim.keymap.set({ 'n', 'x' }, 'gh', ':Treewalker Left<CR>', { silent = true })
vim.keymap.set({ 'n', 'x' }, 'gl', ':Treewalker Right<CR>', { silent = true })

-- Keep automatically inserted indentation when switching back to normal mode
vim.keymap.set('n', 'o', 'ox<backspace>', { silent = true })
vim.keymap.set('n', 'O', 'Ox<backspace>', { silent = true })
vim.keymap.set('i', '<cr>', '<cr>x<backspace>', { silent = true })

-- Jump back and foward in the buffer stack
vim.keymap.set('n', '<A-o>', require('bufjump').backward, {
  silent = true,
  desc = 'Jump to the previous buffer'
})
vim.keymap.set('n', '<A-i>', require('bufjump').forward, {
  silent = true,
  desc = 'Jump to the next buffer'
})

-- Split panes
vim.keymap.set('n', '<A-s>', '<C-w>s', {
  silent = true,
  desc = 'Split horizontal'
})
vim.keymap.set('n', '<A-v>', '<C-w>v', {
  silent = true,
  desc = 'Split vertical'
})

-- Move between panes to left/bottom/top/right
vim.keymap.set('n', '<C-h>', '<C-w>h', {
  silent = true,
  desc = 'Move to pane to the left'
})
vim.keymap.set('n', '<C-j>', '<C-w>j', {
  silent = true,
  desc = 'Move to pane below'
})
vim.keymap.set('n', '<C-k>', '<C-w>k', {
  silent = true,
  desc = 'Move to pane above'
})
vim.keymap.set('n', '<C-l>', '<C-w>l', {
  silent = true,
  desc = 'Move to pane to the right'
})

-- Move split panes to left/bottom/top/right
vim.keymap.set('n', '<A-h>', '<C-w>H', {
  silent = true,
  desc = 'Move pane to the left'
})
vim.keymap.set('n', '<A-j>', '<C-w>J', {
  silent = true,
  desc = 'Move pane down'
})
vim.keymap.set('n', '<A-k>', '<C-w>K', {
  silent = true,
  desc = 'Move pane up'
})
vim.keymap.set('n', '<A-l>', '<C-w>L', {
  silent = true,
  desc = 'Move pane to the right'
})

-- Shortcut for equally splitting window sizes
vim.keymap.set({ 'n', 'x' }, '<A-=>', '<C-w>=', {
  silent = true,
  desc = 'Split window sizes equally'
})

-- Close pane
vim.keymap.set({ 'n', 'x' }, '<C-c>', '<C-w>c', {
  silent = true,
  desc = 'Close split'
})

-- Delete buffer
vim.keymap.set({ 'n', 'x' }, '<A-d>', ':bp | sp | bn | bd<cr>', {
  silent = true,
  desc = 'Delete buffer'
})

-- Save all and quit neovim
vim.keymap.set({ 'n' }, 'ZZ', ':wa | qa<cr>', {
  silent = true,
  desc = 'Save all buffers and quit neovim'
})

-- Tab navigation
vim.keymap.set('n', '<A-t>', ':tabnew<cr>', {
  silent = true,
  desc = 'New tab'
})
vim.keymap.set('n', '<A-c>', ':tabclose<cr>', {
  silent = true,
  desc = 'Close tab'
})
vim.keymap.set('n', 'gt', ':tabnext<cr>', {
  silent = true,
  desc = 'Next tab'
})
vim.keymap.set('n', 'gT', ':tabprevious<cr>', {
  silent = true,
  desc = 'Next tab'
})

-- Cut keybinds
vim.keymap.set({ 'n', 'x' }, 'm', 'd', { desc = 'Cut' })
vim.keymap.set('n', 'mm', 'dd', { desc = 'Cut line' })
vim.keymap.set('n', 'M', 'D', { desc = 'Cut to end of line' })
vim.keymap.set({ 'n', 'x' }, '<leader>m', 'm', { desc = 'Set mark' })
vim.keymap.set('x', 'p', 'P') -- Prevent yank on put in visual mode

-- Keybinds to delete without yanking
vim.keymap.set({ 'n', 'x' }, 'd', '"0d', { desc = 'Delete' })
vim.keymap.set({ 'n', 'x' }, 'x', '"0x', { desc = 'Delete character' })
vim.keymap.set({ 'n', 'x' }, 'c', '"0c', { desc = 'Change' })
vim.keymap.set('n', 'dd', '"0dd', { desc = 'Delete line' })
vim.keymap.set('n', 'D', '"0D', { desc = 'Delete to end of line' })

-- Open clipboard history
vim.keymap.set('n', '<leader>p', function()
  require('lazyclip').show_clipboard()
end, { desc = 'Open clipboard history' })

-- Open quickfix list
vim.keymap.set('n', '<leader>q', function()
  require('quicker').toggle()
end, {
  desc = 'Toggle quickfix',
})

-- Terminal related keybinds
vim.keymap.set('n', '<leader>T', ':split | term<CR>', {
  silent = true,
  desc = 'Open terminal in split'
})
vim.keymap.set('n', '<leader>t', ':term<CR>', {
  silent = true,
  desc = 'Open terminal'
})
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- Project wide search and replace
vim.keymap.set({ 'n', 'x' }, '<leader>re', function()
    require('grug-far').open({
      windowCreationCommand = 'split',
      transient = true,
    })
  end,
  { silent = true, desc = 'Toggle Grug-Far (search and replace)' })

-- Git integration
vim.keymap.set('n', '<leader>go',
  function()
    vim.cmd('tabl')
    require('neogit').open()
  end, { silent = true, desc = 'Open git UI page' })

vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', {
  silent = true,
  desc = 'Open git diff view for all files'
})
vim.keymap.set('n', '<leader>gu', ':DiffviewOpen @{upstream}...HEAD<CR>', {
  silent = true,
  desc = 'Open git diff against upstream (branch point)'
})
vim.keymap.set('n', '<leader>gf', ':DiffviewFileHistory<CR>', {
  silent = true,
  desc = 'Open git diff view for history of file in current buffer'
})

-- Use LspAttach autocommand to only map the following keys after the language
-- server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
      { buffer = ev.buf, silent = true, desc = 'LSP go to declaration' })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
      { buffer = ev.buf, silent = true, desc = 'LSP go to definition' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover,
      { buffer = ev.buf, silent = true, desc = 'LSP hover symbol' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
      { buffer = ev.buf, silent = true, desc = 'LSP go to implementation' })
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help,
      { buffer = ev.buf, silent = true, desc = 'LSP signature help' })
    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
    --   { buffer = ev.buf, silent = true, desc = 'LSP add workspace folder' })
    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
    --   { buffer = ev.buf, silent = true, desc = 'LSP remove workspace folder' })
    -- vim.keymap.set('n', '<leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, { buffer = ev.buf, silent = true, desc = 'LSP list workspace folders' })
    -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition,
    --   { buffer = ev.buf, silent = true, desc = 'LSP go to type definition' })
    vim.keymap.set('n', '<leader>rn', function()
        require('live-rename').rename()
      end,
      { silent = true, desc = 'Rename LSP symbol' })
    -- vim.keymap.set('n', '<leader>R', function()
    --     require('live-rename').rename({ text = "", insert = true })
    --   end,
    --   { silent = true, desc = 'Rename LSP symbol' })
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action,
      { buffer = ev.buf, silent = true, desc = 'LSP execute code action' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references,
      { buffer = ev.buf, silent = true, desc = 'LSP go to references' })
    vim.keymap.set('n', '<leader>l', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf, silent = true, desc = 'LSP format buffer' })
    vim.keymap.set('n', '<leader>s',
      ':Telescope lsp_dynamic_workspace_symbols theme=ivy<CR>',
      { buffer = ev.buf, silent = true, desc = 'Search LSP symbols' })
    vim.keymap.set('n', '[e', vim.diagnostic.goto_prev,
      { buffer = ev.buf, silent = true, desc = 'Go to previous LSP diagnostic' })
    vim.keymap.set('n', ']e', vim.diagnostic.goto_next,
      { buffer = ev.buf, silent = true, desc = 'Go to next LSP diagnostic' })
    vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float,
      { buffer = ev.buf, silent = true, desc = 'Open LSP diagnostic' })
  end,
})

-- Debugger
vim.keymap.set('n', '<leader>db', function()
  require('dap').toggle_breakpoint()
end, { desc = 'Toggle breakpoint on current line' })
vim.keymap.set('n', '<leader>dB', function()
  return require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'Set conditional breakpoint on current line' })
vim.keymap.set('n', '<leader>dc', function()
  require('dap').continue()
end, { desc = 'Start/continue debugger' })
vim.keymap.set('n', '<leader>di', function()
  require('dap').step_into()
end, { desc = 'Debugger step into' })
vim.keymap.set('n', '<leader>do', function()
  require('dap').step_over()
end, { desc = 'Debugger step over' })
vim.keymap.set('n', '<leader>dO', function()
  require('dap').step_out()
end, { desc = 'Debugger step out' })
vim.keymap.set('n', '<leader>dr', function()
  require('dap').repl.toggle()
end, { desc = 'Debugger toggle REPL' })
vim.keymap.set('n', '<leader>dl', function()
  require('dap').run_last()
end, { desc = 'Debugger run last' })
vim.keymap.set('n', '<leader>dx', function()
  require('dap').terminate()
end, { desc = 'Stop debugger' })
vim.keymap.set('n', '<leader>du', function()
  require('dapui').toggle()
end, { desc = 'Toggle debugger UI' })

-- File browser
vim.keymap.set('n', ',', function()
    require('oil').open()
  end,
  { silent = true, desc = 'Open current file directory' })

-- Create new file from the path under the cursor
vim.keymap.set('n', '<leader>nf', function()
  -- Clear the f register.
  vim.cmd('let @f=""')

  -- Copy the word within parentheses.
  vim.cmd.normal('"fyib')

  local path = vim.fn.getreg('f')

  if string.len(path) == 0 then
    return
  end

  if string.sub(path, 1, 1) ~= ('~') then
    -- Get the path to the directory containing the current file.
    local filepath = vim.fn.expand('%')
    filepath = vim.fn.fnamemodify(filepath, ':h')
    path = filepath .. '/' .. path
    path = vim.fn.resolve(path)
  end

  path = vim.fn.expand(path)

  print(path)

  vim.cmd('! mkdir -p "$(dirname "' .. path .. '")" && touch "' .. path .. '"')
  vim.cmd('e ' .. path)
end, { silent = true, desc = 'Create new file from path under cursor' })
