" ---------- PLUGINS ----------

call plug#begin('~/.local/share/nvim/plugged')

Plug 'sonph/onehalf', { 'rtp': 'vim' }  " Theme
Plug 'vim-airline/vim-airline'  " Better status bar
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP interface
Plug 'vim-python/python-syntax' " Better python syntax highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight' " Better C++ syntax highlighting
Plug 'JuliaEditorSupport/julia-vim'  " Julia support
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'         " Fuzzy finder for searching for and in files
Plug 'preservim/nerdtree'       " File tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'  " Shortcuts for block commenting
Plug 'airblade/vim-gitgutter'   " Git change highlighting
Plug 'APZelos/blamer.nvim'      " Git blame similar to gitlens
Plug 'svermeulen/vim-cutlass'   " Don't copy when deleting
Plug 'svermeulen/vim-yoink'     " Yank history
Plug 'svermeulen/vim-subversive'     " Quick substitutions
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'          " Shortcuts to manage markdown note files
Plug 'xolox/vim-session'        " Better session management
Plug 'machakann/vim-highlightedyank' " Briefly highlight which text was yanked.
Plug 'haya14busa/is.vim' " Automatically clear search highlights after you move your cursor.
Plug 'unblevable/quick-scope'   " Highlight a unique letter in each word

call plug#end()

" Color scheme
set t_Co=256            " 256 colors
set cursorline
" Set terminal colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme onehalfdark
set background=dark

" Airline settings
let g:airline_extensions = ['coc', 'fzf', 'hunks', 'keymap', 'netrw', 'quickfix', 'term', 'whitespace',  'wordcount']
let g:airline_theme='onehalfdark'

" Python Syntax settings
let g:python_highlight_all = 1

" Fzf settings
" let g:fzf_layout = { 'window': '15new' }
" let g:fzf_nvim_statusline = 0
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Keyword'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Keyword'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Function'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Function'],
  \ 'header':  ['fg', 'Comment'] }

" Gitgutter settings
let g:gitgutter_preview_win_floating = 0

" Blamer settings
let g:blamer_enabled = 0
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_date_format = '%m/%d/%y %H:%M'

" Yoink settings
let g:yoinkIncludeDeleteOperations = 1
" let g:yoinkSavePersistently = 1

" Vim Session settings
set sessionoptions-=buffers
set sessionoptions-=curdir
" Automatically save session at exit and load at startup
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_verbose_messages = 0

" HighlightYanked settings
let g:highlightedyank_highlight_duration = 250
let g:highlightedyank_highlight_in_visual = 0

" Quickscope settings
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary gui=underline cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary gui=underline cterm=underline
augroup END

" ---------- MISC VIM OPTIONS ----------

set nocompatible              " be iMproved, required
set encoding=utf-8

" Don't leave ~ files
set nobackup
set nowritebackup
set noundofile
set swapfile
set dir=~/tmp

" Numbering
set number
set relativenumber
set signcolumn=yes

" Mouse behavior
set mouse=a

" Tab options
set tabstop=4
" set softtabstop=4
set shiftwidth=4
set smarttab
autocmd FileType markdown setlocal ts=4 sw=4
autocmd FileType python setlocal ts=4 sw=4
autocmd FileType yaml setlocal ts=2 sw=2
autocmd FileType proto setlocal ts=2 sw=2
autocmd FileType rst setlocal ts=3 sw=3

" Indentation
set autoindent
set copyindent
set expandtab
filetype plugin indent on

" Search case sensitivity
set ignorecase
set smartcase

" Let me know where 80 columns is
if exists('+colorcolumn')
    set colorcolumn=80
endif

" Visual word wrapping
set linebreak
" Autowrap lines at 80 columns
" set textwidth=79

" Syntax highlighting
syntax on

