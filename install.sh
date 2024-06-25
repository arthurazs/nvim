#!/bin/bash
LOG_NAME="/tmp/arthurazs-nvim.log"

echo "Logging to $LOG_NAME"
date >> $LOG_NAME

# Versions
LUA_REPO="LuaLS/lua-language-server"
TREE_SITTER_REPO="tree-sitter/tree-sitter"
LAZYGIT_REPO="jesseduffield/lazygit"

latest_version () {
    echo $(curl -s "https://api.github.com/repos/${1}/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
}

latest_version_without_v () {
    echo $(curl -s "https://api.github.com/repos/${1}/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
}

version_url () {
    echo "https://github.com/$1/releases/download/$2/$3"
}

# PyRight and Ruff LSP
UNINSTALL_PIP=false
if [ ! -x /usr/bin/pip ]; then
    echo "Installing python3-pip..." | tee -a $LOG_NAME
    sudo apt-get install -y python3-pip >> $LOG_NAME 2>&1
    UNINSTALL_PIP=true
fi

if [ "$(cat /etc/os-release | grep -o 'Debian')" ]; then
    PIP_OPTIONS="--break-system-packages"
fi

UNINSTALL_UV=false
if [ ! -x ~/.local/bin/uv ]; then
    echo "Installing uv..." | tee -a $LOG_NAME
    pip install uv $PIP_OPTIONS >> $LOG_NAME 2>&1
    UNINSTALL_UV=true
fi

if [ ! -d ~/.config/nvim/.venv ]; then
    echo "Creating python venv for nvim" | tee -a $LOG_NAME
    uv venv ~/.config/nvim/.venv >> $LOG_NAME 2>&1
fi

echo "Installing pynvim..." | tee -a $LOG_NAME
~/.config/nvim/.venv/bin/python -m uv pip install pynvim >> $LOG_NAME 2>&1

echo "Installing ruff..." | tee -a $LOG_NAME
pip install ruff $PIP_OPTIONS >> $LOG_NAME 2>&1

if [ $UNINSTALL_UV = true ]; then
    echo "Uninstalling uv..." | tee -a $LOG_NAME
    pip uninstall uv -y $PIP_OPTIONS >> $LOG_NAME 2>&1
fi

if [ $UNINSTALL_PIP = true ]; then
    echo "Uninstalling python3-pip..." | tee -a $LOG_NAME
    sudo apt-get purge -y python3-pip >> $LOG_NAME 2>&1
fi

# neovim
echo "Installing neovim for npm..." | tee -a $LOG_NAME
npm install -g neovim >> $LOG_NAME 2>&1

# lua
LUA_NAME="lua-language-server"
echo "Installing $LUA_NAME..." | tee -a $LOG_NAME
LUA_VERSION=`latest_version_without_v $LUA_REPO`
wget `version_url $LUA_REPO $LUA_VERSION $LUA_NAME-${LUA_VERSION}-linux-x64.tar.gz` -O /tmp/$LUA_NAME.tar.gz >> $LOG_NAME 2>&1
mkdir /tmp/$LUA_NAME
tar -C /tmp/$LUA_NAME -xzf /tmp/$LUA_NAME.tar.gz
rm -r ~/.local/$LUA_NAME
mv /tmp/$LUA_NAME ~/.local/
rm ~/.local/bin/$LUA_NAME
ln -s ~/.local/$LUA_NAME/bin/$LUA_NAME ~/.local/bin/

# treesitter
TREE_SITTER_NAME="tree-sitter"
echo "Installing $TREE_SITTER_NAME..." | tee -a $LOG_NAME
TREE_SITTER_VERSION=`latest_version $TREE_SITTER_REPO`
wget `version_url $TREE_SITTER_REPO v$TREE_SITTER_VERSION $TREE_SITTER_NAME-linux-x64.gz` -O /tmp/$TREE_SITTER_NAME.gz >> $LOG_NAME 2>&1
gzip -dc /tmp/$TREE_SITTER_NAME.gz > ~/.local/bin/$TREE_SITTER_NAME
chmod +x ~/.local/bin/$TREE_SITTER_NAME

# lazygit
LAZYGIT_NAME="lazygit"
echo "Installing $LAZYGIT_NAME..." | tee -a $LOG_NAME
LAZYGIT_VERSION=`latest_version $LAZYGIT_REPO`
curl -Lo /tmp/$LAZYGIT_NAME.tar.gz `version_url $LAZYGIT_REPO v$LAZYGIT_VERSION ${LAZYGIT_NAME}_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz` >> $LOG_NAME 2>&1
mkdir -p /tmp/$LAZYGIT_NAME
tar -xzf /tmp/$LAZYGIT_NAME.tar.gz -C /tmp/
rm -f ~/.local/bin/$LAZYGIT_NAME
mv /tmp/$LAZYGIT_NAME ~/.local/bin

# bashls
echo "Installing bash-language-server..." | tee -a $LOG_NAME
npm i -g bash-language-server >> $LOG_NAME 2>&1

