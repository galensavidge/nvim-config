# Neovim Config

My personal neovim configuration.

## Installation

### Linux

1.  Clone the repo into the neovim settings folder (typically `~/.config/nvim`).
2.  Run the install script.

``` bash
./.config/nvim/linux-setup.sh
```

(Optional) Install neovide:

``` bash
mkdir -p ~/bin/appimages
cd ~/bin/appimages
curl -LO https://github.com/neovide/neovide/releases/latest/download/neovide.AppImage
chmod +x neovide.AppImage
ln -s ~/bin/appimages/neovide.AppImage /usr/local/bin
```

(Optional) Install LaTeX (and RST) language server (not currently enabled):

``` bash
curl -LO https://github.com/valentjn/ltex-ls/releases/download/16.0.0/ltex-ls-16.0.0-linux-x64.tar.gz
tar -xvf ltex-ls-16.0.0-linux-x64.tar.gz -C ~/bin
rm ltex-ls-16.0.0-linux-x64.tar.gz
sudo ln -s ~/bin/ltex-ls-16.0.0/bin/ltex-ls /usr/local/bin
```

(Optional) Install the markdown language server:

``` bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  # Install rust
cargo install iwes
```

(Optional) Place the following line in `~./bashrc`:

``` bash
alias v='nvim'
```

Or, for neovide:

``` bash
alias v='neovide.AppImage'
```

### Windows

Consider setting this in `$profile`, which better matches the default behavior
of bash:

```
Set-PSReadLineOption -EditMode Emacs
```

