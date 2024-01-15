 -- Project/session management
require("persisted").setup({
  use_git_branch = true,
  autoload = true,
})
require('telescope').load_extension("persisted")

 -- Better color column
require("virt-column").setup()

 -- Git integration (show hunks, stage hunks, blame)
require('gitsigns').setup()
