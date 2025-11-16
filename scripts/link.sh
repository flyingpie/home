#/bin/bash

# Path to directory of this (link.sh) script:
H=$(dirname "$0")
# Path to parent dir:
H="$H/.."
# Turn relative path into absolute one:
H=$(realpath $H)

# Bin
rm -rf ~/.local/bin
ln -s $H/bin ~/.local/bin

# Dolphin
ln -srf $H/dolphin/dolphinrc ~/.config/dolphinrc

# Fonts
rm -rf ~/.local/share/fonts
mkdir -p ~/.local/share
ln -srf $H/fonts ~/.local/share/fonts

# Git
# ln -srf $H/.gitconfig ~/.gitconfig

# Ghostty
rm -rf ~/.config/ghostty
ln -srf $H/ghostty ~/.config/ghostty

# JetBrains - DataGrip
mkdir -p ~/.config/JetBrains/DataGrip2025.1
ln -srf $H/datagrip/idea.properties ~/.config/JetBrains/DataGrip2025.1/idea.properties

# JetBrains - IDEA
mkdir -p ~/.config/JetBrains/IntelliJIdea2025.2
ln -srf $H/idea/idea.properties ~/.config/JetBrains/IntelliJIdea2025.2/idea.properties

# JetBrains - Rider
mkdir -p ~/.config/JetBrains/Rider2025.2
ln -srf $H/rider/idea.properties ~/.config/JetBrains/Rider2025.2/idea.properties

mkdir -p ~/.config/JetBrains/Rider2025.3
ln -srf $H/rider/idea.properties ~/.config/JetBrains/Rider2025.3/idea.properties

# Kando
mkdir -p ~/.config/kando
ln -srf $H/kando/config.json	~/.config/kando/config.json
ln -srf $H/kando/menus.json		~/.config/kando/menus.json
mkdir -p ~/.var/app/menu.kando.Kando/config/kando
ln -srf $H/kando/config.json	~/.var/app/menu.kando.Kando/config/kando/config.json
ln -srf $H/kando/menus.json		~/.var/app/menu.kando.Kando/config/kando/menus.json

# Krita
ln -srf $H/krita/kritadisplayrc ~/.config
ln -srf $H/krita/kritarc ~/.config
ln -srf $H/krita/kritashortcutsrc ~/.config

# Krusader
ln -srf $H/krusader/krusaderrc ~/.config/krusaderrc

mkdir -p ~/.local/share/kxmlgui5/krusader
ln -srf $H/krusader/krusaderui.rc ~/.local/share/kxmlgui5/krusader/krusaderui.rc

# LazyGit
mkdir -p ~/.config/lazygit
ln -srf $H/lazygit/config.yml ~/.config/lazygit/config.yml

# NVim
rm -rf ~/.config/nvim
# ln -srf $H/nvim ~/.config/nvim
ln -srf $H/nvim-v2 ~/.config/nvim
# mkdir -p ~/.var/app/io.neovim.nvim/config/nvim
# ln -srf $H/nvim ~/.var/app/io.neovim.nvim/config/nvim
ln -srf $H/nvim/.ideavimrc ~/.ideavimrc

# PowerShell
rm -rf ~/.config/powershell
ln -srf $H/ps ~/.config/powershell

# Rofi
rm -rf ~/.config/rofi
ln -srf $H/rofi ~/.config/rofi

# Solaar
rm -rf ~/.config/solaar
ln -srT $H/solaar ~/.config/solaar
ln -sf /usr/share/applications/solaar.desktop ~/.config/autostart

sudo cp -f $H/solaar/udev.rules /etc/udev/rules.d/42-logitech-unify-permissions.rules
sudo chown $USER /dev/uinput
sudo udevadm control --reload-rules

# SSH Agent
mkdir -p ~/.config/systemd/user
ln -srf $H/ssh/ssh-agent.service ~/.config/systemd/user/ssh-agent.service

# TMux
ln -srf $H/tmux/.tmux.conf ~/.tmux.conf

# User
ln -srf $H/user/.profile ~/.bash_profile
ln -srf $H/user/.profile ~/.profile
ln -srf $H/user/.profile ~/.zshenv

# VSCode
rm -rf  ~/.config/Code/User/
mkdir -p ~/.config/Code/User/
ln -s $H/vscode/keybindings.json ~/.config/Code/User/keybindings.json
ln -s $H/vscode/settings.json ~/.config/Code/User/settings.json

rm -rf ~/.var/app/com.vscodium.codium/config/VSCodium/User/
mkdir -p ~/.var/app/com.vscodium.codium/config/VSCodium/User/
ln -s $H/vscode/keybindings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json
ln -s $H/vscode/settings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json

# Wezterm
mkdir -p ~/.config/wezterm
ln -srf $H/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua

# WTQ
mkdir -p ~/.config/wtq
ln -srf $H/wtq/wtq.jsonc ~/.config/wtq/wtq.jsonc
ln -srf $H/wtq/wtq.jsonc ~/.var/app/nl.flyingpie.wtq/config/wtq/wtq.jsonc

# Zed
rm -rf ~/.config/zed
ln -srf $H/zed ~/.config/zed

# Zellij
mkdir -p ~/.config/zellij
ln -srf $H/zellij/config.kdl ~/.config/zellij/config.kdl

# Zsh
ln -srf $H/zsh/.zshrc ~/.zshrc
