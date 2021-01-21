#!/bin/zsh
# ^ this is mac os default/system shell; not the one from brew

echo "Installs common cargo binaries"
echo "make sure rustup/cargo is installed!"

cargo install mac-sys-info cargo-expand cargo-update cargo-outdated nflz wambo

set -e 
set -x


