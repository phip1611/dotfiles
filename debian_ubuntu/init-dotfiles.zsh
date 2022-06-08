#!/usr/bin/zsh

# EXECUTE THIS WITH ZSH ONLY!!

# this creates simlinks into "~" to use the dotfiles.


# we wan't to get the absolute path to this file so that we can run
# this also from another directory; even if here stands bash,
# zsh works with this
ABS_DIR_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

sh ~/dotfiles/common/install-zsh-users-plugins.sh

echo "This script will create links for all dotfiles in $ABS_DIR_PATH to $HOME."
echo "Existing files will be deleted. Following files would be included:"
echo "  .gitconfig-template => ~/.gitconfig"
echo "  .tmux.conf => ~/.tmux.conf"
echo "  .vimrc => ~/.vimrc"
echo "  .zshrc => ~/.zshrc"


read "response?Are you sure ? [Y/n] "
response=${response:l} #tolower
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
    cp -f $ABS_DIR_PATH/.gitconfig-template ~/.gitconfig
    ln -fs $ABS_DIR_PATH/.tmux.conf ~
    ln -fs $ABS_DIR_PATH/.vimrc ~
    ln -fs $ABS_DIR_PATH/.zshrc ~
    
    echo "execute: 'source ~/.zshrc'" 
fi

