# Run cake build from current directory.
function cake ($target) {
	if ($target) {
		. ".\build.ps1" -Target $target
	} else {
		. ".\build.ps1"
	}
}

# Force-kill process.
function die($processName) {
	& "taskkill" /f /im $processName
}

# Nvim.
Set-Alias -Name vim -Value nvim -Option AllScope

# Run command as administrator.
function sudo() {
	Start-Process -Verb RunAs -FilePath "pwsh" -ArgumentList (@("-NoExit", "-Command") + $args)
}
