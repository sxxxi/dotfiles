# |=============================|
# |		System Variables    	|
# |=============================|
[ -f /etc/zshrc ] && source /etc/zshrc

if [ -d /opt/homebrew ]; then
	export BREW_HOME="/opt/homebrew"
	export PATH="$BREW_HOME/bin:$BREW_HOME/sbin:$PATH"
fi

# Node Version Manager
if [ -s $HOME/.nvm ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/macmac/.bun/_bun" ] && source "/Users/macmac/.bun/_bun"		# bun completions

# php
export PHP_INI_SCAN_DIR="/Users/macmac/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH="/Users/macmac/.config/herd-lite/bin:$PATH"

# postgres
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Configure shell UI and shit
. ~/.dotfiles/.config/.myshell
