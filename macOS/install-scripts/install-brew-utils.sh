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
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep less

# install utils that I also could get from cargo (Rust)
brew install bat exa git-delta

# install build and compile tools
brew install cmake gcc git maven node yarn

# install other utils
brew install calc curl ffmpeg gpg htop ripgrep tldr tree wget 

# install fun stuff
brew install fortune cowsay lolcat cmatrix

# install java / jdk
brew install \
    openjdk \
    openjdk@8 \
    openjdk@11

## stuff that I want to experiment with but that's not important

# cool statistics about code: https://github.com/xampprocky/tokei
brew install tokei

# modern replacement for "ps"
brew install procs
