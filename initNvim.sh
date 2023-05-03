#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Creating nvim Config Folders"
echo "Linking Vim Config"
ln -s "$DIR/nvim" ~/.config/
echo "Linking Tmux Config"
ln -s "$DIR/tmux.conf" ~/.tmux.conf
