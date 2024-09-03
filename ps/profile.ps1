# Move to workspace.
Set-Location $env:WORKSPACE

$env:AutoSetName = $true

. "$PSScriptRoot\includes.ps1"

Set-PSReadLineKeyHandler -Key Tab -Function Complete

function prompt() {
	$currentFolder = $Pwd

	Write-Host $currentFolder -NoNewLine

	git branch | foreach {
		if ($_ -match "^\*(.*)") {
			$match = $matches[1].Trim()

			Write-Host " ($match)" -NoNewLine -Foreground Cyan
		}
	}

	if ($env:AutoSetName -eq $true) {
		$Host.UI.RawUI.WindowTitle = (Get-Item -Path .).Name
	}

	return [Environment]::NewLine + "> "
}

# Set and keep window title name.
function Name($Name) {
	if (!$Name) {
		$Name = (Get-Item -Path .).Name
	}

	$Host.UI.RawUI.WindowTitle = $Name

	$env:AutoSetName = $false
}
