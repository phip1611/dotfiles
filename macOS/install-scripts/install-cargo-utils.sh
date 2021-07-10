#!/bin/zsh
# ^ this is mac os default/system shell; not the one from brew

echo "Installs common cargo binaries"
echo "make sure rustup/cargo is installed!"

cargo install \
    ansi-escape-sequences-cli \
    cargo-expand \
    cargo-outdated \
    cargo-update \
    bat \
    git-delta \
    exa \
    nflz \
    nu \
    paper-terminal \
    ttfb \ 
    tokei \
    wambo 

set -e 
set -x


