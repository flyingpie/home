#!/bin/bash

ln -srf $(pwd)/krusaderrc ~/.config/krusaderrc

mkdir -p ~/.local/share/kxmlgui5/krusader
ln -srf $(pwd)/krusaderui.rc ~/.local/share/kxmlgui5/krusader/krusaderui.rc