[Chocolatey](https://chocolatey.org/install#individual) must be installed for
the setup instructions below.

C++ build tools must be installed before installing and building plugins. To do
so, install [VS Build
Tools](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=buildtools).
When running the installer,
* Choose "Visual Studio Build Tools" and make sure "C++ Clang Tools" is checked
* Add clang location to path, most likely by adding `$env:PATH += ';C:\Program
  Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\Llvm\x64\bin'`
  to `$profile`.

1.  Run the MSI installer from the [latest
    release](https://github.com/neovim/neovim/releases/latest/download/nvim-win64.msi).

1.  Clone the repo into the neovim settings folder (`~/AppData/Local/nvim/`).
2.  Install required packages:

```bash
# Windows
choco install make cmake ripgrep
```

3.  Set up language servers:

``` bash
winget install pip
pip install basedpyright ruff

# Install Julia
winget install julia -s msstore
julia -e 'using Pkg; Pkg.add("LanguageServer")'
```

## Font

Fira Mono: [FiraMono Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraMono.zip)
## Keybinds

### Movement

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| N, X      | `H`             | Move to first non-whitespace char on line     |
| N, X      | `L`             | Move to the end of the line                   |
| N, X      | `<space>m`      | Set mark                                      |
| N, X      | `s`             | Begin leap search forward                     |
| N, X      | `S`             | Begin leap search backward                    |
| N, X      | `gs`            | Begin leap search in other splits             |
| N, X      | `gS`            | Begin leap action at a distance               |

### Text Editing

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| N, X      | `m`             | Cut selection                                 |
| Normal    | `M`             | Cut to the right of cursor                    |
| Normal    | `mm`            | Cut line                                      |
| N, X      | `<space>j`      | Toggle splitting/joining lines by delimiters  |

### Splits, Tabs, & Buffers

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| Normal    | `<A-s>`         | Split horizontally                            |
| Normal    | `<A-v>`         | Split vertically                              |
| Normal    | `<C-{h/j/k/l}>` | Move between splits to {left/bottom/top/right}|
| Normal    | `<A-{h/j/k/l}>` | Move split pane to the {left/bottom/top/right}|
| Normal    | `<A-o>`         | Jump back to the previously opened buffer     |
| Normal    | `<A-i>`         | Jump forward to the next opened buffer        |
| N, X      | `<A-=>`         | Set split panes to equal sizes                |
| N, X      | `<C-c>`         | Close pane                                    |
| N, X      | `<A-d>`         | Delete buffer or exit terminal                |
| Normal    | `<A-t>`         | Make new tab                                  |
| Normal    | `<A-c>`         | Close tab                                     |

### Searching & Browsing

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| Normal    | `;`             | Quick select from buffers                     |
| Normal    | `,`             | Open/close file browser                       |
| Normal    | `<space>;`      | Fuzzy search files                            |
| Normal    | `<space>gg`     | Grep for text in files                        |
| Normal    | `<space>gw`     | Grep list of occurrences of word under cursor |
| Normal    | `<space>z`      | Show spelling suggestions                     |
| Normal    | `<space>sb`     | Fuzzy search buffers                          |
| Normal    | `<space>sh`     | Fuzzy search help tags                        |
| Normal    | `<space>p`      | Fuzzy search clipboard history                |
| Normal    | `<space>u`      | Fuzzy search undo history tree                |
| Normal    | `<space>gB`     | Fuzzy search git branches                     |
| Normal    | `<space>gc`     | Fuzzy search git commits                      |
| Normal    | `<space>ss`     | Fuzzy search LSP symbols                      |
| Normal    | `<space>so`     | Fuzzy search outgoing call hierarchy          |
| Normal    | `<space>si`     | Fuzzy search incoming call hierarchy          |
| Normal    | `<space>st`     | Fuzzy search Telescope search pickers         |
| Normal    | `<space>re`     | Toggle project-wide find/replace window       |

### Quickfix List

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| Normal    | `<space>q`      | Toggle quickfix list                          |
| Normal    | `{[/]}q`        | Jump to {previous/next} quickfix list item    |

### Command-Line Window

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| Normal    | `<space>:`      | Open command-line window                      |
| Normal    | `<space>/`      | Open command-line window (forward search)     |
| Normal    | `<space>?`      | Open command-line window (reverse search)     |
| Normal    | `<esc>`         | Close command-line window                     |

### Terminal

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| Normal    | `<space>t`      | Open new terminal in current window           |
| Normal    | `<space>T`      | Open new terminal in split                    |
| N, X      | `<space><enter>`| Execute current line/selection in terminal    |

### Git

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| Normal    | `<space>go`     | Open git GUI                                  |
| Normal    | `{[/]}c`        | {Previous/Next} git hunk                      |
| O, X      | `ih`            | Select inner git hunk                         |
| Normal    | `<space>hp`     | Preview git hunk                              |
| Normal    | `<space>hs`     | Stage git hunk                                |
| Normal    | `<space>hr`     | Reset git hunk                                |
| Normal    | `<space>hS`     | Stage all git hunks in buffer                 |
| Normal    | `<space>hR`     | Reset all git hunks in buffer                 |
| Normal    | `<space>hu`     | Undo staging git hunk                         |
| Normal    | `<space>td`     | Toggle showing deleted lines on/off           |
| Normal    | `<space>hb`     | Show git blame for last change on this line   |
| Normal    | `<space>gb`     | Open git blame for the current file           |
| Normal    | `<space>hD`     | Show git diff for current buffer              |
| Normal    | `<space>gd`     | Open git diff view page of all changed files  |
| Normal    | `<space>gf`     | Open git file history for current buffer      |
| Normal    | `<space>gu`     | Open git diff against upstream (branch point) |

### LSP & Completion

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| Normal    | `K`             | Hover LSP symbol                              |
| Normal    | `gd`            | Go to LSP symbol definition                   |
| Normal    | `gD`            | Go to LSP symbol declaration                  |
| Normal    | `<space>D`      | Go to LSP symbol type definition              |
| Normal    | `<space>rn`     | Rename LSP symbol                             |
| Normal    | `<space>R`      | Rename LSP symbol, erasing the current name   |
| Normal    | `<space>ca`     | Execute code actions                          |
| Normal    | `<space>gr`     | Show LSP symbol references                    |
| Normal    | `<space>l`      | Auto-format buffer                            |
| Normal    | `[e`            | Jump to previous diagnostic                   |
| Normal    | `]e`            | Jump to next diagnostic                       |
| Normal    | `<leader>E`     | Show the diagnostic under the cursor          |
| Normal    | `<space>a`      | Add annotation (e.g. docstring)               |
| Normal    | `<space>ca`     | Execute code actions                          |
| Insert    | `<Tab>/<C-Space>` | Manually trigger autocomplete               |
| Insert    | `<C-e>`         | Close autocomplete window                     |
| Insert    | `<Tab>`         | Select next autocomplete suggestion           |
| Insert    | `<S-Tab>`       | Select previous autocomplete suggestion       |
| Insert    | `<CR>`          | Confirm selected autocomplete suggestion      |
| Insert    | `<C-l>`         | Jump forward within snippet/annotation        |
| Insert    | `<C-h>`         | Jump backward within snippet/annotation       |

### Markdown

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| Normal    | `<leader>ww`    | Open personal wiki index page                 |
| Normal    | `<tab>`         | Jump to next link in markdown document        |
| Normal    | `<leader>nf`    | Create new file from path under cursor        |
| Normal    | `<leader>mv`    | Toggle markdown rendering enhancements        |

### Debugger (DAP)

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| Insert    | `<space>db`     | Toggle breakpoint                             |
| Insert    | `<space>dB`     | Set conditional breakpoint                    |
| Insert    | `<space>dc`     | Start/continue debugger                       |
| Insert    | `<space>di`     | Debugger step into                            |
| Insert    | `<space>do`     | Debugger step over                            |
| Insert    | `<space>dO`     | Debugger step out                             |
| Insert    | `<space>dr`     | Debugger toggle REPL                          |
| Insert    | `<space>dl`     | Rerun last debugging session                  |
| Insert    | `<space>dx`     | Terminate debugger                            |
| Insert    | `<space>du`     | Toggle debugger UI                            |
| DAP UI    | `e`             | Edit action                                   |
| DAP UI    | `<CR>`          | Expand action                                 |
| DAP UI    | `o`             | Open action                                   |
| DAP UI    | `d`             | Remove action                                 |
| DAP UI    | `r`             | REPL action                                   |
| DAP UI    | `t`             | Toggle action                                 |
