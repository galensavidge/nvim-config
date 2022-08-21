# nvim-config
My personal neovim configuration.

## Installation
1. Install neovim:
```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```
2. Clone the repo into the neovim settings folder (default `~/.config/nvim`).
3. Install required packages:
```bash
sudo apt-get install ripgrep
4. Install Vim-Plug:
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
5. Install Node.js for coc-nvim:
```bash
curl -sL install-node.vercel.app/lts | sudo bash
```
6. Place the following lines in `~./bashrc`:
```
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS='-m --height 50% --border'
```
7. Python setup:
```bash
pip install isort
8. Open neovim and install plugins:
```
:PlugInstall
```
