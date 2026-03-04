# OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 3
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Zsh Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh Syntax Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Zoxide
eval "$(zoxide init zsh)"

# Corepack
export COREPACK_ENABLE_AUTO_PIN=0

# UV
. "$HOME/.local/bin/env"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# 1Password
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# PostgreSQL 17
export PATH="$HOMEBREW_PREFIX/opt/postgresql@17/bin:$PATH"

# History
# Do not record commands that start with a space
setopt HIST_IGNORE_SPACE

# Spicetify
export PATH=$PATH:/Users/nelson/.spicetify

# Alias
alias cz="czg"
alias cd="z"
alias ls="eza -la --git --no-permissions --no-user --no-time --no-filesize"
alias tree="eza --tree"
