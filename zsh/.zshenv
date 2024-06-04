CARGO_ENV="$HOME/.cargo/env"

if [ -f $CARGO_ENV ]; then
	. $CARGO_ENV
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"


if [ -e /home/marco/.nix-profile/etc/profile.d/nix.sh ]; then . /home/marco/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
