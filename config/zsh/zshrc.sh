# Source global definitions
[ -f /etc/zshrc ] && source /etc/zshrc

if [ -d /opt/homebrew ]; then
	export BREW_HOME="/opt/homebrew"
	export PATH="$BREW_HOME/bin:$BREW_HOME/sbin:$PATH"
fi

# Node Version Manager
if [ $(command -v nvm) ]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

export PATH="/Users/macmac/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/macmac/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# Configure prompt
git_branch() {
    local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
    if [[ -n "$branch" ]]; then
        echo "($branch)"
    fi
}

PROMPT="%F{magenta}%n%f %F{white}%~%f %F{yellow}$(git_branch)%f %F{red}➤ %f"

# Alias
alias ls="ls --color=auto"
