CARGO_ENV="$HOME/.cargo/env"

if [ -f $CARGO_ENV ]; then
	. $CARGO_ENV
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export PATH="$PATH:$HOME/cloud/apps/path"
export PATH=$HOME/.dotnet:$PATH
