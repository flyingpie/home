#/bin/bash

ln -s $(pwd)/fonts ~/.local/share/fonts
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -s $(pwd)/zsh/.zshrc ~/.zshrc

#fc-cache -fv

