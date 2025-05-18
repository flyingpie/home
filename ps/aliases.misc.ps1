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

function b()	{ ./build.ps1 }
