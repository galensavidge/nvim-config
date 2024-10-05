-- Nvim-dap
-- Debugger with UI.

return {
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'mfussenegger/nvim-dap-python',
      'nvim-neotest/nvim-nio',
      'kdheepak/nvim-dap-julia',
    },
    config = function()
      local dap, dapui = require('dap'), require('dapui')

      dapui.setup({})
      require('nvim-dap-virtual-text').setup()

      -- Python debugging
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'python' }})
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

      -- Keybinds
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint,
        { desc = 'Toggle breakpoint on current line' })
      vim.keymap.set('n', '<leader>dB', function()
        return dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, { desc = 'Set conditional breakpoint on current line' })
      vim.keymap.set('n', '<leader>dc', dap.continue,
        { desc = 'Start/continue debugger' })
      vim.keymap.set('n', '<leader>di', dap.step_into,
        { desc = 'Debugger step into' })
      vim.keymap.set('n', '<leader>do', dap.step_over,
        { desc = 'Debugger step over' })
      vim.keymap.set('n', '<leader>dO', dap.step_out,
        { desc = 'Debugger step out' })
      vim.keymap.set('n', '<leader>dr', dap.repl.toggle,
        { desc = 'Debugger toggle REPL' })
      vim.keymap.set('n', '<leader>dl', dap.run_last,
        { desc = 'Debugger run last' })
      vim.keymap.set('n', '<leader>dx', dap.terminate,
        { desc = 'Stop debugger' })
      vim.keymap.set('n', '<leader>du', dapui.toggle,
        { desc = 'Toggle debugger UI' })
    end,
  },
}
