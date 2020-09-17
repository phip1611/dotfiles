echo "make sure brew/homebrew is installed!"

brew update && brew upgrade

# install gnu utils
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep

brew install bat calc cmake cmatrix curl exa ffmpeg gcc git git-delta gpg htop maven micro node openjdk ripgrep tldr tree wget yarn zsh

brew install fortune cowsay lolcat

# cool statistics about code: https://github.com/xampprocky/tokei
brew install tokei

# modern replacement for "ps"
brew install procs
