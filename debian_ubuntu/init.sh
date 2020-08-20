# EXECUTE THIS WITH BASH OR ZSH
# this creates simlinks into "~" to use the dotfiles.

# we wan't to get the absolute path to this file
ABS_DIR_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "This program will create links for all in $ABS_DIR_PATH to $HOME."
echo "Existing files will be deleted. Following files would be included:"
echo "  .gitconfig-template => .gitconfig"
echo "  .zshrc"
echo "  .vimrc"

function onConfirmed {
    ln -s $ABS_DIR_PATH/.zshrc ~
    ln -s $ABS_DIR_PATH/.vimrc ~
    cp $ABS_DIR_PATH/.gitconfig-template ~/.gitconfig
}

while true; do
    read -p "Do you wish to continue? [Y/n]" yn
    case $yn in
        [Yy]* ) onConfirmed; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


