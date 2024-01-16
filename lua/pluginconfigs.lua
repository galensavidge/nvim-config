 -- Status line
require('lualine').setup({
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {require('lsp-progress').progress, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

 -- Show indented blocks visually
require('ibl').setup()

 -- Project/session management
require('persisted').setup({
  use_git_branch = true,
  autoload = true,
})
require('telescope').load_extension('persisted')

 -- Better color column
require('virt-column').setup()

 -- Git integration (show hunks, stage hunks, blame)
require('gitsigns').setup()

 -- Leap motions (need to unbind some things set by cutlass first)
vim.keymap.del('n', 's')
vim.keymap.del('n', 'S')
vim.keymap.del('x', '"_s')
require('leap').create_default_mappings()

 -- Set up language servers and completion
local lsp = require('lspconfig')

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require('cmp')
cmp.setup({
  completion = { keyword_length = 1 },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

     -- Map tab to next completion item
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

     -- Map shift-tab to next completion item
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  }),
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp.pyright.setup({capabilities = capabilities})
lsp.clangd.setup({capabilities = capabilities})

 -- Better Python syntax highlighting
vim.g.python_highlight_all = true

 -- Code outline
require('plugins.outline')

 -- File browser
require('telescope').load_extension('file_browser')

 -- Commenting
require('Comment').setup({
  ignore = '^$', -- Ignore empty lines
  toggler = {
      line = '<leader>ct', -- Line-comment toggle keymap
  },
  opleader = {
      line = '<leader>cc', -- Line-comment keymap
      block = '<leader>cb', -- Block-comment keymap
  },
  ---Enable keybindings
  mappings = {
      basic = true,
      extra = false,
  },
})
