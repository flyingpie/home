#/bin/bash

# Bin
rm -rf ~/.local/bin
ln -s $(pwd)/bin ~/.local/bin

# Fonts
rm -rf ~/.local/share/fonts
mkdir -p ~/.local/share
ln -srf $(pwd)/fonts ~/.local/share/fonts

# Git
ln -srf $(pwd)/.gitconfig ~/.gitconfig

# LazyGit
mkdir -p ~/.config/lazygit
ln -srf $(pwd)/lazygit/config.yml ~/.config/lazygit/config.yml

# NVim
rm -rf ~/.config/nvim
ln -srf $(pwd)/nvim ~/.config/nvim
mkdir -p ~/.var/app/io.neovim.nvim/config/nvim
ln -srf $(pwd)/nvim ~/.var/app/io.neovim.nvim/config/nvim

# SSH Agent
mkdir -p ~/.config/systemd/user
ln -srf $(pwd)/ssh/ssh-agent.service ~/.config/systemd/user/ssh-agent.service

# tmux
ln -srf $(pwd)/tmux/.tmux.conf ~/.tmux.conf

# User
ln -srf $(pwd)/user/.profile ~/.bash_profile
ln -srf $(pwd)/user/.profile ~/.profile
ln -srf $(pwd)/user/.profile ~/.zshenv

# VSCode
rm -rf  ~/.config/Code/User/
mkdir -p ~/.config/Code/User/
ln -s $(pwd)/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -s $(pwd)/vscode/settings.json ~/.config/Code/User/settings.json

# Wezterm
mkdir -p ~/.config/wezterm
ln -srf $(pwd)/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
#ln -srf $(pwd)/wezterm/wezterm.lua ~/.wezterm.lua

# Zellij
mkdir -p ~/.config/zellij
ln -srf $(pwd)/zellij/config.kdl ~/.config/zellij/config.kdl

# Zsh
ln -srf $(pwd)/zsh/.zshrc ~/.zshrc

#fc-cache -fv

