#/bin/bash

# Bin
ln -s $(pwd)/bin ~/.local/bin

# Fonts
mkdir -p ~/.local/share
ln -s $(pwd)/fonts ~/.local/share/fonts

# SSH Agent
mkdir -p ~/.config/systemd/user
ln -s $(pwd)/ssh/ssh-agent.service ~/.config/systemd/user/ssh-agent.service

# tmux
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf

# User
ln -s $(pwd)/user/.profile ~/.profile

# Wezterm
mkdir -p ~/.config/wezterm
ln -s $(pwd)/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -s $(pwd)/wezterm/wezterm.lua ~/.wezterm.lua

# Zsh
ln -s $(pwd)/zsh/.zshenv ~/.zshenv
ln -s $(pwd)/zsh/.zshrc ~/.zshrc

#fc-cache -fv

