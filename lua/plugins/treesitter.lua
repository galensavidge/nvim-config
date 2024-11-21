-- Treesitter

return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'lua',
        'python',
        'c',
        'cpp',
        'julia',
        'matlab',
        'rst',
        'markdown',
        'markdown_inline',
        'git_config',
        'make',
        'toml',
        'vimdoc',
      },
    })
  end,
}
