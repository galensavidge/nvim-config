-- Set `mapleader` before lazy so mappings are correct
vim.g.mapleader = ','

if vim.g.neovide then
    require('neovide')
end

-- Set up plugins
require('lazysetup')
require('lazy').setup('plugins')

require('plugins')
require('styling')
require('keybinds')
require('options')
require('pluginconfigs')
require('autocmds')
