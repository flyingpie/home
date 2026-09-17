#/bin/bash

# Path to directory of this (link.sh) script:
H=$(dirname "$0")
# Path to parent dir:
H="$H/.."
# Turn relative path into absolute one:
H=$(realpath $H)

# Bin
#rm -rf ~/.local/bin
#ln -s $H/bin ~/.local/bin

# Git
#ln -srf $H/.gitconfig ~/.gitconfig

# LazyGit
#mkdir -p ~/.config/lazygit
#ln -srf $H/lazygit/config.yml ~/.config/lazygit/config.yml

# NVim
rm -rf ~/.config/nvim
ln -srf $H/mini/nvim ~/.config/nvim

# User
#ln -srf $H/mini/user/.profile ~/.bash_profile
#ln -srf $H/mini/user/.profile ~/.profile
#ln -srf $H/mini/user/.profile ~/.zshenv

# Zellij
#mkdir -p ~/.config/zellij
#ln -srf $H/zellij/config.kdl ~/.config/zellij/config.kdl

# Zsh
#ln -srf $H/mini/zsh/.zshrc ~/.zshrc
