param (
	[switch] $Full
)

# Scoop
# TODO: Check if installed
#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Buckets
scoop bucket add extras
scoop bucket add nerd-fonts
scoop bucket add sysinternals
scoop bucket add versions

# Apps
scoop install main/7zip
scoop install main/docker
scoop install main/dotnet-sdk
scoop install main/eza
scoop install main/fd
scoop install main/fzf
scoop install main/gzip
scoop install main/git
scoop install main/lua
scoop install main/luarocks
scoop install main/maven
scoop install main/mingw
scoop install main/neovim
scoop install main/nodejs
scoop install main/nuget
scoop install main/pwsh
scoop install main/python
scoop install main/ripgrep
scoop install main/unzip
scoop install main/wget

scoop install extras/doublecmd
scoop install extras/keepassxc
scoop install extras/klogg
scoop install extras/lazygit
scoop install extras/notepadplusplus
scoop install extras/q-dir
scoop install extras/sharex
scoop install extras/vcredist
scoop install extras/wezterm
scoop install extras/windows-terminal
scoop install extras/winspy

scoop install nerd-fonts/CascadiaMono-NF

scoop install sysinternals/process-explorer

scoop install versions/dotnet-sdk-lts
scoop install versions/systeminformer

# Extras
if ($Full) {
	scoop install extras/bruno
	scoop install extras/chromium
	scoop install extras/jetbrains-toolbox
	scoop install extras/spotify
	scoop install extras/synctrayzor
	#scoop install extras/tailscale # Doesn't work properly yet, regular install for now
	scoop install extras/vscode
	scoop install extras/wireshark
}

scoop update *

# TODO
#scoop install versions/temurin11-jdk
