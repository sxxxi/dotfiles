#!/bin/sh

# Please make sure the `HOME` variable is set properly and is pointing to the home directory of the user.

# Nvim config
# ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim

CONFIG="$HOME/.dotfiles/config"
DOTFILES_BAK_DIR=$HOME/.dotfiles/bak

main() {
	linkAppConfig
}

linkAppConfig() {
	# Zsh
	if [ $(basename $SHELL) == "zsh" ]; then
		confirmAndLink "$CONFIG/zsh/zprofile.sh" "$HOME/.zprofile";
		confirmAndLink "$CONFIG/zsh/zshrc.sh" "$HOME/.zshrc";
		[ ! -f ~/.hushlogin ] && touch ~/.hushlogin;
		# TODO: Maybe I should run source here? command might not catch nvim
	fi
	
	# Alacritty
	if [ -s /Applications/Alacritty.app ] || command -v alacritty; then 
		confirmAndLink "$CONFIG/alacritty" "$HOME/.config/alacritty";
	fi

	# Neovim
	[ $(command -v nvim) ] && confirmAndLink "$CONFIG/nvim" "$HOME/.config/nvim";
}

confirmAndLink() {
	local src="$1"
	local dest="$2"

	local existsAndNotLink=;

	[ -e $dest ] && [ ! -L $dest ] && existsAndNotLink=1; 

	echo "Link $src to $dest?[Y/n]: "
	[ $existsAndNotLink ] && echo "($dest will be saved in $DOTFILES_BAK_DIR.)";

	read response
	
	# If response empty or is either 'y' or 'Y' and is non-link file
	if [ -z $response ] || [ -n "$(echo $response | egrep '[yY]')" ]; then 
		[ $existsAndNotLink ] && bkup $dest;
		rm -r $dest
		ln -s $src $dest;
	fi
}

# Copy file OR directory to `DOTFILES_BAK_DIR`
bkup() {
    local file="$1"

	local isFileOrDir=
	local bkupPostfix=""

	# Make sure is file or directory
	if [ -e $dest ] && [ ! -L $dest ]; then
		isFileOrDir=1
		[ -f $dest ] && bkupPostfix=".bak"
	else
		echo "Nothing to do"
		return 1;
	fi

    # Make sure backup directory is present
	if [ ! -d $DOTFILES_BAK_DIR ]; then
        mkdir -p $DOTFILES_BAK_DIR
    fi

    # Write backup 
	local bak_file="$DOTFILES_BAK_DIR/$(date +%s)_$(rm_trailing "." $file)$bkupPostfix"
	cp -r $file $bak_file
}

rm_trailing() {
	local trailing="$1"
	local target="$2"	

	if [ "$(echo $target | egrep '^$trailing')" ]; then 
		target=${target:${#trailing}};
	fi

	return $target
}

main
