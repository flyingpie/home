# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# Rust
CARGO_ENV="$HOME/.cargo/env"
if [ -f $CARGO_ENV ]; then
	. $CARGO_ENV
fi

# SSH Agent Socket for use by KeePassXC
# Only set if not set already (e.g. by SSH forwarding)
if [[ ${SSH_AUTH_SOCK:-"unset"} == "unset" ]]
then
	export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# PATH additions
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.home/bin"
export PATH="$PATH:$HOME/syncthing/apps/path"
export PATH="$PATH:$HOME/syncthing/work/apps/path"

# Disable .Net Telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Force locale
export LANG=en_US.UTF-8
export LANGUAGE=en_US
export LC_ALL=en_US.UTF-8
