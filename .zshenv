if [[ "$ANTIGRAVITY_AGENT" -eq 1 ]]; then
	# Brew
	export PATH="/opt/homebrew/bin:$PATH"

	# Bun
	export PATH="$HOME/.bun/bin:$PATH"

	# PNPM
	export PATH="$HOME/Library/pnpm:$PATH"

	# fnm
	eval "$(fnm env --shell zsh)"

	# Others
	export PATH="$HOME/.local/bin:$PATH"
fi

# Rust
. "$HOME/.cargo/env"
