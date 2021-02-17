#!/bin/zsh
# ^ this is mac os default/system shell; not the one from brew

echo "make sure brew/homebrew is installed!"
echo "this script installs all my brew cask apps"

set -e 
set -x

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew update && brew upgrade

brew install --cask \
    "adobe-acrobat-reader" \
    "clion" \
    "discord" \
    "docker" \
    "firefox" \
    "gimp" \
    "google-chrome" \
    "google-photos-backup-and-sync" \
    "intellij-idea" \
    "istumbler" \
    "iterm2" \
    "pgadmin4" \
    "postman" \
    "signal" \
    "spotify" \
    "steam" \
    "teamviewer" \
	"telegram-desktop" \
    "tunnelblick" `#openvpn for tu dresden` \
    "visual-studio-code" \
    "wireshark" \
    "zotero"

# virtual box is special because it may requires special consent 
# by macs system security system
brew install --cask "virtualbox" 

# remove old packages (also from cask)
brew cleanup
