$links = @{
	"nvim"							= $([IO.Path]::Combine($env:LocalAppData, "nvim"))
	"ps"							= $([IO.Path]::Combine([Environment]::GetFolderPath("MyDocuments"), "powershell"))
	"vscode/settings.json"			= $([IO.Path]::Combine($env:AppData, "Code", "User", "settings.json"))
	"vscode/keybindings.json"		= $([IO.Path]::Combine($env:AppData, "Code", "User", "keybindings.json"))
	"./vscode/settings.json"		= $([IO.Path]::Combine($env:UserProfile, "scoop", "apps", "vscode", "current", "data", "user-data", "User", "settings.json"))
	"./vscode/keybindings.json"		= $([IO.Path]::Combine($env:UserProfile, "scoop", "apps", "vscode", "current", "data", "user-data", "User", "keybindings.json"))
	"wezterm/win/wezterm.lua"		= $([IO.Path]::Combine($env:UserProfile, ".wezterm.lua"))
	"wt"							= $([IO.Path]::Combine($env:LocalAppData, "Packages", "Microsoft.WindowsTerminal_8wekyb3d8bbwe", "LocalState"))
	"wtq/win"						= $([IO.Path]::Combine($env:AppData, "wtq"))
}

foreach ($link in $links.Keys) {
	$src = [IO.Path]::GetFullPath([IO.Path]::Combine($pwd, $link))
	$dst = $($links[$link])

	"LINK: $src => $dst"

	if (Test-Path -Path $dst) {
		Remove-Item -Path $dst -Confirm:$false -Recurse
	}

	$dir = [IO.Path]::GetDirectoryName($dst)
	if (-not [IO.Directory]::Exists($dir)) {
		New-Item -ItemType Directory -Path $dir | Out-Null
	}

	New-Item -ItemType SymbolicLink -Path $dst -Target $src | Out-Null
}
