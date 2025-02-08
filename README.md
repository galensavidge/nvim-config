# Neovim Config
My personal neovim configuration.

## Installation
1. Install neovim:
```bash
# Linux
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz
ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin
```
On Windows, run the MSI installer from the [latest
release.](https://github.com/neovim/neovim/releases/latest/download/nvim-win64.msi).

(Optional) Install neovide:
```bash
mkdir -p ~/bin/appimages
cd ~/bin/appimages
curl -LO https://github.com/neovide/neovide/releases/latest/download/neovide.AppImage
chmod +x neovide.AppImage
ln -s ~/bin/appimages/neovide.AppImage /usr/local/bin
```

2. Clone the repo into the neovim settings folder (linux: `~/.config/nvim`,
   Windows: `~/AppData/Local/nvim/`).

3. Install required packages:
```bash
# Linux
sudo apt-get update
sudo apt-get install ripgrep xclip clangd python3-venv markdown cmake gcc

# Windows
choco install make cmake ripgrep
```

4. Set up language servers:
```bash
winget install pip  # Windows
pip3 install pyright ruff
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
```
(Optional) Install Julia:
```bash
curl -fsSL https://install.julialang.org | sh  # Linux
winget install julia -s msstore  # Windows
```
Then in the Julia REPL package manager:
```julia
add LanguageServer
```
(Optional) Install lua-language-server:
```bash
curl -LO https://github.com/LuaLS/lua-language-server/releases/download/3.9.3/lua-language-server-3.9.3-linux-x64.tar.gz
mkdir ~/bin/lua-language-server
tar -xzf lua-language-server-3.9.3-linux-x64.tar.gz -C ~/bin/lua-language-server
rm lua-language-server-3.9.3-linux-x64.tar.gz
sudo ln -s ~/bin/lua-language-server/bin/lua-lanauge-server /usr/local/bin
```
(Optional) Install LaTeX (and RST) language server (not currently enabled):
```bash
curl -LO https://github.com/valentjn/ltex-ls/releases/download/16.0.0/ltex-ls-16.0.0-linux-x64.tar.gz
tar -xvf ltex-ls-16.0.0-linux-x64.tar.gz -C ~/bin
rm ltex-ls-16.0.0-linux-x64.tar.gz
sudo ln -s ~/bin/ltex-ls-16.0.0/bin/ltex-ls /usr/local/bin
```

5. Place the following lines in `~./bashrc`:
```bash
alias v='nvim'
```
Or, for neovide:
```bash
alias v='neovide.AppImage'
```

6. Set up debuggers:
```bash
cd ~
mkdir .virtualenvs
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
```

## Font
Fira Mono: [FiraMono Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraMono.zip)

## Windows Setup

Consider setting this in `$profile`, which better matches the default behavior
of bash:
```
Set-PSReadLineOption -EditMode Emacs
```

[Chocolatey](https://chocolatey.org/install#individual) must be installed for
the setup instructions above.

C++ build tools must be installed before installing and building plugins. To do
so, install [VS Build
Tools](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=buildtools).
When running the installer,
* Choose "Visual Studio Build Tools" and make sure "C++ Clang Tools" is checked
* Add clang location to path, most likely by adding `$env:PATH += ';C:\Program
  Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Tools\Llvm\x64\bin'`
  to `$profile`.

## Keybinds

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| N, X      | `H`             | Move to first non-whitespace char on line     |
| N, X      | `L`             | Move to last non-whitespace char on line      |
| N, X      | `<space>m`      | Set mark                                      |
| N, X      | `s`             | Begin leap search forward                     |
| N, X      | `S`             | Begin leap search backward                    |
| N, X      | `gs`            | Begin leap search in other splits             |
| N, X      | `gS`            | Begin leap action at a distance               |
| Normal    | `<A-s>`         | Split horizontally                            |
| Normal    | `<A-v>`         | Split vertically                              |
| Normal    | `<C-{h/j/k/l}>` | Move between splits to {left/bottom/top/right} |
| Normal    | `<A-{h/j/k/l}>` | Move split pane to the {left/bottom/top/right}|
| Normal    | `<A-o>`         | Jump back to the previously opened buffer     |
| Normal    | `<A-i>`         | Jump forward to the next opened buffer        |
| N, X      | `<A-=>`         | Set split panes to equal sizes                |
| N, X      | `<C-c>`         | Close pane                                    |
| N, X      | `<A-d>`         | Delete buffer                                 |
| Normal    | `<A-t>`         | Make new tab                                  |
| Normal    | `<A-c>`         | Close tab                                     |
| N, X      | `m`             | Cut selection                                 |
| Normal    | `M`             | Cut to the right of cursor                    |
| Normal    | `mm`            | Cut line                                      |
| N, X      | `<space>j`      | Toggle splitting/joining lines by delimiters  |
| Normal    | `;`             | Quick select from buffers                     |
| Normal    | `<space>;`      | Fuzzy search files                            |
| Normal    | `<space>f`      | Grep for text in files                        |
| Normal    | `<space>w`      | Grep list of occurrences of word under cursor |
| Normal    | `<space>`       | Open/close file browser                       |
| Normal    | `<space>z`      | Fuzzy search spelling suggestions             |
| Normal    | `<space>b`      | Fuzzy search buffers                          |
| Normal    | `<space>h`      | Fuzzy search help tags                        |
| Normal    | `<space>p`      | Fuzzy search clipboard history                |
| Normal    | `<space>u`      | Fuzzy search undo history tree                |
| Normal    | `<space>s`      | Fuzzy search LSP symbols                      |
| Normal    | `<space>e`      | Fuzzy search diagnostics                      |
| Normal    | `<space>gb`     | Fuzzy search git branches                     |
| Normal    | `<space>S`      | Fuzzy search sessions                         |
| Normal    | `<space>ts`     | Fuzzy search Telescope search pickers         |
| Normal    | `<space>re`     | Toggle project-wide find/replace window       |
| Normal    | `<space>t`      | Open new terminal in current window           |
| Normal    | `<space>T`      | Open new terminal in split                    |
| N, X      | `<space><enter>`| Execute current line/selection in terminal    |
| Normal    | `{[/]}c`        | {Previous/Next} git hunk                      |
| Normal    | `<space>hs`     | Stage git hunk                                |
| Normal    | `<space>hr`     | Reset git hunk                                |
| Normal    | `<space>hS`     | Stage all git hunks in buffer                 |
| Normal    | `<space>hR`     | Reset all git hunks in buffer                 |
| Normal    | `<space>hu`     | Undo staging git hunk                         |
| Normal    | `<space>hp`     | Preview git hunk                              |
| Normal    | `<space>hb`     | Show git blame for last change on this line   |
| Normal    | `<space>gB`     | Open git blame for the current file           |
| Normal    | `<space>hD`     | Show git diff for current buffer              |
| Normal    | `<space>td`     | Toggle showing deleted lines on/off           |
| O, X      | `ih`            | Select git hunk                               |
| Normal    | `<space>gd`     | Open git diff view page of all changed files  |
| Normal    | `<space>gf`     | Open git diff view file history               |
| Normal    | `K`             | Hover LSP symbol                              |
| Normal    | `gd`            | Go to LSP symbol definition                   |
| Normal    | `gD`            | Go to LSP symbol declaration                  |
| Normal    | `<space>D`      | Go to LSP symbol type definition              |
| Normal    | `<space>rn`     | Rename LSP symbol                             |
| Normal    | `<space>ca`     | Execute code actions                          |
| Normal    | `<space>gr`     | Show LSP symbol references                    |
| Normal    | `<space>l`      | Auto-format buffer                            |
| Normal    | `<space>o`      | Show code outline sidebar using LSP symbols   |
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
