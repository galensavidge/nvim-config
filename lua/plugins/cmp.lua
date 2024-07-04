-- Nvim-cmp
-- Handles completion from LSP and other sources.

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-calc',
      'onsails/lspkind.nvim',  -- Show pictograms in LSP suggestions
    },
    config = function()
      local misc = require('cmp.utils.misc')
      local keymap = require('cmp.utils.keymap')

      -- Load extra snippets from friendly-snippets
      require('luasnip.loaders.from_vscode').lazy_load({})

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      local function merge_keymaps(base, override)
        local normalized_base = {}
        for k, v in pairs(base) do
          normalized_base[keymap.normalize(k)] = v
        end

        local normalized_override = {}
        for k, v in pairs(override) do
          normalized_override[keymap.normalize(k)] = v
        end

        return misc.merge(normalized_base, normalized_override)
      end

      local luasnip = require('luasnip')
      local cmp = require('cmp')
      local lspkind = require('lspkind')

      cmp.setup({
        completion = { keyword_length = 1, autocomplete = false },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },

        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'calc' },
          -- { name = 'cmdline' },
          { name = 'buffer' },
        }),

        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol',

            -- prevent the popup from showing more than provided characters (e.g
            -- 50 will not show more than 50 characters)
            maxwidth = 50,

            -- when popup menu exceed maxwidth, the truncated part would show
            -- ellipsis_char instead (must define maxwidth first)
            ellipsis_char = '...',

            -- The function below will be called before any actual modifications
            -- from lspkind so that you can provide more controls on popup
            -- customization. (See
            -- [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
              return vim_item
            end
          }),
        },

        mapping = merge_keymaps({}, {
          ['<C-A-k>'] = cmp.mapping.scroll_docs(-4),
          ['<C-A-j>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          -- Accept currently selected item. Set `select` to `false` to only
          -- confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm({ select = false }),

          -- Map tab to next completion item
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),

          -- Map shift-tab to next completion item
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          -- Map <c-l> to jump to the next location in the snippet
          ['<C-l>'] = cmp.mapping(function(fallback)
            -- You could replace the expand_or_jumpable() calls with
            -- expand_or_locally_jumpable()
            -- that way you will only jump inside the snippet region
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),

          -- Map <c-h> to jump to the previous location in the snippet
          ['<C-h>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
      })
    end,
  },

  { -- LuaSnip (snippet engine)
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
  },
}
