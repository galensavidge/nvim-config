-- Nvim-dap
-- Debugger with UI.

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'igorlfs/nvim-dap-view',
      'mfussenegger/nvim-dap-python',
      'nvim-neotest/nvim-nio',
      'kdheepak/nvim-dap-julia',
    },
    lazy = true,
    config = function()
      local dap = require('dap')

      -- Python debugging
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'python' } })
      require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
      require('dap-python').test_runner = 'pytest'

      -- Julia debugging
      require('nvim-dap-julia').setup()

      -- Open and close UI automatically
      dap.listeners.before.attach.dapui_config = function()
        require('dap-view').open()
      end
      dap.listeners.before.launch.dapui_config = function()
        require('dap-view').open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        require('dap-view').close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        require('dap-view').close()
      end
    end,
  },
}
