#!/bin/zsh
# ^ this is mac os default/system shell; not the one from brew
echo "installs rustup toolchain"
set -e 
set -x


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
