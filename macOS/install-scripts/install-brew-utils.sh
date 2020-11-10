#!/bin/zsh
# ^ this is mac os default/system shell; not the one from brew

echo "make sure brew/homebrew is installed!"

set -e 
set -x

brew update && brew upgrade

# install a convenient terminal editor first
brew install micro

# replace mac os zsh with latest version
brew install zsh

# install gnu utils
brew install coreutils findutils diffutils
brew install gnu-tar gnu-sed gawk gnupg gnutls gnu-indent gnu-getopt 
brew install grep less

# install utils that I also could get from cargo (Rust)
# this has the advantage that this is faster and automatically updated
# Cargo downloads and compiles them everytime
#   - git delta ("delta") is configured as pager of git 
brew install bat exa git-delta

# install build and compile tools
brew install make cmake gcc git maven node yarn

# install other utils
brew install \
    calc \
    curl \
    ffmpeg \
    httpie \
    htop \
    imagemagick \
    prettyping `# cool ping alternative` \
    ripgrep \
    tldr \
    tree \
    webp \
    wget 

# install java / jdk
brew install \
    openjdk \
    openjdk@8 \
    openjdk@11

# install fun stuff
brew install fortune cowsay lolcat cmatrix

## stuff that I want to experiment with but that's not important

# cool statistics about code: https://github.com/xampprocky/tokei
brew install tokei

# modern replacement for "ps"
brew install procs

# remove old packages (also from cask)
brew cleanup
