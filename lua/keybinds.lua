local vs = require('vscode')

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

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

-- Keep automatically inserted indentation when switching back to normal mode
vim.keymap.set('n', 'o', 'ox<backspace>', { silent = true })
vim.keymap.set('n', 'O', 'Ox<backspace>', { silent = true })
vim.keymap.set('i', '<cr>', '<cr>x<backspace>', { silent = true })

-- Split panes
vim.keymap.set('n', '<A-s>', function()
  vs.action('workbench.action.splitEditorDown')
end, { silent = true, desc = 'Split horizontal' })
vim.keymap.set('n', '<A-v>', function()
  vs.action('workbench.action.splitEditor')
end, { silent = true, desc = 'Split vertical' })

-- Resize split panes
vim.keymap.set({ 'n', 'x' }, '<C-Up>', '<C-w>+', {
  silent = true,
  desc = 'Increase size of horizontal split'
})
vim.keymap.set({ 'n', 'x' }, '<C-Down>', '<C-w>-', {
  silent = true,
  desc = 'Decrease size of horizontal split'
})
vim.keymap.set({ 'n', 'x' }, '<C-Left>', '<C-w><', {
  silent = true,
  desc = 'Decrease size of vertical split'
})
vim.keymap.set({ 'n', 'x' }, '<C-Right>', '<C-w>>', {
  silent = true,
  desc = 'Increase size of vertical split'
})

-- Shortcut for equally splitting window sizes
vim.keymap.set({ 'n', 'x' }, '<A-=>', '<C-w>=', {
  silent = true,
  desc = 'Split window sizes equally'
})

-- Save all and quit
vim.keymap.set({ 'n' }, 'ZZ', function()
  vs.action('saveAll')
  vs.action('workbench.action.closeWindow')
end, { silent = true, desc = 'Save all files and quit' })

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

-- Cycle through quickfix list items
vim.keymap.set('n', ']q', ':cn<CR>', {
  silent = true,
  desc = 'Jump to next quickfix item',
})
vim.keymap.set('n', '[q', ':cp<CR>', {
  silent = true,
  desc = 'Jump to previous quickfix item',
})

-- Folds
vim.keymap.set('x', 'zf', function()
  vs.action('editor.createFoldingRangeFromSelection')
end, { silent = true, desc = 'Create fold from visual selection' })
vim.keymap.set('n', 'zc', function()
  vs.action('editor.fold')
end, { silent = true, desc = 'Fold' })
vim.keymap.set('n', 'zC', function()
  vs.action('editor.foldRecursively')
end, { silent = true, desc = 'Fold recursively' })
vim.keymap.set('n', 'zo', function()
  vs.action('editor.unfold')
end, { silent = true, desc = 'Unfold' })
vim.keymap.set('n', 'zO', function()
  vs.action('editor.unfoldRecursively')
end, { silent = true, desc = 'Unfold recursively' })
vim.keymap.set('n', 'zM', function()
  vs.action('editor.foldAll')
end, { silent = true, desc = 'Fold all' })
vim.keymap.set('n', 'zR', function()
  vs.action('editor.unfoldAll')
end, { silent = true, desc = 'Unfold all' })

-- Terminal related keybinds
vim.keymap.set('n', '<leader>t', function()
  vs.action('workbench.action.terminal.new')
end, { silent = true, desc = 'Open new terminal' })

-- Project wide search and replace
vim.keymap.set({ 'n', 'x' }, '<leader>re', function()
  vs.action('workbench.action.findInFiles')
end, { silent = true, desc = 'Open find and replace' })

-- Git integration
vim.keymap.set('n', '<leader>go', function()
  vs.action('workbench.view.scm')
end, { silent = true, desc = 'Open git UI page' })

vim.keymap.set('n', ']c', function()
  vs.action('workbench.action.editor.nextChange')
end, { silent = true, desc = 'Go to next git hunk' })

vim.keymap.set('n', '[c', function()
  vs.action('workbench.action.editor.previousChange')
end, { silent = true, desc = 'Go to previous git hunk' })

vim.keymap.set('n', ']v', function()
  vs.action('editor.action.dirtydiff.next')
end, { silent = true, desc = 'Preview next git hunk' })

vim.keymap.set('n', '[v', function()
  vs.action('editor.action.dirtydiff.previous')
end, { silent = true, desc = 'Preview previous git hunk' })

-- vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', {
--   silent = true,
-- vim.keymap.set('n', '<leader>gu', ':DiffviewOpen @{upstream}...HEAD<CR>', {
--   silent = true,
--   desc = 'Open git diff against upstream (branch point)'
-- })
-- vim.keymap.set('n', '<leader>gf', ':DiffviewFileHistory %<CR>', {
--   silent = true,
--   desc = 'Open git diff view for history of file in current buffer'
-- })

vim.keymap.set('x', '<leader>hs', function()
  vs.action('git.stageSelectedRanges')
end, { silent = true, desc = 'Stage selected range in git' })
vim.keymap.set('n', '<leader>hS', function()
  vs.action('git.stage')
end, { silent = true, desc = 'Stage the current file in git' })
vim.keymap.set('x', '<leader>hr', function()
  vs.action('git.revertSelectedRanges')
end, { silent = true, desc = 'Revert selected range in git' })

-- LSP integration
vim.keymap.set('n', 'K', function()
  vs.action('editor.action.showHover')
end, { silent = true, desc = 'LSP hover symbol' })

