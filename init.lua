-- Bootstrap lazy.nvim if it is not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set `mapleader` before lazy so mappings are correct
vim.g.mapleader = ","

-- Set up plugins
require("lazy").setup({
  { -- Neon
    "rafamadriz/neon",
    priority = 100,
  },
  { -- Lualine
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { -- Telescope
    "nvim-telescope/telescope.nvim",
    tag = '0.1.5',
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    }, 
  },
  { -- Persisted
    "olimorris/persisted.nvim",
    config = true,
    priority = 90,
  },
  { -- Cutlass
    "svermeulen/vim-cutlass",
  },
  { -- Neoclip
    "AckslD/nvim-neoclip.lua",
    dependencies = { 
      'nvim-telescope/telescope.nvim',
    },
  },
})

-- Set color theme
vim.g.neon_style = "dark"
vim.cmd[[colorscheme neon]]

-- Set status line config
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'neon'
    -- ... your lualine config
  }
}

 ---------- CUSTOM KEYBINDS ----------
 -- Move vertically by visual line (gets around super long lines)
vim.keymap.set({'n', 'x'}, 'j', 'gj')
vim.keymap.set({'n', 'x'}, 'k', 'gk')

 -- Move between panes to left/bottom/top/right
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

 -- Move split panes to left/bottom/top/right
vim.keymap.set('n', '<A-h>', '<C-w>H')
vim.keymap.set('n', '<A-j>', '<C-w>J')
vim.keymap.set('n', '<A-k>', '<C-w>K')
vim.keymap.set('n', '<A-l>', '<C-w>L')

 -- Close panes
vim.keymap.set({'n', 'x'}, '<C-c>', '<C-w>c')

 -- Tab navigation
vim.keymap.set('n', 'tn', ':tabnew<cr>', { silent = true })
vim.keymap.set('n', 'tc', ':tabclose<cr>', { silent = true })

 -- Cut keybind
vim.keymap.set({'n', 'x'}, 'm', 'd')
vim.keymap.set('n', 'mm', 'dd')
vim.keymap.set('n', 'M', 'D')
vim.keymap.set({'n', 'x'}, '<leader>m', 'm')

-- Set file grep config
local ts = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', ts.find_files, {})
vim.keymap.set('n', '<leader>f', ts.live_grep, {})
vim.keymap.set('n', '<leader>b', ts.buffers, {})
vim.keymap.set('n', '<leader>h', ts.help_tags, {})
vim.keymap.set('n', '<leader>p', ':Telescope neoclip<cr>', { silent = true})

 -- Project/session management
require("persisted").setup({
  use_git_branch = true,
  autoload = true,
})
require('telescope').load_extension("persisted")

 -- Clipboard grep config
require('neoclip').setup({
  default_register = {'"', '+', '*'},
})

 ---------- MISC SETTINGS ----------
local opt = vim.opt
opt.autoindent = true
opt.autoread = true
opt.backup = false
opt.clipboard = "unnamedplus" -- Use system clipboard by default
opt.cursorline = true
opt.expandtab = true
opt.hlsearch = true
opt.incsearch = true
opt.number = true
opt.path:append '**'
opt.relativenumber = true
opt.scrolloff = 5
opt.shiftwidth = 4
opt.spellfile = '~/.config/nvim/en_us-custom.utf-8.add'
opt.splitbelow = true -- Open new split panes to right and below
opt.splitright = true
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.swapfile = false
opt.tabstop = 4
opt.textwidth = 80
opt.wildmenu = true
opt.wrap = true
opt.writebackup = false

