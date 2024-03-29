-- General vim options
local opt = vim.opt
opt.autoindent = true
opt.autoread = true
opt.backup = false
opt.breakindent = true
opt.breakindentopt = "shift:2"
opt.clipboard = "unnamedplus" -- Use system clipboard by default
opt.colorcolumn = '80'
opt.cursorline = true
opt.expandtab = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.mouse = 'a'
opt.number = true
opt.path:append '**'
opt.relativenumber = true
opt.scrolloff = 5
opt.selection = "old"
opt.shiftround = true
opt.shiftwidth = 0 -- Use value of tabstop
opt.signcolumn = 'yes'
opt.spell = false
vim.cmd('set spellfile=~/.config/nvim/spell/en.utf-8.add')
opt.spelllang = 'en_us'
opt.splitbelow = true -- Open new split panes to right and below
opt.splitright = true
opt.smartcase = true
opt.smartindent = false
opt.softtabstop = -1 -- Use value of tabstop
opt.swapfile = false
opt.tabstop = 4
opt.textwidth = 0 -- Don't insert newlines automatically while typing
opt.timeoutlen = 400
opt.wildmenu = true
opt.wrap = true
opt.writebackup = false

-- Change how diagnostics are displayed
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
