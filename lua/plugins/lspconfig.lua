-- Sets up language server protocol (LSP) extensions.

return {
  { -- Lspconfig
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require('lspconfig')
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities,
        require('cmp_nvim_lsp').default_capabilities())

      -- Set up lua-lanaguage-server
      require('lspconfig').lua_ls.setup({
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths here.
                -- '${3rd}/luv/library'
                -- '${3rd}/busted/library',
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file('', true)
            }
          })
        end,
        settings = {
          Lua = {}
        }
      })

      -- Set up pyright for Python code analysis
      lsp.pyright.setup({
        capabilities = capabilities,
        settings = {},
      })

      -- Ruff for Python linting and formatting
      local ruff_config = lsp.ruff.config_def
      ruff_config.cmd = { 'ruff', 'server', '--preview' }
      ruff_config.default_config.cmd = { 'ruff', 'server', '--preview' }

      local configs = require('lspconfig.configs')
      configs.custom_ruff = ruff_config
      lsp.custom_ruff.setup(ruff_config)

      -- Set up clangd for C/++ code analysis
      lsp.clangd.setup({ capabilities = capabilities })

      -- Set up julials for Julia code analysis
      lsp.julials.setup({
        capabilities = capabilities,
      })

      -- Set up ltex-ls for LaTeX, RST, and others
      -- require('lspconfig').ltex.setup({ capabilities = capabilities })
    end,
  },

  { -- LSP-progress (shows LSP progress in the status bar)
    'linrongbin16/lsp-progress.nvim',
    config = function()
      require('lsp-progress').setup()
    end
  },

  { -- Inc-rename (show LSP symbol rename incrementally while typing)
    'smjonas/inc-rename.nvim',
    event = 'VeryLazy',
    config = function()
      require('inc_rename').setup()
    end,
  },

  { -- Lsp-signature
    'ray-x/lsp_signature.nvim',
    lazy = false,
    opts = {
      floating_window = true, -- Enable floating window
      floating_window_above_cur_line = true,
      hint_enable = false,    -- Disable virtual text
      hint_prefix = {
        above = '↙ ',
        current = '← ',
        below = '↖ ',
      },
      handler_opts = {
        border = 'rounded'
      },
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
}
