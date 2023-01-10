#!/bin/zsh

echo "### initializes the zsh installed by brew as default shell for the current user"
set -e 
set -x


BREW_ZSH_LOCATION=/usr/local/bin/zsh
brew install zsh


set +x
# -F: interpret pattern as a set of fixed strings
# -x: die ganze line muss gegen den Wert matchen
# -q: quiet
if grep -Fxq "$BREW_ZSH_LOCATION" "/etc/shells";
then
	set -x
    echo "'$BREW_ZSH_LOCATION' (zsh by brew) is already in /etc/shells"
else
	set -x
    echo "append '$BREW_ZSH_LOCATION' (zsh by brew) to /etc/shells"
    sudo sh -c "echo $BREW_ZSH_LOCATION >> /etc/shells"
fi

set +x
if [ "$SHELL" != "$BREW_ZSH_LOCATION" ];
then
    echo "set '$BREW_ZSH_LOCATION' (zsh by brew) as default shell of the current user"
    set -x
    chsh -s /usr/local/bin/zsh
else
    echo "'$BREW_ZSH_LOCATION' (zsh by brew) is already the default shell of the user"
fi


# this was needed when I set my mac book up the last time
 echo "updating some file permissions in /usr/local/share/zsh:"
sudo chmod 0755 /usr/local/share/zsh
sudo chmod 0755 /usr/local/share/zsh/site-functions
