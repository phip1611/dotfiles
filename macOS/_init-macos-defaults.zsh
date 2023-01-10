#!/bin/zsh

echo "### initializes MacOS default settings via CLI"
set -e 
set -x

# taken and adjusted from https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# thanks!

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# General UI/UX

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false


###############################################################################
# Screen 

# Save screenshots not on desktop
DIR=$HOME/Screenshots
mkdir -p $DIR
defaults write com.apple.screencapture location -string $DIR


###############################################################################
# Finder

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

###############################################################################
# Dock, Dashboard, and hot corners  

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false
# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true
# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 46

# Photos

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

###############################################################################
# Sytem UI

# Show Percent next to battery
defaults write com.apple.menuextra.battery ShowPercent -string YES
# Show date and seconds (this is the default string that also Mac OS Settings write here)
# seems like it can't be customized; mac internally only accepts a subset of all possible values
defaults write com.apple.menuextra.clock DateFormat -string "EEE d. MMM  HH:mm:ss"

# now let's add some extra menus that are not overed by 
# com.apple.menuextra.* and not displayed by default
# (these are the small icons on the top right, that give 
# quick access to bluetooth, volume etc.)
# available ones can be found here
# $ ls "/System/Library/CoreServices/Menu Extras" 
zsh ./_init-macos-defaults-extra-menus.zsh

###############################################################################
# kill all applications in order for them to get restarted and new settings are used
set +e # don't fail here; can happen if a process is currently not found
for app in \
    "cfprefsd" \
    "Dock" \
    "Finder" \
    "Photos" \
    "SystemUIServer"; do
    killall "${app}" &> /dev/null
done
set -e
echo "Done. Note that some of these changes require a logout/restart to take effect."
