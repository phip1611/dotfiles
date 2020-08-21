#!/usr/bin/bash

# EXECUTE THIS WITH BASH OR ZSH
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

echo "This program will create links for all in $ABS_DIR_PATH to $HOME."
echo "Existing files will be deleted. Following files would be included:"
echo "  .gitconfig-template => .gitconfig"
echo "  .zshrc"
echo "  .vimrc"

function onConfirmed {
    ln -fs $ABS_DIR_PATH/.zshrc ~
    ln -fs $ABS_DIR_PATH/.vimrc ~
    cp -f $ABS_DIR_PATH/.gitconfig-template ~/.gitconfig

    echo "execute: 'source ~/.zshrc'"
}

while true; do
    read -p "Do you wish to continue? [Y/n]" yn
    case $yn in
        [Yy]* ) onConfirmed; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


