-- Neogen.nvim
-- Annotation (e.g. docstring) template generator for multiple languages.
return {
  'danymat/neogen',
  -- Uncomment next line if you want to follow only stable versions
  version = "*",
  lazy = true,
  config = function()
    require('neogen').setup({
      languages = {
        python = {
          template = {
            annotation_convention = 'numpydoc'
          },
        },
      },
    })
  end,
}
