# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 3
plugins=(git)
source $ZSH/oh-my-zsh.sh

# zsh autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zoxide
if [[ "$CLAUDECODE" != "1" ]]; then
	eval "$(zoxide init zsh)"
	alias cd="z"
fi

# uv
. "$HOME/.local/bin/env"

# mise
eval "$(mise activate zsh)"

# 1Password
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# history
# do not record commands that start with a space
setopt HIST_IGNORE_SPACE

# aliases
alias cz="czg"
alias ls="eza -la --git --no-permissions --no-user --no-time --no-filesize"
alias tree="eza --tree"
alias bdump="brew bundle dump --brews --casks --taps --cargo --force"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"
