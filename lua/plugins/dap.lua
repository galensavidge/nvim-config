require('dapui').setup({})
require('nvim-dap-virtual-text').setup()

-- Python debugging
require('nvim-treesitter.configs').setup({ ensure_installed = { 'python' }})
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'

-- Open and close UI automatically
local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
