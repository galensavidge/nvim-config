-- Sets up theme and GUI elements.

return {
  { -- Neon (color scheme)
    'rafamadriz/neon',
    priority = 100,
  },

  { -- Lualine (status line)
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'filename' },
          lualine_c = { 'branch', 'diff', 'diagnostics' },
          lualine_x = { require('lsp-progress').progress, 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end,
  },

  { -- Tabline (tab line)
    'seblj/nvim-tabline',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('tabline').setup({
        no_name = '[No Name]', -- Name for buffers with no name
        modified_icon = '', -- Icon for showing modified buffer
        close_icon = '', -- Icon for closing tab with mouse
        separator = '▌', -- Separator icon on the left side
        padding = 1, -- Prefix and suffix space
        color_all_icons = false, -- Color devicons in active and inactive tabs
        right_separator = false, -- Show right separator on the last tab
        show_index = true, -- Shows the index of tab before filename
        show_icon = true, -- Shows the devicon
      })
    end,
  },

  { -- Minintro (intro page)
    'eoh-bse/minintro.nvim',
    opts = { color = '#989898' },
    config = true,
    lazy = false
  },

  { -- Indent-blankline (show indented blocks visually)
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
    config = function()
      require('ibl').setup({
        scope = {
          show_start = false,
          show_end = false,
        },
        exclude = {
          filetypes = {
            'lspinfo',
            'packer',
            'checkhealth',
            'help',
            'man',
            'gitcommit',
            'TelescopePrompt',
            'TelescopeResults',
            'markdown',
            '',
          },
          buftypes = {
            'terminal',
            'nofile',
            'quickfix',
            'prompt',
          },
        },
      })
    end,
  },

  { -- Virt-column (color column styling)
    'lukas-reineke/virt-column.nvim',
    config = function()
      require('virt-column').setup()
    end,
  },

  { -- Nvim-treesitter-context (show function context at the top of the screen)
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesitter-context').setup({
        enable = true,
        line_numbers = true,
        -- Line used to calculate context. Choices: 'cursor', 'topline'
        mode = 'cursor',
        -- How many lines the window should span. Values <= 0 mean no limit.
        max_lines = 1,
        -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        min_window_height = 30,
        -- Maximum number of lines to show for a single context
        multiline_threshold = 20,
        -- Which context lines to discard if `max_lines` is exceeded. Choices:
        -- 'inner', 'outer'
        trim_scope = 'outer',
      })
    end,
  },
}
