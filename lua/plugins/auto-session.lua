-- Auto-session

return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup({
      log_level = 'error',
      auto_session_suppress_dirs = { '~/', '~/Downloads', '/' },
      auto_session_use_git_branch = false,
      close_unsupported_windows = true,
      cwd_change_handling = {
        restore_upcoming_session = true,
      },
      session_lens = {
        load_on_setup = false, -- Initialize on startup (requires Telescope)
        theme_conf = {        -- Pass through for Telescope theme options
          -- layout_config = { -- As one example, can change width/height of picker
          --   width = 0.8,    -- percent of window
          --   height = 0.5,
          -- },
        },
      },
    })
  end
}
