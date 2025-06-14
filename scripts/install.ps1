# Scoop
#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add sysinternals
scoop bucket add versions

scoop install main/eza
scoop install main/fd
scoop install main/lazygit
scoop install main/mingw
scoop install main/neovim
scoop install main/nodejs
scoop install main/python

scoop install extras/jetbrains-toolbox
scoop install extras/keepassxc
scoop install extras/klogg
scoop install extras/q-dir
scoop install extras/spotify
#scoop install extras/tailscale # Doesn't work properly yet, regular install for now
scoop install extras/wezterm
scoop install extras/wireshark

scoop install nerd-fonts/CascadiaMono-NF

scoop install sysinternals/process-explorer

#7zip
#bruno
#chromium
#docker
#doublecmd
#git
#klogg
#maven
#neovide
#notepadplusplus
#nuget
#processhacker
#pwsh
#rustdesk
#sharex
#sunshine
#synctrayzor
#temurin11-jdk
#vlc
#vscode
#wireshark
