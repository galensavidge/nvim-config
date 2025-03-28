-- Set `mapleader` before lazy so mappings are correct
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.neovide then
    require('neovide')
end

-- Set up plugins
require('lazysetup')
require('lazy').setup('plugins')

require('styling')
require('keybinds')
require('buflist')
require('send-to-terminal')
require('options')
require('autocmds')
require('debugprint')
