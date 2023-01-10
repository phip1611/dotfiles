#!/bin/zsh

echo "### initializes a new stock mac os installation for my needs"
set -e 
set -x

if ! type "brew" > /dev/null; then
  zsh ./install-scripts/install-homebrew.sh
fi

if ! [ -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
fi

# Enable font installation
# https://github.com/Homebrew/homebrew-cask-fonts
brew tap homebrew/cask-fonts 
brew install font-source-code-pro

zsh ./install-scripts/install-brew-utils.sh

zsh ./_init-macos-defaults.zsh

zsh ./install-scripts/install-brew-cask-apps.sh

if ! type "rustup" > /dev/null; then
  sh ./install-scripts/install-rustup.sh
fi

zsh ./_init-homebrew-zsh.zsh

sh ./install-scripts/install-cargo-utils.sh

echo "completely close your terminal application know and restart it again!"
