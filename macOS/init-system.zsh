#!/bin/zsh
# ^ this is mac os default/system shell; not the one from brew
echo "### initializes a new stock mac os installation for my needs"
set -e 
set -x

if ! type "brew" > /dev/null; then
  zsh ./install-scripts/install-homebrew.sh
fi

zsh ./install-scripts/install-brew-utils.sh

zsh ./install-scripts/install-brew-cask-apps.sh

if ! type "rustup" > /dev/null; then
  sh ./install-scripts/install-rustup.sh
fi

sh ./install-scripts/install-cargo-utils.sh

zsh ./_init-homebrew-zsh.zsh
zsh ./_init-macos-defaults.zsh

echo "completely close your terminal application know and restart it again!"