" Custom syntax highlighting
autocmd BufNewFile,BufEnter,BufRead *.sim set syntax=yaml filetype=yaml
autocmd BufNewFile,BufEnter,BufRead *.mc set syntax=yaml filetype=yaml
autocmd BufNewFile,BufEnter,BufRead *.script set syntax=matlab filetype=matlab
" Arcanist diffs
autocmd BufNewFile,BufEnter,BufRead *new-commit set syntax=markdown
autocmd BufNewFile,BufEnter,BufRead *differential-update-comments set syntax=markdown

" Custom dictionary
set spellfile=~/.config/nvim/en_us-custom.utf-8.add

" Spell checking
autocmd Syntax markdown setlocal spell spelllang=en_us
autocmd Syntax rst setlocal spell spelllang=en_us
autocmd Syntax gitcommit setlocal spell spelllang=en_us

" Change spelling error highlighting
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl

" Julia syntax highlighting colors
hi link juliaFunction Function
hi link juliaFunctionDef juliaFunction
hi link juliaFunctionCall juliaFunction

" Better backspace
set backspace=2

" Map leader to comma
let mapleader = ","

" Open new split panes to right and below
set splitright
set splitbelow

" Use system clipboard by default
set clipboard=unnamedplus

" Trigger autoread when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Delete trailing white space in various languages
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" ---------- CUSTOM KEYBINDS ----------
" Esc exits terminal
" tnoremap <Esc> <C-\><C-n>

" Move vertically by visual line (gets around super long lines)
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" Tab navigation
nnoremap <silent> tn :tabnew<cr>
nnoremap <silent> tc :tabclose<cr>

" Move split panes to left/bottom/top/right
nnoremap <A-h> <C-w>H
nnoremap <A-j> <C-w>J
nnoremap <A-k> <C-w>K
nnoremap <A-l> <C-w>L
" tnoremap <A-h> <C-\><C-N><C-w>h
" tnoremap <A-j> <C-\><C-N><C-w>j
" tnoremap <A-k> <C-\><C-N><C-w>k
" tnoremap <A-l> <C-\><C-N><C-w>l

" Split panes
nnoremap <A-s> <C-w>s
nnoremap <A-v> <C-w>v

" Shortcut for equally splitting window sizes
nnoremap <A-=> <C-w>=

" Move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Close panes
nnoremap <C-c> <C-w>c

" File tree bind
noremap <silent> <leader>nt :NERDTreeToggle<CR>
noremap <silent> <leader>nf :NERDTreeFind<CR>

" Fzf binds
nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>

" Toggle git blame
noremap <silent> <leader>gb :call BlamerToggle()<cr>

" Rebind cut operator to m since d does not copy
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

" Yank and put binds for Yoink
nmap <leader>yp <plug>(YoinkPostPasteSwapBack)
nmap <leader>yn <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

" Rebind visual mode put to not also yank
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)

" COC format keybinds
nnoremap <silent> <leader>l :Format<cr>
nnoremap <silent> <leader>o :OR<cr>

" ---------- COC CONFIG ----------

" Custom colors for autocomplete suggestion box
hi link CocSearch String
hi link CocFloating PmenuSbar

" Extension list
let g:coc_global_extensions = ['coc-pyright', 'coc-json', 'coc-protobuf'] " , 'coc-julia']

" Turn on semantic highlighting (experimental)
let g:coc_default_semantic_highlight_groups = 1

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Bind <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ---------- NERDCOMMENTER ----------
let g:NERDCreateDefaultMappings = 1
" Toggle comment bind
map <C-/> <plug>NERDCommenterToggle
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" ---------- NERDTREE ----------

let g:NERDTreeGitStatusWithFlags = 1
" Highlight file names
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" Git symbols that I like
let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'*',
                \ 'Staged'    :'+',
                \ 'Untracked' :'u',
                \ 'Renamed'   :'>',
                \ 'Unmerged'  :'=',
                \ 'Deleted'   :'x',
                \ 'Dirty'     :'*',
                \ 'Ignored'   :'i',
                \ 'Clean'     :'c',
                \ 'Unknown'   :'?',
                \ }
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree() " for some reason this one causes NERDTree to open multiple times
autocmd BufRead * call SyncTree()
