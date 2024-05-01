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
vim.keymap.set('n', '<A-s>', '<C-w>s', { silent = true })
vim.keymap.set('n', '<A-v>', '<C-w>v', { silent = true })

-- Move between panes to left/bottom/top/right
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

-- Move split panes to left/bottom/top/right
vim.keymap.set('n', '<A-h>', '<C-w>H', { silent = true })
vim.keymap.set('n', '<A-j>', '<C-w>J', { silent = true })
vim.keymap.set('n', '<A-k>', '<C-w>K', { silent = true })
vim.keymap.set('n', '<A-l>', '<C-w>L', { silent = true })

-- Shortcut for equally splitting window sizes
vim.keymap.set({'n', 'x'}, '<A-=>', '<C-w>=', { silent = true })

-- Close panes
vim.keymap.set({'n', 'x'}, '<C-c>', '<C-w>c', { silent = true })

-- Tab navigation
vim.keymap.set('n', '<A-t>', ':tabnew<cr>', { silent = true })
vim.keymap.set('n', '<A-c>', ':tabclose<cr>', { silent = true })

-- Cut keybind
vim.keymap.set({'n', 'x'}, 'm', 'd', { silent = true })
vim.keymap.set('n', 'mm', 'dd', { silent = true })
vim.keymap.set('n', 'M', 'D', { silent = true })
vim.keymap.set({'n', 'x'}, '<leader>m', 'm', { silent = true })
vim.keymap.set('x', 'p', 'P' , { silent = true }) -- Prevent yank on put in visual mode

-- Comment toggling
require('nvim_comment').setup({
  marker_padding = true,
  comment_empty = false,
  create_mappings = true,
  line_mapping = "gcc",
  operator_mapping = "gc",
  comment_chunk_text_object = "ic",
})

-- Set file grep config
local ts = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', ts.find_files, {})  -- Search file names
vim.keymap.set('n', '<leader>f', ts.live_grep, {})  -- Search for text in files
vim.keymap.set('n', '<leader>w', ts.grep_string, {})  -- Grep word under cursor
vim.keymap.set('n', '<leader>b', ts.buffers, {})  -- Search buffers
vim.keymap.set('n', '<leader>h', ts.help_tags, {})  -- Search help tags
 -- Search clipboard history
vim.keymap.set('n', '<leader>p', require('telescope').extensions.neoclip.plus)
 -- Search spelling suggestions
vim.keymap.set('n', '<leader>z', function()
  ts.spell_suggest(require('telescope.themes').get_cursor({}))
end)
 -- Search undo tree
vim.keymap.set('n', '<leader>u', require('telescope').extensions.undo.undo, {})
vim.keymap.set('n', '<leader>e', ts.diagnostics, {})  -- Search diagnostics
vim.keymap.set('n', '<leader>gb', ts.git_branches, {})  -- Search git banches
 -- Search breakpoints
vim.keymap.set('n', '<leader>bp',
  require('telescope').extensions.dap.list_breakpoints, {})
vim.keymap.set('n', '<leader>ts', ts.builtin, {})  -- Search pickers

 -- File find and replace
vim.keymap.set('n', '<leader>r', require('spectre').toggle,
  { desc = 'Toggle Spectre' })
vim.keymap.set('n', '<leader>R',
  function()
    require('spectre').open_visual({select_word=true})
  end,
  { desc = 'Search current word' })
vim.keymap.set('n', '<leader>rf',
  require('spectre').open_file_search,
  { desc = 'Search on current file' })
vim.keymap.set('n', '<leader>Rf',
  function()
    require('spectre').open_file_search({select_word=true})
  end,
  { desc = 'Search on current file' })

 -- Git integration
local gs = require('gitsigns')
vim.keymap.set('n', ']c', function()
  if vim.wo.diff then return ']c' end
    vim.schedule(function() gs.next_hunk() end)
  return '<Ignore>'
end, {expr=true})

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then return '[c' end
    vim.schedule(function() gs.prev_hunk() end)
  return '<Ignore>'
end, {expr=true})

vim.keymap.set('n', '<leader>hs', gs.stage_hunk)
vim.keymap.set('n', '<leader>hr', gs.reset_hunk)
vim.keymap.set('v', '<leader>hs', function()
  gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
end)
vim.keymap.set('v', '<leader>hr', function()
  gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')}
end)
vim.keymap.set('n', '<leader>hS', gs.stage_buffer)
vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk)
vim.keymap.set('n', '<leader>hR', gs.reset_buffer)
vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end)
vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame)
vim.keymap.set('n', '<leader>hd', gs.diffthis)
vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end)
vim.keymap.set('n', '<leader>td', gs.toggle_deleted)

vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { silent = true })
vim.keymap.set('n', '<leader>gf', ':DiffviewFileHistory<CR>', { silent = true })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
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
    vim.keymap.set('n', '<leader><S-e>', vim.diagnostic.open_float, opts)
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
end, { silent = true})

-- File browser
vim.keymap.set('n', '<leader>F', ':Triptych<CR>', { silent = true })

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

 -- Run snippet
vim.keymap.set('n', '<leader>S', require('sniprun').run,
{ desc = 'Run snippet' })
vim.keymap.set('x', '<leader>S', function() require('sniprun').run('v') end,
{ desc = 'Run snippet' }) -- Not working!
vim.keymap.set({'n', 'x'}, '<leader>sr', require('sniprun').reset,
{ desc = 'Reset snippet runner' })
vim.keymap.set({'n', 'x'}, '<leader>sx', require('sniprun.display').close_all,
{ desc = 'Close snippet runner' })
