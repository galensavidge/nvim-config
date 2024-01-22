# nvim-config
My personal neovim configuration.

## Installation
1. Install neovim:
```bash
mkdir -p ~/appimages
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
    --output-dir ~/appimages
chmod u+x ~/appimages/nvim.appimage
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
pip3 install pyright
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

5. Place the following lines in `~./bashrc`:
```
alias v='~/appimages/nvim.appimage'
```
6. Python setup:
```bash
pip install isort
```

## Font
Fira Mono: [FiraMono Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraMono.zip)

## Keybinds

| Mode      | Keys            | Action                                        |
| --------- | --------------- | --------------------------------------------- |
| N, X      | `s`             | Begin leap search forward                     |
| N, X      | `S`             | Begin leap search backward                    |
| N, X      | `gs`            | Begin leap search in other splits             |
| Normal    | `<A-s>`         | Split horizontally                            |
| Normal    | `<A-v>`         | Split vertically                              |
| Normal    | `<C-{h/j/k/l}>` | Move between panes to {left/bottom/top/right} |
| Normal    | `<A-{h/j/k/l}>` | Move split pane to the {left/bottom/top/right}|
| N, X      | `<A-=>`         | Set split panes to equal sizes                |
| N, X      | `<C-c>`         | Close pane                                    |
| Normal    | `tn`            | Make new tab                                  |
| Normal    | `tc`            | Close tab                                     |
| N, X      | `m`             | Cut selection                                 |
| Normal    | `M`             | Cut to the right of cursor                    |
| Normal    | `mm`            | Cut line                                      |
| Normal    | `,ct`           | Toggle comment on the current line            |
| N, X      | `,cc`           | Single-line comment leader keymap             |
| N, X      | `,cb`           | Block comment leader keymap                   |
| Normal    | `<C-p>`         | Fuzzy search file names                       |
| Normal    | `,f`            | Grep for text in files                        |
| Normal    | `,w`            | Grep list of occurrences of word under cursor |
| Normal    | `,d`            | Open file browser                             |
| Normal    | `,z`            | Fuzzy search spelling suggestions             |
| Normal    | `,b`            | Fuzzy search buffers                          |
| Normal    | `,h`            | Fuzzy search help tags                        |
| Normal    | `,p`            | Fuzzy search clipboard history                |
| Normal    | `,s`            | Fuzzy search LSP symbols                      |
| Normal    | `,e`            | Fuzzy search diagnostics                      |
| Normal    | `,gb`           | Fuzzy search git branches                     |
| Normal    | `,ts`           | Fuzzy search Telescope search pickers         |
| Normal    | `{[/]}c`        | {Previous/Next} git hunk                      |
| Normal    | `,hs`           | Stage git hunk                                |
| Normal    | `,hr`           | Reset git hunk                                |
| Normal    | `,hS`           | Stage all git hunks in buffer                 |
| Normal    | `,hR`           | Reset all git hunks in buffer                 |
| Normal    | `,hp`           | Preview git hunk                              |
| Normal    | `,hb`           | Show git blame for last change on this line   |
| Normal    | `,tb`           | Toggle git blame for current line on/off      |
| Normal    | `,hD`           | Show git diff for current buffer              |
| Normal    | `,td`           | Toggle showing deleted lines on/off           |
| O, X      | `ih`            | Select git hunk                               |
| Normal    | `,gd`           | Open git diff view page of all changed files  |
| Normal    | `K`             | Hover LSP symbol                              |
| Normal    | `gd`            | Go to LSP symbol definition                   |
| Normal    | `gD`            | Go to LSP symbol declaration                  |
| Normal    | `,D`            | Go to LSP symbol type definition              |
| Normal    | `,rn`           | Rename LSP symbol                             |
| Normal    | `,ca`           | Execute code actions                          |
| Normal    | `,gr`           | Show LSP symbol references                    |
| Normal    | `,l`            | Auto-format buffer                            |
| Normal    | `,o`            | Show code outline sidebar using LSP symbols   |
| Normal    | `[e`            | Jump to previous diagnostic                   |
| Normal    | `]e`            | Jump to next diagnostic                       |
| Normal    | `<leader>E`     | Show the diagnostic under the cursor          |
| Normal    | `,ca`           | Execute code actions                          |
| Insert    | `<Tab>/<C-Space>` | Manually trigger autocomplete               |
| Insert    | `<C-e>`         | Close autocomplete window                     |
| Insert    | `<Tab>`         | Select next autocomplete suggestion           |
| Insert    | `<S-Tab>`       | Select previous autocomplete suggestion       |
| Insert    | `<CR>`          | Confirm selected autocomplete suggestion      |
| Insert    | `<C-l>`         | Expand snippet or jump forward within snippet |
| Insert    | `<C-h>`         | Jump backward within snippet                  |
