-- General vim options
local opt = vim.opt
opt.autoindent = true
opt.autoread = true
opt.backup = false
opt.breakindent = true
opt.breakindentopt = 'shift:2'
opt.clipboard = 'unnamedplus' -- Use system clipboard by default
opt.colorcolumn = '80'
opt.diffopt = 'internal,filler,closeoff,linematch:60'
opt.expandtab = true
opt.foldcolumn = '0' -- Set to '1' to show folds by the number column.
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.formatoptions = 'cqj'
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.incsearch = true
opt.lazyredraw = true
opt.linebreak = true
opt.mouse = 'a'
opt.number = true
opt.path:append '**'
opt.relativenumber = true
opt.scrolloff = 5
opt.selection = 'old'
opt.sessionoptions = 'blank,buffers,curdir,help,tabpages,winsize,winpos,terminal,localoptions'
if vim.fn.has('windows') and not vim.fn.has('linux') then
  opt.shell = '\"C:/Program Files/PowerShell/7/pwsh.exe\"'
end
opt.shiftround = true
opt.shiftwidth = 0 -- Use value of tabstop
opt.showmode = false
opt.signcolumn = 'yes'
opt.spell = false
vim.cmd('set spellfile=~/.config/nvim/spell/en.utf-8.add')
opt.spelloptions = 'camel'
opt.spelllang = 'en_us'
opt.splitbelow = true -- Open new split panes to right and below
opt.splitkeep = 'topline'
opt.splitright = true
opt.smartcase = true
opt.smartindent = false
opt.softtabstop = -1 -- Use value of tabstop
opt.swapfile = false
opt.tabstop = 4
opt.textwidth = 79
opt.timeoutlen = 400
opt.updatetime = 250
opt.wildmenu = true
opt.wildmode = 'longest,full'
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
