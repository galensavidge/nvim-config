#!/usr/bin/env bash

# Install neovim.
if [ -z "$1" ]; then
    echo "Downloading the supported Neovim release build..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
else
    echo "Downloading an unsupported old-GLIBC-compatible Neovim build..."
    curl -LO https://github.com/neovim/neovim-releases/releases/latest/download/nvim-linux-x86_64.tar.gz
fi
rm -rf ~/bin/nvim
mkdir ~/bin
tar -C ~/bin -xzf nvim-linux-x86_64.tar.gz
rm /usr/local/bin/nvim
ln -s ~/bin/nvim-linux-x86_64/bin/nvim /usr/local/bin

# Install required packages.
sudo bash -c 'apt update && apt install ripgrep xclip clangd python3-venv markdown cmake gcc pipx'

# Install Python language servers.
pipx install ty ruff

# Set up Python debugger.
mkdir ~/.virtualenvs
cd ~/.virtualenvs
rm -rf debugpy
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
cd -

# Install Julia.
if which julia; then
    echo "Julia found!"
else
    echo "Julia not found in PATH, installing..."
    curl -fsSL https://install.julialang.org | sh
fi

julia -e 'using Pkg; Pkg.add("LanguageServer"); Pkg.add("SymbolServer"); Pkg.add("StaticLint")'

# Install Lua language server.
rm -rf ~/bin/lua-language-server
mkdir ~/bin/lua-language-server
curl -LO https://github.com/LuaLS/lua-language-server/releases/download/3.9.3/lua-language-server-3.9.3-linux-x64.tar.gz
tar -xzf lua-language-server-3.9.3-linux-x64.tar.gz -C ~/bin/lua-language-server
rm lua-language-server-3.9.3-linux-x64.tar.gz
rm /usr/local/bin/lua-lanauge-server
ln -s ~/bin/lua-language-server/bin/lua-lanauge-server /usr/local/bin
