-- Define a keymap to execute selected lines in the terminal buffer.

local M = {}

M.terminal_send_cmd = function(cmds_table)
  local function get_first_terminal()
    local terminal_chans = {}
    for _, chan in pairs(vim.api.nvim_list_chans()) do
      if chan["mode"] == "terminal" and chan["pty"] ~= "" then
        table.insert(terminal_chans, chan)
      end
    end
    table.sort(terminal_chans, function(left, right)
      return left["buffer"] < right["buffer"]
    end)
    if #terminal_chans == 0 then
      return nil
    end
    return terminal_chans[#terminal_chans]["id"]
  end

  local send_to_terminal = function(terminal_chan, term_cmds_table)
    if type(term_cmds_table) == 'string' then
      term_cmds_table = { term_cmds_table }
    end
    for ii, cmd in pairs(term_cmds_table) do
      if #cmd > 0 then
        vim.api.nvim_chan_send(terminal_chan, cmd .. "\n")
      end
    end
  end

  local terminal = get_first_terminal()
  if not terminal then
    return nil
  end

  send_to_terminal(terminal, cmds_table)
end

vim.keymap.set('n', '<leader><Enter>', function()
  local line = vim.api.nvim_get_current_line()
  M.terminal_send_cmd(line)
end, { silent = true, desc = 'Send current line to terminal' })

vim.keymap.set('x', '<leader><Enter>', function()
  local vstart = vim.fn.getpos('v')
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line_start = math.min(vstart[2], cursor[1])
  local line_end = math.max(vstart[2], cursor[1])
  local lines = vim.fn.getline(line_start, line_end)
  M.terminal_send_cmd(lines)
end, { silent = true, desc = 'Send selected lines to terminal' })

return M
