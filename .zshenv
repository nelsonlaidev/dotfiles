# Brew
export PATH="/opt/homebrew/bin:$PATH"

# Bun
export PATH="$HOME/.bun/bin:$PATH"

# PNPM
export PATH="$HOME/Library/pnpm:$PATH"

# Rust
. "$HOME/.cargo/env"

# fnm
eval "$(fnm env)"

# Others
export PATH="$HOME/.local/bin:$PATH"
