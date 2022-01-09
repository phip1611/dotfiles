#!/bin/zsh
# ^ this is mac os default/system shell; not the one from brew

echo "Installs common cargo binaries"
echo "make sure rustup/cargo is installed!"

cargo install \
    ansi-escape-sequences-cli \
    bat \
    bottom \
    cargo-expand \
    cargo-license \
    cargo-msrv \
    cargo-outdated \
    cargo-update \
    cargo-watch \
    du-dust \
    git-delta \
    gitui \
    exa \
    nflz \
    nu \
    paper-terminal \
    ttfb \ 
    tokei \
    wambo 

set -e 
set -x


