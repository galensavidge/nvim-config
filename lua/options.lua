-- General vim options
local opt = vim.opt
opt.autoindent = true
opt.autoread = true
opt.backup = false
opt.breakindent = true
opt.breakindentopt = 'shift:2'
opt.clipboard = 'unnamedplus' -- Use system clipboard by default
opt.colorcolumn = '80'
opt.expandtab = true
opt.foldlevelstart = 99
opt.foldmethod = 'manual'
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.incsearch = true
opt.lazyredraw = true
opt.mouse = 'a'
opt.number = true
opt.path:append '**'
opt.relativenumber = true
opt.scrolloff = 5
opt.selection = 'old'
opt.sessionoptions='blank,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
opt.shiftround = true
opt.shiftwidth = 0 -- Use value of tabstop
opt.showmode = false
opt.signcolumn = 'yes'
opt.spell = false
vim.cmd('set spellfile=~/.config/nvim/spell/en.utf-8.add')
opt.spelllang = 'en_us'
opt.splitbelow = true -- Open new split panes to right and below
opt.splitkeep = 'topline'
opt.splitright = true
opt.smartcase = true
opt.smartindent = false
opt.softtabstop = -1 -- Use value of tabstop
opt.swapfile = false
opt.tabstop = 4
opt.textwidth = 0 -- Don't insert newlines automatically while typing
opt.timeoutlen = 400
opt.updatetime = 250
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
  float = {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    border = 'rounded',
    source = 'always',
    prefix = ' ',
    scope = 'cursor',
  },
})
