#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Creating nvim Config Folders"
mkdir ~/.config/nvim
mkdir ~/.config/nvim/autoload
mkdir ~/.config/nvim/ftplugin
echo "Linking Vim Config"
ln -s "$DIR/nvim/init.vim" ~/.config/nvim/init.vim
echo "Linking VimPlug Plugin"
ln -s "$DIR/nvim/plug.vim" ~/.config/nvim/autoload/plug.vim
echo "Linking my Haskell Vim Config"
ln -s "$DIR/nvim/haskell.vim" ~/.config/nvim/ftplugin/haskell.vim
echo "Linking my C/CPP Vim Config"
ln -s "$DIR/nvim/cpp.vim" ~/.config/nvim/ftplugin/cpp.vim

echo "Running PlugInstall in vim."
nvim -c "PlugInstall"
