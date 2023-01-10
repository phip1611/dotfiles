#!/bin/zsh

echo "installs necessary tools for embedded development (openocd, arm eabi gcc)"
echo "install homebrew first!"

set -e 
set -x

# install brew tap ArmMbed/homebrew-formulae
#brew tap ArmMbed/homebrew-formulae
#brew install arm-none-eabi-gcc
# afterwards "arm-none-eabi-gcc" is a standalone binary
brew install --cask gcc-arm-embedded

# builds open-ocd from source to have the latest boards available
brew install --HEAD open-ocd

echo "Enter in CLion the following path for OpenOCD (realpath $(which openocd)):"
realpath $(which openocd)
