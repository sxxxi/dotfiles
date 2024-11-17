# System path
export PATH="/usr/local/bin:/usr/bin:$HOME/.local/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# JetBrains bullshit
if [ $(uname) = "Darwin" ]; then
	JB_SCRIPTS="$HOME/Library/Application Support/JetBrains/Toolbox/scripts";	# OSX
else
	JB_SCRIPTS="$HOME.local/share/JetBrains/Toolbox/scripts";					# The day write code on Windows is the day I crush my left nut
fi

# Only append JetBrains script path to PATH if exists
[ -d $JB_SCRIPTS ] && export PATH="$JB_SCRIPTS:$PATH";

# SSH agent
if [ -z $SSH_AUTH_SOCK ] && ! pgrep -u $USER ssh-agent > /dev/null;
then
	eval $(ssh-agent -s);
fi

# Source user definition
# [ -f ~/.zshrc ] && source ~/.zshrc;
