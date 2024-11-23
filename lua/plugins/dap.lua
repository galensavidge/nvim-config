-- Nvim-dap
-- Debugger with UI.

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'mfussenegger/nvim-dap-python',
      'nvim-neotest/nvim-nio',
      'kdheepak/nvim-dap-julia',
    },
    lazy = true,
    config = function()
      local dap, dapui = require('dap'), require('dapui')

      dapui.setup({})
      require('nvim-dap-virtual-text').setup()

      -- Python debugging
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'python' } })
      require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
      require('dap-python').test_runner = 'pytest'

      -- Julia debugging
      require('nvim-dap-julia').setup()

      -- Open and close UI automatically
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
    end,
  },
}
