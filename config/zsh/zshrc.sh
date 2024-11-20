# Enter tmux everytime
if [ "$TMUX" = "" ]; then 
	tmux a || tmux new -sGrind;
fi


# |=============================|
# |		Function Definitions	|
# |=============================|
git_branch() {
    local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
    if [[ -n "$branch" ]]; then
        echo "($branch)"
    fi
}

nvim_cust() {
	local starting=$PWD;
	local target=$1;

	# Just stop opening nvim when target does not exist
	if [ ! -e $target ]; then
		echo "File or directory \`$target\` does not exist.";
		return 0;
	fi

	# Enter nvim
	if [ -d $target ]; then
		cd $target && nvim;		# Prevent netrw from opening on startup
	else
		nvim $target;
	fi
	
	cd $starting;
}

# |=============================|
# |		System Variables    	|
# |=============================|
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

export PROMPT="%F{magenta}%n%f %F{white}%~%f %F{yellow}$(git_branch)%f %F{red}➤ %f"
export PHP_INI_SCAN_DIR="/Users/macmac/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH="/Users/macmac/.config/herd-lite/bin:$PATH"

# |=============================|
# |		       Aliases      	|
# |=============================|
alias ls="ls --color=auto"
alias nvim=nvim_cust
