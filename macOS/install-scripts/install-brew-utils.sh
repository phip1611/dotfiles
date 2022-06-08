#!/bin/zsh
# ^ this is mac os default/system shell; not the one from brew

echo "make sure brew/homebrew is installed!"

set -e
set -x

brew update && brew upgrade

### INFO
# All utilities available on crates.io are installed from there
# and not through brew.

# install a convenient terminal editor first
brew install micro

# replace mac os zsh with latest version
brew install zsh

# install gnu utils
brew install coreutils findutils diffutils
brew install gnu-tar gnu-sed gawk gnupg gnutls gnu-indent gnu-getopt
brew install grep less

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
    tmux \
    tree \
    webp \
    wget

# install java / jdk
brew install \
    openjdk \
    openjdk@8 \
    openjdk@11

# set up openjdk in a way that the Mac OS Java System Wrapper can find it
# to find this command, exec: `$ brew info openjdk@11`
sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# install fun stuff
brew install fortune cowsay lolcat cmatrix

# modern replacement for "ps"
brew install procs

# remove old packages
brew cleanup
