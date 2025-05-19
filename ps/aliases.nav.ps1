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

# Less
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
		--time-style long-iso $args
}

Set-Alias -Name ls -Value lst -Option AllScope

# Location shortcuts
function st()	{ Set-Location $env:SYNCTHING }
function ws()	{ Set-Location $env:WORKSPACE }
function wsf()	{ Set-Location $([IO.Path]::Combine($env:WORKSPACE, "flyingpie")) }

# Move up $levels.
function up1()	{ Set-Location .. }
function up2() 	{ Set-Location ../.. }
function up3() 	{ Set-Location ../../.. }
function up4() 	{ Set-Location ../../../.. }

# Exit terminal.
function x()	{ Exit }
