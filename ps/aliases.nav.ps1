# Clear screen.
function c() {
	Clear-Host
}

# Emulate Linux-style "cd", that moves to the user home directory when "cd" is used without parameters.
function cdt ($path) {
	Clear-Host

	if (!$path) {
		Set-Location $env:userprofile
	} else {
		Set-Location $path
	}

	lst
}

Set-Alias -Name cd -Value cdt -Option AllScope

# Less.
Set-Alias -Name less -Value more -Option AllScope

# List, using Eza
function lst() {
	eza `
		--oneline `
		--long `
		--all `
		--binary `
		--color-scale `
		--group `
		--group-directories-first `
		--header `
		--icons `
		--modified `
		--octal-permissions `
		--time-style long-iso
}

Set-Alias -Name ls -Value lst -Option AllScope

# Go to SYNCTHING root.
function st() {
	Set-Location $env:SYNCTHING
}

# Got to WORKSPACE root.
function ws() {
	Set-Location $env:WORKSPACE
}

# Move up $levels.
function up($levels) {
	for ($i = 0; $i -lt $levels; $i++) {
		cd ..
	}
}

# Exit terminal.
function x() {
	Exit
}
