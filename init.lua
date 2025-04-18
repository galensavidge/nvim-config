-- Set `mapleader` before lazy so mappings are correct
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set up plugins
require('lazysetup')
require('lazy').setup('plugins')

require('styling')
require('keybinds')
require('options')
require('autocmds')
require('debugprint')
