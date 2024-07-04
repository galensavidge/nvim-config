-- Sets up language server protocol (LSP) extensions.

return {
  { -- Lspconfig
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Set up pyright for Python code analysis
      lsp.pyright.setup({
        capabilities = capabilities,
        settings = {},
      })

      -- Ruff for Python linting and formatting
      lsp.ruff.setup({ on_attach = on_attach })

      -- Set up clangd for C/++ code analysis
      lsp.clangd.setup({ capabilities = capabilities })

      -- Set up julials for Julia code analysis
      lsp.julials.setup({
        capabilities = capabilities,

        cmd = {
          'julia',
          '--startup-file=no',
          '--history-file=no',
          '-e',
          [[
            # Load LanguageServer.jl: attempt to load from ~/.julia/environments/nvim-lspconfig
            # with the regular load path as a fallback
            ls_install_path = joinpath(
                get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")),
                "environments", "nvim-lspconfig"
            )
            pushfirst!(LOAD_PATH, ls_install_path)
            using LanguageServer
            popfirst!(LOAD_PATH)
            depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
            project_path = pwd()
            @info "Running language server" VERSION pwd() project_path depot_path
            server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)
            server.runlinter = true
            run(server)
          ]],
        },

        filetypes = { 'julia' },

        root_dir = function(fname)
          return vim.fn.getcwd()
        end,

        single_file_support = true,
      })
    end,
  },

  { -- Null-ls (LSP "server" which allows for integration of formatters and
    -- linters into the built-in LSP framework)
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Set up code auto-formatting
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.eslint,
        },
      })
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
      floating_window = false, -- Virtual text only
      hint_prefix = {
          above = "↙ ",
          current = "← ",
          below = "↖ ",
      },
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)
    end,
  },
}
