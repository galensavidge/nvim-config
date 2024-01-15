 -- Move vertically by visual line (gets around super long lines)
vim.keymap.set({'n', 'x'}, 'j', 'gj')
vim.keymap.set({'n', 'x'}, 'k', 'gk')

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

 -- Set file grep config
local ts = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', ts.find_files, {})
vim.keymap.set('n', '<leader>f', ts.live_grep, {})
vim.keymap.set('n', '<leader>b', ts.buffers, {})
vim.keymap.set('n', '<leader>h', ts.help_tags, {})
vim.keymap.set('n', '<leader>p', require('telescope').extensions.neoclip.plus)

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
