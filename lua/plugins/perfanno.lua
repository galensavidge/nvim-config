-- Perfanno.nvim
-- Lua performance profiling.
return {
  {
    't-troebst/perfanno.nvim',
    config = function()
      require("perfanno").setup()
    end,
  },
}
