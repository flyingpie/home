function tty($machine) {
	if (!$machine) {
		"Please specify an address";
		return
	}

	$Host.UI.RawUI.WindowTitle = $machine

	& "wsl" ssh "marco@$($machine)"
}

function upl($dir) {
	& "scp" -r $dir marco@lnx201:workspace
}

function ddeb() {
	$env:DOCKER_HOST="tcp://192.168.178.80:2375"
}
