-- Move vertically by visual line (gets around super long lines)
vim.keymap.set({'n', 'x'}, 'j', 'gj', { silent = true })
vim.keymap.set({'n', 'x'}, 'k', 'gk', { silent = true })

-- Move to the beginning and end of lines
vim.keymap.set({'n', 'x'}, 'H', '^', { silent = true })
vim.keymap.set({'n', 'x'}, 'L', '$', { silent = true })

-- Keep automatically inserted indentation when switching back to normal mode
vim.keymap.set('n', 'o', 'ox<backspace>', { silent = true })
vim.keymap.set('n', 'O', 'Ox<backspace>', { silent = true })
vim.keymap.set('i', '<cr>', '<cr>x<backspace>', { silent = true })

-- Split panes
vim.keymap.set('n', '<A-s>', '<C-w>s', { silent = true,
  desc = 'Split horizontal' })
vim.keymap.set('n', '<A-v>', '<C-w>v', { silent = true,
  desc = 'Split vertical' })

-- Move between panes to left/bottom/top/right
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true,
  desc = 'Move to pane to the left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true,
  desc = 'Move to pane below' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true,
  desc = 'Move to pane above' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true,
  desc = 'Move to pane to the right' })

-- Move split panes to left/bottom/top/right
vim.keymap.set('n', '<A-h>', '<C-w>H', { silent = true,
  desc = 'Move pane to the left' })
vim.keymap.set('n', '<A-j>', '<C-w>J', { silent = true,
  desc = 'Move pane down' })
vim.keymap.set('n', '<A-k>', '<C-w>K', { silent = true,
  desc = 'Move pane up' })
vim.keymap.set('n', '<A-l>', '<C-w>L', { silent = true,
  desc = 'Move pane to the right' })

-- Shortcut for equally splitting window sizes
vim.keymap.set({'n', 'x' }, '<A-=>', '<C-w>=', { silent = true,
  desc = 'Split window sizes equally' })

-- Close pane
vim.keymap.set({'n', 'x' }, '<C-c>', '<C-w>c', { silent = true,
  desc = 'Close split' })

-- Tab navigation
vim.keymap.set('n', '<A-t>', ':tabnew<cr>', { silent = true,
  desc = 'New tab' })
vim.keymap.set('n', '<A-c>', ':tabclose<cr>', { silent = true,
  desc = 'Close tab' })

-- Cut keybinds
vim.keymap.set({'n', 'x'}, 'm', 'd', { desc = 'Cut' })
vim.keymap.set('n', 'mm', 'dd', { desc = 'Cut line' })
vim.keymap.set('n', 'M', 'D', { desc = 'Cut to end of line' })
vim.keymap.set({'n', 'x'}, '<leader>m', 'm', { desc = 'Set mark'})
vim.keymap.set('x', 'p', 'P') -- Prevent yank on put in visual mode

-- Fuzzy finding keybinds
local ts = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', ts.find_files, { desc = 'Search file names' })
vim.keymap.set('n', '<leader>f', ts.live_grep, { desc = 'Search for text in files' })
vim.keymap.set('n', '<leader>w', ts.grep_string, { desc = 'Grep word under cursor' })
vim.keymap.set('n', '<leader>b', ts.buffers, { desc = 'Search buffers' })
vim.keymap.set('n', '<leader>km', ts.keymaps, { desc = 'Search keymaps' })
vim.keymap.set('n', '<leader>h', ts.help_tags, { desc = 'Search help tags' })

vim.keymap.set('n', '<leader>p', require('telescope').extensions.neoclip.plus,
  { desc = 'Search clipboard history' })
-- Search spelling suggestions
vim.keymap.set('n', '<leader>z', function()
  ts.spell_suggest(require('telescope.themes').get_cursor({}))
end)
-- Search undo tree
vim.keymap.set('n', '<leader>u', require('telescope').extensions.undo.undo, {})
vim.keymap.set('n', '<leader>e', ts.diagnostics, { desc = 'Search diagnostics' })
vim.keymap.set('n', '<leader>gb', ts.git_branches, { desc = 'Search git banches' })
vim.keymap.set('n', '<leader>bp',
  require('telescope').extensions.dap.list_breakpoints,
  { desc = 'Search breakpoints' })
vim.keymap.set('n', '<leader>S',
  require('telescope').extensions.persisted.persisted,
  { desc = 'Search sessions' })
vim.keymap.set('n', '<leader>ts', ts.builtin, { desc = 'Search Telescope pickers' })

-- File search and replace
vim.keymap.set('n', '<leader>r', ':GrugFar<CR>',
  { silent = true, desc = 'Toggle Grug-Far (search and replace)' })

-- Git integration
local gs = require('gitsigns')
vim.keymap.set('n', ']c', function()
  if vim.wo.diff then return ']c' end
    vim.schedule(function() gs.next_hunk() end)
  return '<Ignore>'
end, { expr = true, desc = 'Next git hunk' })

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then return '[c' end
    vim.schedule(function() gs.prev_hunk() end)
  return '<Ignore>'
end, { expr = true, desc = 'Previous git hunk' })

vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage git hunk' })
vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset git hunk' })
vim.keymap.set('v', '<leader>hs', function()
  gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
end, { desc = 'Stage git hunk' })
vim.keymap.set('v', '<leader>hr', function()
  gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')}
end, { desc = 'Reset git hunk' })
vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage all git hunks in buffer' })
vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo stage git hunk' })
vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset all git hunks in buffer' })
vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview git hunk' })
vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = 'Open git blame for current line' })
vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle git blame' })
vim.keymap.set('n', '<leader>hd', gs.diffthis, { desc = 'Open git diff for buffer' })
vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end)
vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { desc = 'Toggle deleted lines in git hunks' })

vim.keymap.set(
    {'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { silent = true })

vim.keymap.set('n', '<leader>go', ':Neogit<CR>', { silent = true, desc = 'Open git UI page' })

vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { silent = true,
  desc = 'Open git diff view for all files' })
vim.keymap.set('n', '<leader>gf', ':DiffviewFileHistory<CR>', { silent = true,
  desc = 'Open git diff view for history of file in current buffer' })

-- Use LspAttach autocommand to only map the following keys after the language
-- server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', function()
      return ':IncRename ' .. vim.fn.expand('<cword>')
    end, { expr = true, silent = true })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>l', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<leader>s', ts.lsp_dynamic_workspace_symbols, opts)
    vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float, opts)
  end,
})

-- Code outline
vim.keymap.set('n', '<A-o>', function()
  local outline = require('outline')
  if outline.is_open() then
    outline.focus_toggle()
  else
    outline.open({ focus_outline=false })
  end
end, { silent = true, desc = 'Open code outline'})

-- File browser
vim.keymap.set('n', '<leader>F', ':Triptych<CR>', { silent = true, desc = 'Open file browser' })

-- Debugging
vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint)
vim.keymap.set('n', '<leader>dB', function()
  return require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
vim.keymap.set('n', '<leader>dc', require('dap').continue)
vim.keymap.set('n', '<leader>di', require('dap').step_into)
vim.keymap.set('n', '<leader>do', require('dap').step_over)
vim.keymap.set('n', '<leader>dO', require('dap').step_out)
vim.keymap.set('n', '<leader>dr', require('dap').repl.toggle)
vim.keymap.set('n', '<leader>dl', require('dap').run_last)
vim.keymap.set('n', '<leader>dx', require('dap').terminate)
-- Toggle DAP UI
vim.keymap.set('n', '<leader>du', require('dapui').toggle)