vim.keymap.set('n', 'gd', function()
  vs.action('editor.action.revealDefinition')
end, { silent = true, desc = 'LSP go to definition' })

-- vim.keymap.set('i', '<C-h>', function()
--   vs.action('editor.action.triggerParameterHints')
-- end, { silent = true, desc = 'Open LSP signature help' })
vim.keymap.set('n', '<leader>rn', function()
  vs.action('editor.action.rename')
end, { silent = true, desc = 'Rename LSP symbol' })
vim.keymap.set('n', '<leader>ca', function()
  vs.action('editor.action.quickFix')
end, { silent = true, desc = 'LSP execute code action' })
vim.keymap.set('n', 'gr', function()
  vs.action('references-view.findReferences')
end, { silent = true, desc = 'LSP go to references' })
vim.keymap.set('n', '<leader>l', function()
  vs.action('editor.action.format')
end, { silent = true, desc = 'LSP format buffer' })
vim.keymap.set('n', '[e', function()
  vs.action('editor.action.marker.prev')
end, { silent = true, desc = 'Go to previous LSP diagnostic' })
vim.keymap.set('n', ']e', function()
  vs.action('editor.action.marker.next')
end, { silent = true, desc = 'Go to next LSP diagnostic' })
-- vim.keymap.set('n', '<leader>E', vim.diagnostic.open_float,
--     { buffer = ev.buf, silent = true, desc = 'Open LSP diagnostic' })

-- Show suggestions
vim.keymap.set('i', '<tab>', function()
  if has_words_before() then
    vs.action('editor.action.triggerSuggest')
  else
    local key = vim.api.nvim_replace_termcodes('<tab>', true, false,
      true)
    vim.api.nvim_feedkeys(key, 'n', false)
  end
end, { silent = true, desc = 'Show suggestions' })

--  Open fuzzy finder
vim.keymap.set('n', '<leader>;', function()
  vs.action('workbench.action.quickOpen')
end, { silent = true, desc = 'Fuzzy search files' })

--  Open vscode command pallate
vim.keymap.set('n', '<leader>:', function()
  vs.action('workbench.action.showCommands')
end, { silent = true, desc = 'Open command pallate' })

-- File browser
vim.keymap.set('n', ',', function()
  vs.action('workbench.view.explorer')
end, { silent = true, desc = 'Open current file directory' })

-- Grep in project files
vim.keymap.set('n', '<leader>gg', function()
  vs.action('workbench.view.search')
end, { silent = true, desc = 'Grep (find and replace) in project files' })

-- Debugger
vim.keymap.set('n', '<leader>db', function()
  vs.action('editor.debug.action.toggleBreakpoint')
end, { desc = 'Toggle breakpoint on current line' })

vim.keymap.set('n', '<leader>dB', function()
  vs.action('editor.debug.action.conditionalBreakpoint')
end, { desc = 'Set conditional breakpoint on current line' })

vim.keymap.set('n', '<leader>dc', function()
  vs.action('workbench.action.debug.start')
  vs.action('workbench.action.debug.continue')
end, { desc = 'Start/continue debugger' })

vim.keymap.set('n', '<leader>di', function()
  vs.action('workbench.action.debug.stepInto')
end, { desc = 'Debugger step into' })

vim.keymap.set('n', '<leader>do', function()
  vs.action('workbench.action.debug.stepOver')
end, { desc = 'Debugger step over' })

vim.keymap.set('n', '<leader>dO', function()
  vs.action('workbench.action.debug.stepOut')
end, { desc = 'Debugger step out' })

vim.keymap.set('n', '<leader>dr', function()
  vs.action('workbench.debug.action.toggleRepl')
end, { desc = 'Debugger toggle REPL' })

-- vim.keymap.set('n', '<leader>dl', function()
--   require('dap').run_last()
-- end, { desc = 'Debugger run last' })

vim.keymap.set('n', '<leader>dx', function()
  vs.action('workbench.action.debug.stop')
end, { desc = 'Stop debugger' })

-- Create new file from the path under the cursor
-- vim.keymap.set('n', '<leader>nf', function()
--   -- Clear the f register.
--   vim.cmd('let @f=""')

--   -- Copy the word within parentheses.
--   vim.cmd.normal('"fyib')

--   local path = vim.fn.getreg('f')

--   if string.len(path) == 0 then
--     return
--   end

--   if string.sub(path, 1, 1) ~= ('~') then
--     -- Get the path to the directory containing the current file.
--     local filepath = vim.fn.expand('%')
--     filepath = vim.fn.fnamemodify(filepath, ':h')
--     path = filepath .. '/' .. path
--     path = vim.fn.resolve(path)
--   end

--   path = vim.fn.expand(path)

--   vim.cmd('! mkdir -p "$(dirname "' .. path .. '")" && touch "' .. path .. '"')
--   vim.cmd('e ' .. path)
-- end, { silent = true, desc = 'Create new file from path under cursor' })

-- Annotations
vim.keymap.set('n', '<leader>a', function()
  require('neogen').generate()
end, { silent = true, desc = 'Add annotation' })

vim.keymap.set('i', '<C-l>', function()
  require('neogen').jump_next()
end, { desc = 'Jump to next placeholder in annotation' })

vim.keymap.set('i', '<C-h>', function()
  require('neogen').jump_prev()
end, { desc = 'Jump to previous placeholder in annotation' })

-- Toggle joining lines
vim.keymap.set({ 'n', 'x' }, '<leader>j', function()
  require('treesj').toggle()
end, { desc = 'Toggle splitting/joining lines by delimiter' })
