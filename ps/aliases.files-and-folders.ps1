# Make symlink ("junction").
function mklink($link, $target) {
	New-Item -Path $link -ItemType SymbolicLink -Value $target
}

# Recursively remove empty directories.
function remove-empty() {
	Get-ChildItem -recurse `
		| Where {$_.PSIsContainer -and @(Get-ChildItem -Lit $_.Fullname -r `
		| Where {!$_.PSIsContainer}).Length -eq 0} `
		| Remove-Item -recurse
}

# Recursively remove directory.
function rmdir($path) {
	Remove-Item -Force -Recurse -Path $path
}

# Print and follow contents of a file.
function tail($path) {
	Get-Content -Path $path -Wait
}
