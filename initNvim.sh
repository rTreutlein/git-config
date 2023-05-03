#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Creating nvim Config Folders"
mkdir ~/.config/nvim
echo "Linking Vim Config"
ln -s "$DIR/nvim/init.lua" ~/.config/nvim/init.lua
echo "Linking vim lua folder"
ln -s "$DIR/nvim/lua" ~/.config/nvim/lua
echo "Linking vim after folder"
ln -s "$DIR/nvim/after" ~/.config/nvim/after
echo "Linking Tmux Config"
ln -s "$DIR/tmux.conf" ~/.tmux.conf
