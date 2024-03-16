 -- Move vertically by visual line (gets around super long lines)
vim.keymap.set({'n', 'x'}, 'j', 'gj')
vim.keymap.set({'n', 'x'}, 'k', 'gk')

-- Keep automatically inserted indentation when switching back to normal mode
vim.keymap.set('n', 'o', 'ox<backspace>', { silent = true })
vim.keymap.set('n', 'O', 'Ox<backspace>', { silent = true })
vim.keymap.set('i', '<cr>', '<cr>x<backspace>', { silent = true })

-- Split panes
vim.keymap.set('n', '<A-s>', '<C-w>s')
vim.keymap.set('n', '<A-v>', '<C-w>v')

-- Move between panes to left/bottom/top/right
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Move split panes to left/bottom/top/right
vim.keymap.set('n', '<A-h>', '<C-w>H')
vim.keymap.set('n', '<A-j>', '<C-w>J')
vim.keymap.set('n', '<A-k>', '<C-w>K')
vim.keymap.set('n', '<A-l>', '<C-w>L')

-- Shortcut for equally splitting window sizes
vim.keymap.set({'n', 'x'}, '<A-=>', '<C-w>=')

-- Close panes
vim.keymap.set({'n', 'x'}, '<C-c>', '<C-w>c')

-- Tab navigation
vim.keymap.set('n', 'tn', ':tabnew<cr>', { silent = true })
vim.keymap.set('n', 'tc', ':tabclose<cr>', { silent = true })

-- Cut keybind
vim.keymap.set({'n', 'x'}, 'm', 'd')
vim.keymap.set('n', 'mm', 'dd')
vim.keymap.set('n', 'M', 'D')
vim.keymap.set({'n', 'x'}, '<leader>m', 'm')
vim.keymap.set('x', 'p', 'P')  -- Prevent yank on put in visual mode

-- Commenting
require('Comment').setup({
  ignore = '^$', -- Ignore empty lines
  toggler = {
      line = '<leader>ct', -- Line-comment toggle keymap
  },
  opleader = {
      line = '<leader>cc', -- Line-comment keymap
      block = '<leader>cb', -- Block-comment keymap
  },
  -- Enable keybindings
  mappings = {
      basic = true,
      extra = false,
  },
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
vim.keymap.set('n', '<leader>e', ts.diagnostics, {})  -- Search diagnostics
vim.keymap.set('n', '<leader>gb', ts.git_branches, {})  -- Search git banches
vim.keymap.set('n', '<leader>ts', ts.builtin, {})  -- Search pickers

 -- File find and replace
vim.keymap.set('n', '<leader>r', require("spectre").toggle,
  { desc = "Toggle Spectre" })
vim.keymap.set('n', '<leader>R',
  function()
    require("spectre").open_visual({select_word=true})
  end,
  { desc = "Search current word" })
vim.keymap.set('n', '<leader>rf',
  require("spectre").open_file_search,
  { desc = "Search on current file" })
vim.keymap.set('n', '<leader>Rf',
  function()
    require("spectre").open_file_search({select_word=true})
  end,
  { desc = "Search on current file" })

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
    local opts = { buffer = ev.buf }
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
vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>')

-- File browser
vim.keymap.set('n', '<leader>F', ':Triptych<CR>', { silent = true })

-- Codeium AI
vim.keymap.set('i', '<C-k>', function()
    return vim.fn['codeium#Accept']()
  end, { expr = true, silent = true })
vim.keymap.set('i', '<C-n>', function()
    return vim.fn['codeium#CycleCompletions'](1)
  end, { expr = true, silent = true })
vim.keymap.set('i', '<C-p>', function()
    return vim.fn['codeium#CycleCompletions'](-1)
  end, { expr = true, silent = true })
vim.keymap.set('i', '<C-x>', function()
    return vim.fn['codeium#Clear']()
  end, { expr = true, silent = true })

-- Debugging
vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint)
vim.keymap.set('n', '<leader>dB', function()
  return require('dap').set_breakpoint(vim.fn.input("Breakpoint condition: "))
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
