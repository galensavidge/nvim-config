-- Set debug print keybinds in a few languages

local function julia_debug_comment(ev, word)
  local line_num = vim.api.nvim_win_get_cursor(0)[1]
  local indent = vim.fn.indent(line_num)
  local spaces = string.rep(" ", indent)
  local messages = {
    spaces .. 'println("At ' .. ev.file .. ':' .. line_num .. ':")',
    spaces .. 'println("    ' .. word .. ' = $(' .. word .. ')")' }
  vim.api.nvim_buf_set_lines(ev.buf, line_num, line_num, true, messages)
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'julia' },
  callback = function(ev)
    vim.keymap.set({ 'n' }, '<leader>P', function()
        local word = vim.fn.expand('<cword>')
        julia_debug_comment(ev, word)
      end,
      { buffer = ev.buf, silent = true, desc = 'Add debug print message' })

    -- vim.keymap.set({ 'n' }, '<leader>dP', function()
    --     local word = vim.fn.expand('<cWORD>')
    --     julia_debug_comment(ev, word)
    --   end,
    --   { buffer = ev.buf, silent = true, desc = 'Add debug print message' })

    vim.keymap.set({ 'x' }, '<leader>P', function()
        local word = table.concat(vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.')), ' ')
        julia_debug_comment(ev, word)
        vim.api.nvim_input('<esc>')
      end,
      { buffer = ev.buf, silent = true, desc = 'Add debug print message' })
  end,
})

local function python_debug_comment(ev, word)
  local line_num = vim.api.nvim_win_get_cursor(0)[1]
  local indent = vim.fn.indent(line_num)
  local spaces = string.rep(" ", indent)
  local messages = {
    spaces .. 'print("At ' .. ev.file .. ':' .. line_num .. ':")',
    spaces .. 'print(f"    ' .. word .. ' = {' .. word .. '}")' }
  vim.api.nvim_buf_set_lines(ev.buf, line_num, line_num, true, messages)
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python' },
  callback = function(ev)
    vim.keymap.set({ 'n' }, '<leader>P', function()
        local word = vim.fn.expand('<cword>')
        python_debug_comment(ev, word)
      end,
      { buffer = ev.buf, silent = true, desc = 'Add debug print message' })

    -- vim.keymap.set({ 'n' }, '<leader>dP', function()
    --     local word = vim.fn.expand('<cWORD>')
    --     python_debug_comment(ev, word)
    --   end,
    --   { buffer = ev.buf, silent = true, desc = 'Add debug print message' })

    vim.keymap.set({ 'x' }, '<leader>P', function()
        local word = table.concat(vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.')), ' ')
        python_debug_comment(ev, word)
        vim.api.nvim_input('<esc>')
      end,
      { buffer = ev.buf, silent = true, desc = 'Add debug print message' })
  end,
})
