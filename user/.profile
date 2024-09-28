# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

CARGO_ENV="$HOME/.cargo/env"

if [ -f $CARGO_ENV ]; then
	. $CARGO_ENV
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
. "$HOME/.cargo/env"

export DOTNET_ROOT=$HOME/.dotnet

export PATH="$PATH:$HOME/cloud/apps/path"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"
