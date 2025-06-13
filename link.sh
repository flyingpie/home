#/bin/bash

# Bin
rm -rf ~/.local/bin
ln -s $(pwd)/bin ~/.local/bin

# Dolphin
ln -srf $(pwd)/dolphin/dolphinrc ~/.config/dolphinrc

# Fonts
rm -rf ~/.local/share/fonts
mkdir -p ~/.local/share
ln -srf $(pwd)/fonts ~/.local/share/fonts

# Git
# ln -srf $(pwd)/.gitconfig ~/.gitconfig

# Kando
mkdir -p ~/.config/kando
ln -srf $(pwd)/kando/config.json	~/.config/kando/config.json
ln -srf $(pwd)/kando/menus.json		~/.config/kando/menus.json
ln -srf $(pwd)/kando/config.json	~/.var/app/menu.kando.Kando/config/kando/config.json
ln -srf $(pwd)/kando/menus.json		~/.var/app/menu.kando.Kando/config/kando/menus.json

# LazyGit
mkdir -p ~/.config/lazygit
ln -srf $(pwd)/lazygit/config.yml ~/.config/lazygit/config.yml

# NVim
rm -rf ~/.config/nvim
ln -srf $(pwd)/nvim ~/.config/nvim
mkdir -p ~/.var/app/io.neovim.nvim/config/nvim
ln -srf $(pwd)/nvim ~/.var/app/io.neovim.nvim/config/nvim

# PowerShell
rm -rf ~/.config/powershell
ln -srf $(pwd)/ps ~/.config/powershell

# JetBrains - DataGrip
ln -srf $(pwd)/datagrip/idea.properties ~/.config/JetBrains/DataGrip2025.1/idea.properties

# JetBrains - Rider
ln -srf $(pwd)/rider/idea.properties ~/.config/JetBrains/Rider2024.2/idea.properties
ln -srf $(pwd)/rider/idea.properties ~/.config/JetBrains/Rider2024.3/idea.properties
ln -srf $(pwd)/rider/idea.properties ~/.config/JetBrains/Rider2025.1/idea.properties

# Rofi
rm -rf ~/.config/rofi
ln -srf $(pwd)/rofi ~/.config/rofi

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

# WTQ
mkdir -p ~/.config/wtq
ln -srf $(pwd)/wtq/wtq.jsonc ~/.config/wtq/wtq.jsonc

# Zellij
mkdir -p ~/.config/zellij
ln -srf $(pwd)/zellij/config.kdl ~/.config/zellij/config.kdl

# Zsh
ln -srf $(pwd)/zsh/.zshrc ~/.zshrc

#fc-cache -fv

