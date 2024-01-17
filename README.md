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
sudo apt-get install ripgrep fd-find xclip clangd python3-venv markdown
```
4. Set up language servers:
```bash
pip3 install pyright
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
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
Fira Mono: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraMono.zip
