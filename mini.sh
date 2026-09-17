#/bin/bash

# Path to directory of this (mini.sh) script:
H=$(dirname "$0")

# Turn relative path into absolute one:
H=$(realpath $H)

echo "Pulling submodules"
git submodule update --init

echo "Linking settings files"

# Git
ln -srf $H/.gitconfig-mini $HOME/.gitconfig

# NVim
rm -rf $HOME/.config/nvim
ln -srf $H/nvim-mini $HOME/.config/nvim

# User
ln -srf $H/user/.profile $HOME/.bash_profile
ln -srf $H/user/.profile $HOME/.profile
ln -srf $H/user/.profile $HOME/.zshenv

# Zellij
rm -rf $HOME/.config/zellij
ln -srf $H/zellij $HOME/.config/zellij

# Zsh
ln -srf $H/zsh/.zshrc $HOME/.zshrc

echo "Setting default shell to zsh"
sudo chsh -s $(which zsh) $(whoami) &>/dev/null # We don't _need_ sudo, but it prevents asking for a password
