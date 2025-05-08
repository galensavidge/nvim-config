-- Nvim-dap
-- Debugger with UI.

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
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
    end,
  },
  { -- debugmaster.nvim (adds debug mode)
    "miroshQa/debugmaster.nvim",
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    lazy = true,
  },
}
