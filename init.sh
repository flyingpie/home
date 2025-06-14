#!/bin/bash

# Stop on error
set -e

echo "Pulling submodules"
git submodule update --init

echo "Linking settings files"
./scripts/link.sh

echo "Setting default shell to zsh"
sudo chsh -s $(which zsh) $(whoami) &> /dev/null # We don't _need_ sudo, but it prevents asking for a password
