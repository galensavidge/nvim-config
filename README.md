# nvim-config
My personal neovim configuration.

## Installation
1. Clone the repo into the neovim settings folder (default `~/.config/nvim`).
2. Install Vim-Plug:
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
3. Place in `~./bashrc`:
```
# fzf.vim, use ripgrep
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS='-m --height 50% --border'
```
3. Install plugins:
```
:PlugInstall
```
