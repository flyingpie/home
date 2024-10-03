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
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# PATH additions
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/syncthing/apps/path:$PATH"
