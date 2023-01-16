#!/bin/zsh

echo "Installs common cargo binaries"
echo "make sure rustup/cargo is installed!"

cargo install \
    ansi-escape-sequences-cli \
    `# bat` \
    `# bottom` \
    cargo-expand \
    cargo-license \
    cargo-msrv \
    cargo-outdated \
    cargo-update \
    cargo-watch \
    `# du-dust` \
    `# exa` \
    `# git-delta` \
    gitui \
    nflz \
    `# nu` \
    paper-terminal \
    paging-calculator \
    ttfb \ 
    tokei \
    wambo

set -e
set -x


