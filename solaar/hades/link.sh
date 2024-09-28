#!/bin/bash

rm -rf ~/.config/solaar
ln -srT $(pwd) ~/.config/solaar
ln -sf /usr/share/applications/solaar.desktop ~/.config/autostart

sudo cp -f $(pwd)/udev.rules /etc/udev/rules.d/42-logitech-unify-permissions.rules
sudo chown $USER /dev/uinput
sudo udevadm control --reload-rules
