#/bin/bash

ln -s $(pwd)/bin ~/.local/bin

mkdir -p ~/.local/share
ln -s $(pwd)/fonts ~/.local/share/fonts

ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/wezterm
ln -s $(pwd)/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua

ln -s $(pwd)/zsh/.zshrc ~/.zshrc

#fc-cache -fv

