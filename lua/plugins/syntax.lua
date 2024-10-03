-- Code syntax highlighting.

return {
  { -- Python-syntax
    'vim-python/python-syntax',
    config = function()
      vim.g.python_highlight_all = true
    end,
  },

  { -- Julia-vim
    'julialang/julia-vim',
    config = function()
      vim.g.latex_to_unicode_auto = true
    end,
  },
}
