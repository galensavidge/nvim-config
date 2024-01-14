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
sudo apt-get install ripgrep fd-find
```
4. Install Vim-Plug:
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
5. Install Node.js for coc-nvim:
```bash
curl -sL install-node.vercel.app/lts | sudo bash
```
6. Place the following lines in `~./bashrc`:
```
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS='-m --height 50% --border'
alias v='~/appimages/nvim.appimage'
```
7. Python setup:
```bash
pip install isort
```
8. Open neovim and install plugins:
```
:PlugInstall
```

## Font
Fira Mono: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraMono.zip
