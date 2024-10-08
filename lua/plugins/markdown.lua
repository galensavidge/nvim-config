-- Markdown
-- Markdown viewer.
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },

  ft = { 'markdown', 'rst' },

  config = function()
    require('render-markdown').setup({
      render_modes = true, -- Render in all modes

      heading = { position = 'inline' },

      -- Extend quotes for wrapped lines.
      quote = { repeat_linebreak = true },
      win_options = {
        showbreak = { default = '', rendered = '  ' },
        breakindent = { default = false, rendered = true },
        breakindentopt = { default = '', rendered = '' },
      },

      code = {
        -- Turn on / off code block & inline code rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = false,
        -- Determines how code blocks & inline code are rendered:
        --  none: disables all rendering
        --  normal: adds highlight group to code blocks & inline code, adds
        --  padding to code blocks
        --  language: adds language icon to sign column if enabled and icon +
        --  name above code blocks
        --  full: normal + language
        style = 'full',
        width = 'block',
        left_pad = 2,
        right_pad = 4,
        -- Determins how the top / bottom of code block are rendered:
        --  thick: use the same highlight as the code body
        --  thin: when lines are empty overlay the above & below icons
        border = 'thin',
        -- Used above code blocks for thin border
        above = '▄',
        -- Used below code blocks for thin border
        below = '▀',
        -- Highlight for code blocks & inline code
        -- highlight = 'CursorLine',
        min_width = 79,
        position = 'right',
      },

      latex = {
        enabled = true,
        converter = 'latex2text',
        highlight = 'RenderMarkdownMath',
        top_pad = 0,
        bottom_pad = 0,
      },

      -- Disable code block background and padding when in a LSP floating
      -- window.
      overrides = {
        buftype = {
          nofile = {
            padding = { highlight = 'NormalFloat' },
            code = {
              left_pad = 0,
              right_pad = 0,
              highlight = 'RenderMarkdownCodeHover',
              sign = false,
            },
          },
        },
        filetype = {},
      },
    })

    vim.keymap.set('n', '<leader>mv', ':RenderMarkdown toggle<cr>',
      { silent = true, desc = 'Toggle markdown viewer' })
  end
}
