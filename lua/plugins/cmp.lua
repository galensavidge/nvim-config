 -- Load extra snippets from friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load({})

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local luasnip = require('luasnip')
local cmp = require('cmp')

cmp.setup({
  completion = { keyword_length = 1 },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  sources = cmp.config.sources({
    { name = 'codeium' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'calc' },
    -- { name = 'cmdline' },
    { name = 'buffer' },
  }),
  -- autocomplete = function()
  --   -- disable completion in comments
  --   local context = require 'cmp.config.context'
  --   -- keep command mode completion enabled when cursor is in a comment
  --   if vim.api.nvim_get_mode().mode == 'c' then
  --     return true
  --   else
  --     return not context.in_treesitter_capture("comment")
  --       and not context.in_syntax_group("Comment")
  --   end
  -- end,
  autocomplete = false,
  mapping = cmp.mapping.preset.insert({
    ['<C-A-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-A-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
     -- Accept currently selected item. Set `select` to `false` to only confirm
     -- explicitly selected items.
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
