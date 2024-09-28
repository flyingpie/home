#/bin/bash

# Bin
ln -s $(pwd)/bin ~/.local/bin

# Fonts
mkdir -p ~/.local/share
ln -s $(pwd)/fonts ~/.local/share/fonts

# Git
ln -srf $(pwd)/.gitconfig ~/.gitconfig

# SSH Agent
mkdir -p ~/.config/systemd/user
ln -s $(pwd)/ssh/ssh-agent.service ~/.config/systemd/user/ssh-agent.service

# tmux
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf

# User
ln -srf $(pwd)/user/.profile ~/.bash_profile
ln -srf $(pwd)/user/.profile ~/.profile
ln -srf $(pwd)/user/.profile ~/.zshenv

# Wezterm
mkdir -p ~/.config/wezterm
ln -s $(pwd)/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -s $(pwd)/wezterm/wezterm.lua ~/.wezterm.lua

# Zsh
ln -srf $(pwd)/zsh/.zshrc ~/.zshrc

#fc-cache -fv

