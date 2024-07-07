-- Move vertically by visual line (gets around super long lines)
vim.keymap.set({ 'n', 'x', 'o' }, 'j', 'gj', { silent = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'k', 'gk', { silent = true })

-- Move to the beginning and end of lines
vim.keymap.set({ 'n', 'x', 'o' }, 'H', '^', { silent = true })
vim.keymap.set({ 'n', 'x', 'o' }, 'L', '$', { silent = true })

-- Leap motions (need to unbind some things set by cutlass first)
vim.keymap.del('n', 's', { silent = true })
vim.keymap.del('n', 'S', { silent = true })
vim.keymap.del('x', '"_s', { silent = true })
vim.keymap.del('x', '"_S', { silent = true })
require('leap').create_default_mappings()

-- Keep automatically inserted indentation when switching back to normal mode
vim.keymap.set('n', 'o', 'ox<backspace>', { silent = true })
vim.keymap.set('n', 'O', 'Ox<backspace>', { silent = true })
vim.keymap.set('i', '<cr>', '<cr>x<backspace>', { silent = true })

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

-- Tab navigation
vim.keymap.set('n', '<A-t>', ':tabnew<cr>', {
  silent = true,
  desc = 'New tab'
})
vim.keymap.set('n', '<A-c>', ':tabclose<cr>', {
  silent = true,
  desc = 'Close tab'
})

-- Cut keybinds
vim.keymap.set({ 'n', 'x' }, 'm', 'd', { desc = 'Cut' })
vim.keymap.set('n', 'mm', 'dd', { desc = 'Cut line' })
vim.keymap.set('n', 'M', 'D', { desc = 'Cut to end of line' })
vim.keymap.set({ 'n', 'x' }, '<leader>m', 'm', { desc = 'Set mark' })
vim.keymap.set('x', 'p', 'P') -- Prevent yank on put in visual mode

-- File search and replace
vim.keymap.set('n', '<leader>r', ':GrugFar<CR>',
  { silent = true, desc = 'Toggle Grug-Far (search and replace)' })

-- Git integration
vim.keymap.set('n', '<leader>go', function()
  vim.cmd('tabl')
  require('neogit').open()
end, { silent = true, desc = 'Open git UI page' })

vim.keymap.set('n', '<leader>gd', ':DiffviewOpen HEAD<CR>', {
  silent = true,
  desc = 'Open git diff view for all files'
})
vim.keymap.set('n', '<leader>gc', ':DiffviewOpen HEAD~1<CR>', {
  silent = true,
  desc = 'Open git diff against HEAD~1 (i.e. including last commit)'
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
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
      { buffer = ev.buf, silent = true, desc = 'LSP add workspace folder' })
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
      { buffer = ev.buf, silent = true, desc = 'LSP remove workspace folder' })
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = ev.buf, silent = true, desc = 'LSP list workspace folders' })
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition,
      { buffer = ev.buf, silent = true, desc = 'LSP go to type definition' })
    vim.keymap.set('n', '<leader>rn', function()
      return ':IncRename ' .. vim.fn.expand('<cword>')
    end, { expr = true, silent = true, desc = 'Rename LSP symbol' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
      { buffer = ev.buf, silent = true, desc = 'LSP execute code action' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references,
      { buffer = ev.buf, silent = true, desc = 'LSP go to references' })
    vim.keymap.set('n', '<leader>l', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf, silent = true, desc = 'LSP format buffer' })
    vim.keymap.set('n', '<leader>s', function()
      require('telescope.builtin').lsp_dynamic_workspace_symbols()
    end, { buffer = ev.buf, silent = true, desc = 'Search LSP symbols' })
    vim.keymap.set('n', '[e', vim.diagnostic.goto_prev,
      { buffer = ev.buf, silent = true, desc = 'Go to previous LSP diagnostic' })
    vim.keymap.set('n', ']e', vim.diagnostic.goto_next,
      { buffer = ev.buf, silent = true, desc = 'Go to next LSP diagnostic' })
    vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float,
      { buffer = ev.buf, silent = true, desc = 'Open LSP diagnostic' })
  end,
})

-- Code outline
vim.keymap.set('n', '<A-o>', function()
  local outline = require('outline')
  if outline.is_open() then
    outline.focus_toggle()
  else
    outline.open({ focus_outline = false })
  end
end, { silent = true, desc = 'Open code outline' })

-- File browser
vim.keymap.set('n', '<leader>F', ':Triptych<CR>',
  { silent = true, desc = 'Open file browser' })
