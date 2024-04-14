CARGO_ENV="$HOME/.cargo/env"

if [ -f $CARGO_ENV ]; then
	echo "sourcing '$CARGO_ENV'"
	. $CARGO_ENV
fi

