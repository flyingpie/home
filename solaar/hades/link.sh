#!/bin/bash

# Native
rm -rf ~/.config/solaar
ln -srT $(pwd) ~/.config/solaar
ln -sf /usr/share/applications/solaar.desktop ~/.config/autostart

# Flatpak
#rm -rf ~/.var/app/io.github.pwr_solaar.solaar/config/solaar
#ln -srT $(pwd) ~/.var/app/io.github.pwr_solaar.solaar/config/solaar

sudo ln -srf $(pwd)/udev.rules /etc/udev/rules.d/42-logitech-unify-permissions.rules
sudo chown $USER /dev/uinput
sudo udevadm control --reload-rules
