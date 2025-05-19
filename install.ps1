# Scoop
#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add versions

scoop install main/eza
scoop install main/fd
scoop install main/lazygit
scoop install main/mingw
scoop install main/neovim
scoop install main/nodejs
scoop install main/python

#scoop install extras/rider
scoop install nerd-fonts/CascadiaMono-NF

#7zip
#bruno
#chromium
#docker
#doublecmd
#git
#keepassxc
#klogg
#maven
#neovide
#notepadplusplus
#nuget
#processhacker
#pwsh
#q-dir
#rustdesk
#sharex
#sunshine
#synctrayzor
#tailscale
#temurin11-jdk
#vlc
#vscode
#wezterm
#wireshark
