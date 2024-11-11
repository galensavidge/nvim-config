-- Code syntax highlighting.

return {
  { -- Python-syntax
    'vim-python/python-syntax',
    config = function()
      vim.g.python_highlight_all = true
    end,
  },
}
