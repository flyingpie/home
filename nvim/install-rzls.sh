#!/bin/bash

if ! command -v unzip &> /dev/null
then
    echo "unzip is required. Please install it"
    exit 1
fi

rid="linux-x64"
targetDir="$HOME/.local/share/nvim/rzls"
latestVersion=$(curl -s https://api.github.com/repos/Crashdummyy/rzls/releases | grep tag_name | head -1 | cut -d '"' -f4)

[[ -z "$latestVersion" ]] && echo "Failed to fetch the latest package information." && exit 1

echo "Latest version: $latestVersion"

asset=$(curl -s https://api.github.com/repos/Crashdummyy/rzls/releases | grep "releases/download/$latestVersion" | grep "$rid"| cut -d '"' -f 4)

echo "Downloading: $asset"

curl -Lo "./rzls.zip" "$asset"

echo "Remove old installation"
rm -rf $targetDir/*

unzip "./rzls.zip" -d "$targetDir/"
rm "./rzls.zip"
