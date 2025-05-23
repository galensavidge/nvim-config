local current_signature = function()
  if not pcall(require, 'lsp_signature') then return end
  local sig = require('lsp_signature').status_line(vim.o.columns * 2 / 3)
  if vim.fn.mode() == 'i' then
    return sig.label
  else
    return ""
  end
end

return {
  { -- Nightfall (color scheme)
    '2giosangmitom/nightfall.nvim',
    lazy = false,
    priority = 1000,
    opts = {}, -- Add custom configuration here
    config = function(_, opts)
      require('nightfall').setup(opts)
      vim.cmd('colorscheme nightfall') -- Choose from: nightfall, deeper-night, maron, nord
    end,
  },

  { -- Lualine (status line)
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'bwpge/lualine-pretty-path',
    },
    config = function()
      local dmode_enabled = false
      vim.api.nvim_create_autocmd('User', {
        pattern = 'DebugModeChanged',
        callback = function(args)
          dmode_enabled = args.data.enabled
        end
      })
      require('lualine').setup({
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str) return dmode_enabled and 'DEBUG' or str end,
              -- color = function(tb) return dmode_enabled and 'dCursor' or tb end,
            },
          },
          lualine_b = { 'pretty_path' },
          lualine_c = { 'branch', 'diff', 'diagnostics' },
          lualine_x = { current_signature },
          lualine_y = { require('lsp-progress').progress, 'filetype' },
          lualine_z = { 'progress', 'location' }
        },

        options = { theme = 'nightfall', globalstatus = true },
        extensions = { 'quickfix', 'oil', 'nvim-dap-ui' },
      })
    end,
  },

  { -- Incline.nvim (floating status line)
    'b0o/incline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local helpers = require('incline.helpers')
      local devicons = require('nvim-web-devicons')
      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
          overlap = { borders = true, winbar = true },
          zindex = 10,
        },
        hide = { cursorline = true, },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename, gui = modified and 'italic' or '' },
            ' ',
            guibg = '#484d67',
          }
        end,
      }
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

  -- { -- Indent-blankline (show indented blocks visually)
  --   'lukas-reineke/indent-blankline.nvim',
  --   main = 'ibl',
  --   opts = {},
  --   config = function()
  --     require('ibl').setup({
  --       scope = {
  --         show_start = false,
  --         show_end = false,
  --       },
  --       exclude = {
  --         filetypes = {
  --           'lspinfo',
  --           'packer',
  --           'checkhealth',
  --           'help',
  --           'man',
  --           'gitcommit',
  --           'TelescopePrompt',
  --           'TelescopeResults',
  --           'markdown',
  --           '',
  --         },
  --         buftypes = {
  --           'terminal',
  --           'nofile',
  --           'quickfix',
  --           'prompt',
  --         },
  --       },
  --     })
  --   end,
  -- },

  -- { -- Virt-column (color column styling)
  --   'lukas-reineke/virt-column.nvim',
  --   config = function()
  --     require('virt-column').setup()
  --   end,
  -- },

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
        zindex = 5,
      })
    end,
  },

  { -- FastAction.nvim (better vim.ui.select)
    'Chaitanyabsprip/fastaction.nvim',
    config = function()
      require('fastaction').setup({
        dismiss_keys = { '<esc>' },
        keys = "qwertyuiopasdfghjklzxcvbnm",
        popup = {
          relative = 'cursor',
        },
        register_ui_select = true,
      })
    end
  }
}
