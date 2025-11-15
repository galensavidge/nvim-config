-- Set `mapleader` before lazy so mappings are correct
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.neovide then
    require('neovide')
end

vim.g.windows = vim.fn.has('win32') == 1 and vim.fn.has('linux') == 0

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
