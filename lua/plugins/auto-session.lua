-- Auto-session

return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup({
      log_level = 'error',
      auto_session_suppress_dirs = { '~/', '~/Downloads', '/'},
      auto_session_use_git_branch = false,
      close_unsupported_windows = true,
      cwd_change_handling = {
        restore_upcoming_session = true,
      },
    })
  end
}
