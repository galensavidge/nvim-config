# Neovim Config
My personal neovim configuration.

## Installation
1. Install neovim:
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz
ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin
```
(Optional) Install neovide:
```bash
mkdir -p ~/bin/appimages
cd ~/bin/appimages
curl -LO https://github.com/neovide/neovide/releases/latest/download/neovide.AppImage
chmod +x neovide.AppImage
ln -s ~/bin/appimages/neovide.AppImage /usr/local/bin
```

2. Clone the repo into the neovim settings folder (default `~/.config/nvim`).

3. Install required packages:
```bash
sudo apt-get update
sudo apt-get install ripgrep fd-find xclip clangd python3-venv markdown cmake
gcc yapf flake8
```

4. Set up language servers:
```bash
pip3 install pyright ruff
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
```
(Optional) Install Julia:
```bash
curl -fsSL https://install.julialang.org | sh
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
(Optional) Install LaTeX (and RST) language server:
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

## Keybinds

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| N, X      | `H`             | Move to first non-whitespace char on line     |
| N, X      | `L`             | Move to last non-whitespace char on line      |
| N, X      | ` m`            | Set mark                                      |
| N, X      | `s`             | Begin leap search forward                     |
| N, X      | `S`             | Begin leap search backward                    |
| N, X      | `gs`            | Begin leap search in other splits             |
| N, X      | `gS`            | Begin leap action at a distance               |
| Normal    | `<A-s>`         | Split horizontally                            |
| Normal    | `<A-v>`         | Split vertically                              |
| Normal    | `<C-{h/j/k/l}>` | Move between panes to {left/bottom/top/right} |
| Normal    | `<A-{h/j/k/l}>` | Move split pane to the {left/bottom/top/right}|
| Normal    | `<A-o>`         | Jump back to the previously opened buffer     |
| Normal    | `<A-i>`         | Jump forward to the next opened buffer        |
| N, X      | `<A-=>`         | Set split panes to equal sizes                |
| N, X      | `<C-c>`         | Close pane                                    |
| Normal    | `<A-t>`         | Make new tab                                  |
| Normal    | `<A-c>`         | Close tab                                     |
| N, X      | `m`             | Cut selection                                 |
| Normal    | `M`             | Cut to the right of cursor                    |
| Normal    | `mm`            | Cut line                                      |
| Normal    | `;`             | Fuzzy search file names                       |
| Normal    | ` f`            | Grep for text in files                        |
| Normal    | ` w`            | Grep list of occurrences of word under cursor |
| Normal    | `,`             | Open file browser                             |
| Normal    | ` z`            | Fuzzy search spelling suggestions             |
| Normal    | ` b`            | Fuzzy search buffers                          |
| Normal    | ` h`            | Fuzzy search help tags                        |
| Normal    | ` p`            | Fuzzy search clipboard history                |
| Normal    | ` u`            | Fuzzy search undo history tree                |
| Normal    | ` s`            | Fuzzy search LSP symbols                      |
| Normal    | ` e`            | Fuzzy search diagnostics                      |
| Normal    | ` gb`           | Fuzzy search git branches                     |
| Normal    | ` S`            | Fuzzy search sessions                         |
| Normal    | ` ts`           | Fuzzy search Telescope search pickers         |
| Normal    | ` r`            | Toggle find/replace window for all files      |
| Normal    | `{[/]}c`        | {Previous/Next} git hunk                      |
| Normal    | ` hs`           | Stage git hunk                                |
| Normal    | ` hr`           | Reset git hunk                                |
| Normal    | ` hS`           | Stage all git hunks in buffer                 |
| Normal    | ` hR`           | Reset all git hunks in buffer                 |
| Normal    | ` hu`           | Undo staging git hunk                         |
| Normal    | ` hp`           | Preview git hunk                              |
| Normal    | ` hb`           | Show git blame for last change on this line   |
| Normal    | ` tb`           | Toggle git blame for current line on/off      |
| Normal    | ` hD`           | Show git diff for current buffer              |
| Normal    | ` td`           | Toggle showing deleted lines on/off           |
| O, X      | `ih`            | Select git hunk                               |
| Normal    | ` gd`           | Open git diff view page of all changed files  |
| Normal    | `K`             | Hover LSP symbol                              |
| Normal    | `gd`            | Go to LSP symbol definition                   |
| Normal    | `gD`            | Go to LSP symbol declaration                  |
| Normal    | ` D`            | Go to LSP symbol type definition              |
| Normal    | ` rn`           | Rename LSP symbol                             |
| Normal    | ` ca`           | Execute code actions                          |
| Normal    | ` gr`           | Show LSP symbol references                    |
| Normal    | ` l`            | Auto-format buffer                            |
| Normal    | ` o`            | Show code outline sidebar using LSP symbols   |
| Normal    | `[e`            | Jump to previous diagnostic                   |
| Normal    | `]e`            | Jump to next diagnostic                       |
| Normal    | `<leader>E`     | Show the diagnostic under the cursor          |
| Normal    | ` ca`           | Execute code actions                          |
| Insert    | `<Tab>/<C-Space>` | Manually trigger autocomplete               |
| Insert    | `<C-e>`         | Close autocomplete window                     |
| Insert    | `<Tab>`         | Select next autocomplete suggestion           |
| Insert    | `<S-Tab>`       | Select previous autocomplete suggestion       |
| Insert    | `<CR>`          | Confirm selected autocomplete suggestion      |
| Insert    | `<C-l>`         | Expand snippet or jump forward within snippet |
| Insert    | `<C-h>`         | Jump backward within snippet                  |
| Insert    | ` db`           | Toggle breakpoint                             |
| Insert    | ` dB`           | Set conditional breakpoint                    |
| Insert    | ` dc`           | Start/continue debugger                       |
| Insert    | ` di`           | Debugger step into                            |
| Insert    | ` do`           | Debugger step over                            |
| Insert    | ` dO`           | Debugger step out                             |
| Insert    | ` dr`           | Debugger toggle REPL                          |
| Insert    | ` dl`           | Rerun last debugging session                  |
| Insert    | ` dx`           | Terminate debugger                            |
| Insert    | ` du`           | Toggle debugger UI                            |
| DAP UI    | `e`             | Edit action                                   |
| DAP UI    | `<CR>`          | Expand action                                 |
| DAP UI    | `o`             | Open action                                   |
| DAP UI    | `d`             | Remove action                                 |
| DAP UI    | `r`             | REPL action                                   |
| DAP UI    | `t`             | Toggle action                                 |
