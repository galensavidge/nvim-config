-- Custom buffer list in vim.ui.select.

local M = {}

local function buf_info_from_line(s)
  local o = {}

  o.id = tonumber(vim.split(s, " ", { trimempty = true })[1])
  o.classifiers = s:sub(4, 8)

  local ss = s:find('"')
  local se = #s - s:reverse():find('"')

  local path = vim.fs.normalize(s:sub(ss + 1, se))
  local cwd = vim.fn.getcwd() .. '/'
  o.path = path:gsub(cwd, "")
  o.name = vim.fs.basename(o.path)

  return o
end

local function get_buffers()
  local bufs_out = vim.api.nvim_exec2("ls", { output = true }).output
  local bufs = vim.split(bufs_out, "\n", { trimempty = true })
  return vim.tbl_map(buf_info_from_line, bufs)
end

function M.open_buf_picker()
  local bufs = get_buffers()
  if #bufs == 0 then
    return
  end

  local function display(item)
    return item.name .. ' — ' .. vim.fs.dirname(item.path)
  end

  local opts = { prompt = 'Buffers', format_item = display }

  local function choice(buf, idx)
    return vim.api.nvim_win_set_buf(0, buf.id)
  end

  vim.ui.select(bufs, opts, choice)
end

vim.keymap.set('n', ';', M.open_buf_picker,
  { silent = true, desc = 'Open buffer picker' })

return M
