# OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 3
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Zsh Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh Syntax Highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -U add-zsh-hook

load-nvmrc() {
	local nvmrc_path
	nvmrc_path="$(nvm_find_nvmrc)"

	if [ -n "$nvmrc_path" ]; then
		local nvmrc_node_version
		nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

		if [ "$nvmrc_node_version" = "N/A" ]; then
			nvm install
		elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
			nvm use
		fi
	elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
		echo "Reverting to nvm default version"
		nvm use default
	fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Zoxide
eval "$(zoxide init zsh)"

# Corepack
export COREPACK_ENABLE_AUTO_PIN=0

# UV
. "$HOME/.local/bin/env"

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# 1Password
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-24.jdk/Contents/Home"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# LM Studio CLI
export PATH="$PATH:$HOME/.lmstudio/bin"

# Alias
alias pn=pnpm
alias cd=z
alias cz=czg
alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"

# History
# Do not record commands that start with a space
setopt HIST_IGNORE_SPACE
