local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Set up pyright for Python code analysis
lsp.pyright.setup({
  capabilities = capabilities,
  settings = {},
})

-- Set up clangd for C/++ code analysis
lsp.clangd.setup({capabilities = capabilities})

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
