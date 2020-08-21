#!/usr/bin/zsh

# EXECUTE THIS WITH ZSH ONLY!!

# this creates simlinks into "~" to use the dotfiles.


# I wanted to verify that this is only run with BASH or ZSH but
# this doesn't work because the verification doesn't run in sh :D
# because when SH runs it executes ln -fs without confirmation
#PID=$$
#EXECUTING_SHELL_PATH=$(readlink /proc/$PID/exe)
#if [[ ! EXECUTING_SHELL_PATH == *"zsh" ]] || [[ ! EXECUTING_SHELL_PATH == *"bash" ]]; then
#  echo "Please use bash or zsh to execute this file!"
#fi

# we wan't to get the absolute path to this file
ABS_DIR_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

sh ~/dotfiles/common/install-zsh-users-plugins.sh

echo "This script will create links for all dotfiles in $ABS_DIR_PATH to $HOME."
echo "Existing files will be deleted. Following files would be included:"
echo "  .gitconfig-template => ~/.gitconfig"
echo "  .zshrc => ~/.zshrc"
echo "  .vimrc => ~/.vimrc"


read "response?Are you sure ? [Y/n] "
response=${response:l} #tolower
if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
    ln -fs $ABS_DIR_PATH/.zshrc ~
    ln -fs $ABS_DIR_PATH/.vimrc ~
    cp -f $ABS_DIR_PATH/.gitconfig-template ~/.gitconfig
    
    echo "execute: 'source ~/.zshrc'" 
fi

